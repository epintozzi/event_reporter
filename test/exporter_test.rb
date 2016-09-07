require_relative "test_helper"
require "./lib/exporter"
require "./lib/person"


class ExporterTest < Minitest::Test

  def test_it_can_export
    exporter = Exporter.new

    person = Person.new(1, "090516", "Erin", "Pintozzi", "erin.pintozzi@gmail.com", "5551234567", "Brighton", "Denver", "CO", "80216")

    exporter.save_to_csv([person])

    assert File.exists?("queue_output.csv")
  end
end
