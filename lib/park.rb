class Park
  attr_reader :name, :street, :city, :state, :zip, :rides

  def initialize(name, street, city, state, zip)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip = zip
    @rides = Array.new
  end

  def address
    "#{@street}, #{@city}, #{@state} #{@zip}"
  end

  def add_ride(ride)
    @rides << ride
  end

  def total_riders
    @rides.sum { |ride| ride.passengers.length }
  end

  def sickest_ride
    @rides.max_by { |ride| ride.percentage_sick_passengers}.name
  end

end
