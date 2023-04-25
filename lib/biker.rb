class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)
    @name = name 
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    acceptable_terrain << terrain
  end

  def log_ride(ride, personal_rec)
    if acceptable?(ride)
      if rides[ride].nil?
        rides[ride] = [personal_rec]
      else  
        rides[ride] << personal_rec
      end
      rides 
    end 
  end 

  def personal_record(ride)
    return false if rides[ride].nil? 
      rides[ride].min
  end
    
  def acceptable?(ride)
    return true if ride.total_distance < @max_distance && acceptable_terrain.include?(ride.terrain)
  end

end