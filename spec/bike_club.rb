require './lib/biker'
require './lib/ride'
require './lib/bike_club'

RSpec.describe BikeClub do 
  describe '#initialize' do 
    it 'exists and has readable attributes' do 
      bikeclub1 = BikeClub.new("Mikes on Bikes")
      biker1 = Biker.new("Mike", 15)
      biker2 = Biker.new("Michael", 67)
      biker3 = Biker.new("Big Mike", 79)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker1.log_ride(ride1, 97.0)
      biker1.log_ride(ride2, 67.0)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)
      biker3.learn_terrain!(:gravel)
      biker3.learn_terrain!(:hills)
      biker3.log_ride(ride1, 95.7)
      biker3.log_ride(ride2, 50.6)

      bikeclub1.add_biker(biker1)
      bikeclub1.add_biker(biker2)
      bikeclub1.add_biker(biker3)
      expect(bikeclub1.name).to eq("Mikes on Bikes")
      expect(bikeclub1.bikers).to eq([biker1, biker2, biker3])
    end
  end

  describe '#most_rides' do 
    it 'can return biker with the most rides' do 
      bikeclub1 = BikeClub.new("Mikes on Bikes")
      biker1 = Biker.new("Mike", 15)
      biker2 = Biker.new("Michael", 67)
      biker3 = Biker.new("Big Mike", 79)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      ride3 = Ride.new({name: "Cherry Creek Trail", distance: 14.5, loop: true, terrain: :gravel})
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker1.log_ride(ride1, 97.0)
      biker1.log_ride(ride2, 67.0)
      biker1.log_ride(ride3, 45.6)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)
      biker3.learn_terrain!(:gravel)
      biker3.learn_terrain!(:hills)
      biker3.log_ride(ride1, 95.7)
      biker3.log_ride(ride2, 50.6)

      bikeclub1.add_biker(biker1)
      bikeclub1.add_biker(biker2)
      bikeclub1.add_biker(biker3)

      expect(bikeclub1.most_rides).to eq(biker1)
    end
  end

  describe '#best_time' do 
    it 'can return the biker with best time for given ride' do 
      bikeclub1 = BikeClub.new("Mikes on Bikes")
      biker1 = Biker.new("Mike", 15)
      biker2 = Biker.new("Michael", 67)
      biker3 = Biker.new("Big Mike", 79)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      ride3 = Ride.new({name: "Cherry Creek Trail", distance: 14.5, loop: true, terrain: :gravel})
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker1.log_ride(ride1, 97.0)
      biker1.log_ride(ride2, 67.0)
      biker1.log_ride(ride3, 45.6)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)
      biker3.learn_terrain!(:gravel)
      biker3.learn_terrain!(:hills)
      biker3.log_ride(ride1, 95.7)
      biker3.log_ride(ride2, 50.6)

      bikeclub1.add_biker(biker1)
      bikeclub1.add_biker(biker2)
      bikeclub1.add_biker(biker3)

      expect(bikeclub1.best_time(ride2)).to eq(biker3)
      expect(bikeclub1.best_time(ride1)).to eq(biker2)
    end
  end
end