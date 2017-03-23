module BookKeeping
  VERSION = 5
end

class Gigasecond
  GIGASECOND = 10**9
  def self.from(moment)
    moment + GIGASECOND
  end
end
