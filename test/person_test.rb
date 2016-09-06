require_relative "test_helper"
require "./lib/person"


class PersonTest < Minitest::Test

  def test_it_creates_a_person
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert person
  end


end
