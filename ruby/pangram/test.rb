class Person
  def initialize(name)
    @name = name
    @surname = "Master"
  end

  def to_s
    @name
  end

  def inspect
    "Person(name: #{@name}, surname: #{@surname}, object_id: #{"0x00%x" % (object_id << 1)})"
  end
end

puts "What is your name? "
person = Person.new('Simonas')
puts "Hello \n #{person}"
puts person.to_s
puts person.inspect
# puts person.methods

# sentence = "Einam mes namo bc".chars
# alphabet = ('a'..'c').to_a
# pangram = (alphabet - sentence).empty?
# puts pangram

sleep(1)
