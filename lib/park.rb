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
    return "#{@street}, #{@city}, #{@state} #{@zip}"
  end

  def add_ride(ride)
    self.rides << ride
  end

  def total_riders
    return self.rides.sum { |ride| ride.total_passengers }
  end

  def sickest_ride
    collection_arr = []
    self.rides.each do |ride|
      result = ride.passengers.select do |passenger|
        passenger.intensity_max < ride.intensity
      end
      collection_arr << [
        ride.name, ((result.length / ride.passengers.length.to_f)*100).round(1)
      ]
    end
    return collection_arr.max_by do |statistic|
      statistic[1]
    end[0]
  end

end
