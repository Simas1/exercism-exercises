module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError, 'Strands do not match in length' unless strand1.length == strand2.length
    strand1.chars.zip(strand2.chars).count { |chr1, chr2| chr1 != chr2 }
  end
end
