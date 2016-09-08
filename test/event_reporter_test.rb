require_relative "test_helper"
require "./lib/event_reporter"


class EventReporterTest < Minitest::Test

  def test_it_initializes
    report = EventReporter.new

    assert report
  end

  def test_it_can_load_a_file
    report = EventReporter.new

    assert report.load_file("event_attendees.csv")
    assert report.load_file()
  end

#fix
  def test_queue_is_empty
    report = EventReporter.new

    assert_equal [], report.queue
  end

  def test_accurate_queue_count
    report = EventReporter.new
    report.load_file("event_attendees_short.csv")

    assert_equal 0, report.queue_count

    report.find("first_name", "shannon")

    assert_equal 2, report.queue_count
  end

  def test_it_can_find_attendees
    report = EventReporter.new
    report.load_file("event_attendees_short.csv")

    assert_equal 0, report.queue_count

    report.find("first_name", "Sarah")

    assert_equal 2, report.queue_count
  end

  def test_it_can_clear_queue
    report = EventReporter.new
    report.load_file("event_attendees_short.csv")

    assert_equal [], report.queue

    report.find("first_name", "shannon")

    assert_equal 2, report.queue_count

    assert_equal [], report.queue_clear
  end

end
