class Ride
  attr_reader :name, :cost, :intensity, :passengers

  def initialize(name, cost, intensity)
    @name = name
    @cost = cost
    @intensity = intensity
    @passengers = Array.new
  end

  def add_passenger(passenger)
    @passengers << passenger if passenger.class == Person
  end

  def percentage_adults
    adults = @passengers.select { |passenger| passenger.adult? }
    ((adults.length / @passengers.length.to_f) * 100).round
  end

  def percentage_sick_passengers
    sick_passengers = @passengers.select { |passenger| passenger.intensity_max < @intensity }
    ((sick_passengers.length / @passengers.length.to_f) * 100).round
  end

end
