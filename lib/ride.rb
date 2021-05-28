class Ride
  attr_reader :name, :cost, :intensity, :passengers

  def initialize(name, cost, intensity)
    @name = name
    @cost = cost
    @intensity = intensity
    @passengers = Array.new
  end

  def add_passenger(passenger)
    self.passengers << passenger if passenger.class == Person
  end

  def percentage_adults
    adults = self.passengers.select { |passenger| passenger.adult? }
    return ((adults.length.to_f / self.passengers.length.to_f) * 100).round
  end

  def total_passengers
    return self.passengers.length
  end

end
