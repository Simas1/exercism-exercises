class Animal
  attr_reader :height, :weight

  def initialize
    puts "New animal"
  end

  def name # get
    @name
  end

  def name=(new_name) #set
    if new_name.is_a?(Numeric)
      puts "No numbers"
    else
      @name = new_name
    end
  end
end

cat = Animal.new
cat.name = 'Peekaboo'
puts cat.name

bla = Animal.new
# bla.height = "Shit"
puts bla.height
