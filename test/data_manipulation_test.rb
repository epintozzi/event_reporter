require_relative "test_helper"
require "./lib/data_manipulation"


class DataManipulationTest < Minitest::Test

  def test_it_can_format_zipcodes_to_correct_length
    data = DataManipulation.new

    assert_equal 5, data.clean_zipcode("123456").length
    assert_equal 5, data.clean_zipcode("1234").length
    assert_equal 5, data.clean_zipcode("12345").length
  end

  def test_it_can_format_phone_to_correct_length
    data = DataManipulation.new

    assert_equal 10, data.clean_phone("12345678923").length
    assert_equal 10, data.clean_phone("5556781234").length
    assert_equal 10, data.clean_phone("12345").length
    assert_equal 10, data.clean_phone(nil).length
  end

  def test_it_removes_leading_trailing_white_spaces_first_name
    data = DataManipulation.new
    first_name = "  Erin  "

    assert_equal "Erin", data.clean_first_name(first_name)
  end

  def test_it_removes_leading_trailing_white_spaces_last_name
    data = DataManipulation.new
    last_name = "  Pintozzi      "

    assert_equal "Pintozzi", data.clean_last_name(last_name)
  end

end
