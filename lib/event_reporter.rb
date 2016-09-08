require "csv"
require "./lib/Person"
require "./lib/data_manipulation"
require "./lib/exporter"
require 'pry'
require 'sunlight-congress'

Sunlight::Congress.api_key = "58bb7693ce0a4982ab43bc76643ab066"

class EventReporter
  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end


  def load_file(filename = "./event_attendees.csv")

    contents = CSV.open filename, headers: true, header_converters: :symbol

    @full_list = []
    contents.each do |row|
      person = Person.new(row[0], row[:regdate], DataManipulation.clean_first_name(row[:first_name]), DataManipulation.clean_last_name(row[:last_name]), row[:email_address], DataManipulation.clean_phone(row[:homephone]), row[:street], row[:city], row[:state], DataManipulation.clean_zipcode(row[:zipcode]))

      @full_list << person
    end
    return @full_list
  end

  def find(attribute, criteria)
    @queue = []
    @full_list.each do |person|
      if person.send(attribute.to_sym).downcase == criteria.downcase
        @queue << person
      end
    end
    return @queue
  end

  def print_sorted_queue(attribute)
    sorted_queue = @queue.sort_by do |person|
      person.send(attribute.to_sym)
    end
    print_queue(sorted_queue)
  end

  def export_sorted_queue(attribute)
    sorted_queue = @queue.sort_by do |person|
      person.send(attribute.to_sym)
    end
    export_to_html(sorted_queue)
  end

  def save_sorted_queue(attribute)
    sorted_queue = @queue.sort_by do |person|
      person.send(attribute.to_sym)
    end
    save_to_csv(sorted_queue)
  end

  def queue_count
    count = @queue.count
    return count
  end

  def queue_clear
    @queue = []
  end

  def save_to_csv(queue = @queue)
    exporter = Exporter.new
    exporter.save_to_csv(queue)
  end

  def print_queue(queue = @queue)
    exporter = Exporter.new
    puts exporter.print_queue(queue)
  end

  def export_to_html(queue = @queue)
    exporter = Exporter.new
    exporter.export_to_html(queue)
  end

  def queue_district_by_zipcode
    if @queue.length <= 10
      @queue.each do |person|
        person.district = Sunlight::Congress::District.by_zipcode(person.zipcode).district
      end
    else
      "unknown"
    end
  end

end

# report = EventReporter.new

# report.load_file()
# report.find("first_name", "Shannon")
# report.get_input
# report.queue_district_by_zipcode
# report.save_to_csv
# report.save_sorted_queue("zipcode")
# report.find("first_name", "Joe")
# report.print_sorted_queue("zipcode")
# report.export_to_html
# puts report.save_to_csv
# puts report.print_queue
