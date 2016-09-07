require_relative "test_helper"
require "./lib/data_manipulation"


class DataManipulationTest < Minitest::Test

  def test_it_can_format_zipcodes_to_correct_length
    assert_equal 5, DataManipulation.clean_zipcode("123456").length
    assert_equal 5, DataManipulation.clean_zipcode("1234").length
    assert_equal 5, DataManipulation.clean_zipcode("12345").length
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
    first_name = "  Erin  "

    assert_equal "Erin", DataManipulation.clean_first_name(first_name)
  end

  def test_it_removes_leading_trailing_white_spaces_last_name
    last_name = "  Pintozzi      "

    assert_equal "Pintozzi", DataManipulation.clean_last_name(last_name)
  end

end