module BookKeeping
  VERSION = 3
end

class Raindrops
  attr_reader :factors, :speak # get

  VOCABULARY = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def initialize(n = 0)
    self.number = n unless n == 0
  end

  def number #get
    @number
  end

  def number=(n) #set
    @number = n
    @factors = get_factors(n)

    raindrop_speak = @factors.map { |f| VOCABULARY[f] }.join
    @speak = raindrop_speak.empty? ? n.to_s : raindrop_speak
  end

  private
  def get_factors(n)
    factors = []
    (1..n).each do |i|
      factors.push i if n % i == 0
    end
    factors
  end

  def self.convert(n)
    new(n).speak
  end
end

# puts Raindrops.convert(30)

# voice = Raindrops.new(30)
# puts voice.number
# puts voice.factors.join(',')
# puts voice.speak
