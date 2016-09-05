require_relative "test_helper"
require "./lib/event_reporter"


class EventReporterTest < Minitest::Test
  def test_it_can_load_a_file
    report = EventReporter.new

    assert report.load_file("event_attendees.csv")
    assert report.load_file()
  end

  def test_it_can_format_zipcodes_to_correct_length
    report = EventReporter.new

    assert_equal 5, report.clean_zipcode("123456").length
    assert_equal 5, report.clean_zipcode("1234").length
    assert_equal 5, report.clean_zipcode("12345").length
  end

  def test_it_shows_list_of_help_items
    report = EventReporter.new

    assert report.help
  end

end
