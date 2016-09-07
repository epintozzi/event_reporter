require_relative "test_helper"
require "./lib/event_reporter"


class EventReporterTest < Minitest::Test

  def test_it_can_load_a_file
    report = EventReporter.new

    assert report.load_file("event_attendees.csv")
    assert report.load_file()
  end

  def test_it_creates_a_queue
    report = EventReporter.new

    assert report.create_queue
  end

  def test_queue_is_not_empty
    report = EventReporter.new

    refute_empty report.create_queue
  end

  def test_it_shows_list_of_help_items
    report = EventReporter.new

    assert_equal "You can use the following commands: 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'.",  report.help
  end

end
