require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../lib/person'
require_relative '../lib/ride'
require_relative '../lib/park'


RSpec.describe Park do
  context 'initialization' do
    before :each do
      @name = 'Six Flags Orlando'
      @street = '123 Main'
      @city = 'Orlando'
      @state = 'FL'
      @zip = '12345'
    end

    it 'exists' do
      park = Park.new(@name, @street, @city, @state, @zip)

      expect(park.class).to eq(Park)
    end

    it 'has attributes' do
      park = Park.new(@name, @street, @city, @state, @zip)

      expect(park.name).to eq(@name)
      expect(park.street).to eq(@street)
      expect(park.city).to eq(@city)
      expect(park.state).to eq(@state)
      expect(park.zip).to eq(@zip)
      expect(park.address).to eq('123 Main, Orlando, FL 12345')

      expect(park.rides.class).to eq(Array)
      expect(park.rides.length).to eq(0)
    end
  end

  context 'statistics' do
    before :each do
      @name = 'Six Flags Orlando'
      @street = '123 Main'
      @city = 'Orlando'
      @state = 'FL'
      @zip = '12345'
      @park = Park.new(@name, @street, @city, @state, @zip)
    end

    it 'can determine the number of people on all the rides' do
      rides = [
        Ride.new('The Executioner', 12, 20),
        Ride.new('Lazy River', 2, 4)
      ]
      aurelia = Person.new(
        {
          'name' => 'Aurelia',
          'age' => 18,
          'intensity_max' => 25
        }
      )
      taylor = Person.new(
        {
          'name' => 'Taylor',
          'age' => 12,
          'intensity_max' => 3
        }
      )
      lauren = Person.new(
        {
          'name' => 'Lauren',
          'age' => 20,
          'intensity_max' => 8
        }
      )
      rides.each do |ride|
        ride.add_passenger(aurelia)
        ride.add_passenger(taylor)
        ride.add_passenger(lauren)
        @park.add_ride(ride)
      end
      expect(rides.first.passengers.length).to eq(3)
      expect(rides.last.passengers.length).to eq(3)

      expect(@park.rides.length).to eq(2)
      expect(@park.rides.first.name).to eq('The Executioner')
      expect(@park.rides.first.cost).to eq(12)
      expect(@park.rides.first.intensity).to eq(20)
      expect(@park.rides.last.name).to eq('Lazy River')
      expect(@park.rides.last.cost).to eq(2)
      expect(@park.rides.last.intensity).to eq(4)

      expect(@park.total_riders).to eq(6)
    end

    it 'can determine the sickest ride in the park' do
      rides = [
        Ride.new('The Executioner', 12, 30),
        Ride.new('Lazy River', 2, 4)
      ]
      aurelia = Person.new(
        {
          'name' => 'Aurelia',
          'age' => 18,
          'intensity_max' => 25
        }
      )
      taylor = Person.new(
        {
          'name' => 'Taylor',
          'age' => 12,
          'intensity_max' => 3
        }
      )
      lauren = Person.new(
        {
          'name' => 'Lauren',
          'age' => 20,
          'intensity_max' => 8
        }
      )
      xavier = Person.new(
        {
          'name' => 'Xavier',
          'age' => 20,
          'intensity_max' => 8
        }
      )

      rides[0].add_passenger(aurelia)
      rides[1].add_passenger(taylor)
      rides[1].add_passenger(lauren)
      rides[1].add_passenger(xavier)

      @park.add_ride(rides[0])
      @park.add_ride(rides[1])

      expect(@park.rides.length).to eq(2)
      expect(@park.rides.first.name).to eq('The Executioner')
      expect(@park.rides.first.cost).to eq(12)
      expect(@park.rides.first.intensity).to eq(30)
      expect(@park.rides.last.name).to eq('Lazy River')
      expect(@park.rides.last.cost).to eq(2)
      expect(@park.rides.last.intensity).to eq(4)
      expect(@park.total_riders).to eq(4)

      expect(@park.sickest_ride).to eq('The Executioner')
    end
  end
end
