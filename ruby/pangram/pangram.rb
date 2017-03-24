module BookKeeping
  VERSION = 4
end

class Pangram
  ALPHABET = ('a'..'z').to_a
  def self.pangram?(sentence)
    (ALPHABET - sentence.downcase.chars).empty?
  end
end
