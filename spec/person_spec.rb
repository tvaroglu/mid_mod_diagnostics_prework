require 'rspec'
require_relative '../lib/person'

RSpec.describe Person do
  it 'initializes' do
    aurelia = Person.new(
      {
        'name' => 'Aurelia',
        'age' => 18,
        'intensity_max' => 5
      }
    )
    expect(aurelia.class).to eq(Person)
    expect(aurelia.name).to eq('Aurelia')
    expect(aurelia.age).to eq(18)
    expect(aurelia.intensity_max).to eq(5)
  end

  it 'can be an adult' do
    aurelia = Person.new(
      {
        'name' => 'Aurelia',
        'age' => 18,
        'intensity_max' => 5
      }
    )
    taylor = Person.new(
      {
        'name' => 'Taylor',
        'age' => 12,
        'intensity_max' => 3
      }
    )
    expect(aurelia.adult?).to be(true)
    expect(taylor.adult?).to be(false)
  end

  it 'can be given a pep talk' do
    aurelia = Person.new(
      {
        'name' => 'Aurelia',
        'age' => 18,
        'intensity_max' => 5
      }
    )
    aurelia.pep_talk
    expect(aurelia.intensity_max).to eq(6)
  end

end
