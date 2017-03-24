require 'spec_helper'

describe Raindrops do
  describe '#new 30' do
    before :each do
      @rdrop = Raindrops.new(30)
    end
    it 'create Raindrops object' do
        expect(@rdrop).to be_an_instance_of Raindrops
    end
    it 'check vocabulary' do
      vocabulary = {
        3 => 'Pling',
        5 => 'Plang',
        7 => 'Plong'
      }
      expect(Raindrops::VOCABULARY).to eql vocabulary
    end
    it 'check number' do
        expect(@rdrop.number).to eql 30
    end
    it 'check factors' do
        expect(@rdrop.factors.join(',')).to eql '1,2,3,5,6,10,15,30'
    end
    it 'check speak' do
        expect(@rdrop.speak).to eql 'PlingPlang'
    end
  end
  describe '.convert 1' do
    it 'return 1' do
      expect(Raindrops.convert(1)).to eql '1'
    end
  end
  describe '.convert 3' do
    it 'return Pling' do
      expect(Raindrops.convert(3)).to eql 'Pling'
    end
  end
  describe '.convert 5' do
    it 'return Plang' do
      expect(Raindrops.convert(5)).to eql 'Plang'
    end
  end
end
