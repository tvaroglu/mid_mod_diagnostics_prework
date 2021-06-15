class Person
  attr_reader :name, :age, :intensity_max

  def initialize(person_hash)
    @name = person_hash['name']
    @age = person_hash['age']
    @intensity_max = person_hash['intensity_max']
  end

  def adult?
    @age >= 18
  end

  def pep_talk
    @intensity_max += 1
  end

end
