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

  # def best_time(ride)
  #   require 'pry'; binding.pry
  #   bikers.each do |biker|
  #     biker.rides.values.min_by do |ride|
  #       ride.value 
  #     end
  #   end
  # end
end