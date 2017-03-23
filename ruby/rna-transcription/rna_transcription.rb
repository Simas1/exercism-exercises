module BookKeeping
  VERSION = 4
end

class Complement
  DNA_RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }
  def self.of_dna(dna)
    return '' unless dna.match(/^[GCTA]*$/)
    dna.chars.map { |n| DNA_RNA[n] }.join
  end
end
