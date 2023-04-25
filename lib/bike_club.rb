class BikeClub
  attr_reader :name, :bikers 

  def initialize(name)
    @name = name 
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker 
  end

  def most_rides 
    @bikers.max_by do |biker|
      biker.total_logged_rides
    end
  end

  def best_time(ride)
    @bikers.min_by do |biker| 
      biker.personal_record(ride) 
    end 
  end 

  def bikers_eligible(ride)
    eligible_bikers = []
    @bikers.each do |biker|
      if biker.acceptable_terrain.include?(ride.terrain) &&
        biker.max_distance >= ride.total_distance 
        eligible_bikers << biker 
      end
    end
    eligible_bikers
  end
end