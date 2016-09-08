require_relative "test_helper"
require "./lib/exporter"
require "./lib/person"


class ExporterTest < Minitest::Test

  def test_it_can_export
    exporter = Exporter.new

    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    exporter.save_to_csv([person], "test_queue_output.csv")

    assert File.exists?("test_queue_output.csv")
  end

  def test_it_can_print
    exporter = Exporter.new

    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    assert exporter.print_queue([person])
  end
end
