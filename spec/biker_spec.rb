require './lib/ride'
require './lib/biker'

RSpec.describe Biker do 
  describe '#initialize' do 
    it 'exists and has readable attributes' do 
      biker = Biker.new("Kenny", 30)

      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to eq({})
      expect(biker.acceptable_terrain).to eq([])
    end
  end

  describe '#learn_terrain!' do 
    it 'can learn new terrain and add to acceptable terrain array' do 
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end
end