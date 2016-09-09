require_relative "test_helper"
require "./lib/person"


class PersonTest < Minitest::Test

  def test_it_creates_a_person
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert person
  end

  def test_it_stores_an_id
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal 1, person.id
  end

  def test_it_stores_a_reg_date
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "090516", person.reg_date
  end

  def test_it_stores_a_first_name
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "Erin", person.first_name
  end

  def test_it_stores_a_last_name
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "Pintozzi", person.last_name
  end

  def test_it_stores_an_email
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "erin.pintozzi@gmail.com", person.email_address
  end

  def test_it_stores_a_phone
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "5551234567", person.home_phone
  end

  def test_it_stores_an_address
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "Brighton", person.street
  end

  def test_it_stores_a_city
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "Denver", person.city
  end

  def test_it_stores_a_state
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "CO", person.state
  end

  def test_it_stores_a_zipcode
    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert_equal "80216", person.zipcode
  end

end
