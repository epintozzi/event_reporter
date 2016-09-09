require_relative "test_helper"
require "./lib/data_manipulation"


class DataManipulationTest < Minitest::Test

  def test_it_can_format_zipcodes_to_correct_length
    assert_equal 5, DataManipulation.clean_zipcode("123456").length
    assert_equal 5, DataManipulation.clean_zipcode("1234").length
    assert_equal 5, DataManipulation.clean_zipcode("12345").length
  end

  def test_it_returns_correct_zipcode
    assert_equal "80216", DataManipulation.clean_zipcode("80216")
    assert_equal "00894", DataManipulation.clean_zipcode("894")
    assert_equal "60402", DataManipulation.clean_zipcode("604021264")
  end

  def test_it_can_format_phone_to_correct_length

    assert_equal 10, DataManipulation.clean_phone("12345678923").length
    assert_equal 10, DataManipulation.clean_phone("5556781234").length
    assert_equal 10, DataManipulation.clean_phone("12345").length
    assert_equal 10, DataManipulation.clean_phone(nil).length
  end

  def test_it_returns_correct_phone_number
    assert_equal "5551236789", DataManipulation.clean_phone("15551236789")
    assert_equal "5551236789", DataManipulation.clean_phone("5551236789")
    assert_equal "5551236789", DataManipulation.clean_phone("1(555)123-6789")
    assert_equal "0000000000", DataManipulation.clean_phone("551236789")
  end

  def test_it_removes_leading_trailing_white_spaces_first_name

    assert_equal "Erin", DataManipulation.clean_first_name("  Erin  ")
  end

  def test_it_removes_leading_trailing_white_spaces_last_name

    assert_equal "Pintozzi", DataManipulation.clean_last_name("  Pintozzi      ")
  end

  def test_it_removes_leading_trailing_white_spaces_city

    assert_equal "Denver", DataManipulation.clean_city("   Denver     ")
    assert_equal "", DataManipulation.clean_street(nil)
  end

  def test_it_removes_leading_trailing_white_spaces_street

    assert_equal "Brighton", DataManipulation.clean_street("   Brighton   ")
    assert_equal "", DataManipulation.clean_street(nil)
  end

  def test_it_removes_leading_trailing_white_spaces_state

    assert_equal "CO", DataManipulation.clean_state("   CO   ")
    assert_equal "", DataManipulation.clean_street(nil)
  end

end
