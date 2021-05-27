require 'rspec'
require_relative '../lib/person'
require_relative '../lib/ride'

RSpec.describe Ride do
  it 'initializes' do
    millenium = Ride.new('Millenium Force', 5, 8)

    expect(millenium.class).to eq(Ride)
    expect(millenium.name).to eq('Millenium Force')
    expect(millenium.cost).to eq(5)
    expect(millenium.intensity).to eq(8)

    expect(millenium.passengers.class).to eq(Array)
    expect(millenium.passengers.length).to eq(0)
  end

  it 'can add passengers and calculate statistics' do
    millenium = Ride.new('Millenium Force', 5, 8)

    passengers = [
      aurelia = Person.new(
        {
          'name' => 'Aurelia',
          'age' => 18,
          'intensity_max' => 5
        }
      ),
      taylor = Person.new(
        {
          'name' => 'Taylor',
          'age' => 12,
          'intensity_max' => 3
        }
      ),
      'not a real person',
      lauren = Person.new(
        {
          'name' => 'Lauren',
          'age' => 20,
          'intensity_max' => 8
        }
      )
    ]
    passengers.each { |passenger| millenium.add_passenger(passenger) }

    expect(millenium.passengers.length).to eq(3)
    expect(millenium.percentage_adults).to eq(67)
  end

end
