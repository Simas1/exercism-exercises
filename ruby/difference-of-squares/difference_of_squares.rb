module BookKeeping
  VERSION = 3
end

class Squares
  attr_reader :square_of_sum, :sum_of_squares, :difference

  def initialize(number)
    @number = number
    if number > 0
      #@square_of_sum = (1..number).reduce(:+)**2
      @square_of_sum = (1..number).inject {|sum, n| sum + n } **2
      @sum_of_squares = (1..number).reduce { |sum, number| sum + (number ** 2) }
      @difference = square_of_sum - sum_of_squares
    else
      @square_of_sum, @sum_of_squares, @difference = [0, 0, 0]
    end
  end
end

bla = Squares.new(10)
puts bla.square_of_sum
puts bla.sum_of_squares
puts bla.difference

