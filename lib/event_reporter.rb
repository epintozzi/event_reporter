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
    @full_list = []
  end

  def load_file(filename = "./event_attendees.csv")
    filename ||= "./event_attendees.csv"
    contents = CSV.open filename, headers: true, header_converters: :symbol
    @full_list = []
    contents.each do |row|
      person = Person.new(row[0], row[:regdate], DataManipulation.clean_first_name(row[:first_name]), DataManipulation.clean_last_name(row[:last_name]), row[:email_address], DataManipulation.clean_phone(row[:homephone]), DataManipulation.clean_street(row[:street]), DataManipulation.clean_city(row[:city]), DataManipulation.clean_state(row[:state]), DataManipulation.clean_zipcode(row[:zipcode]))
      @full_list << person
    end
    return @full_list
  end

  def queue_count
    count = @queue.count
    return count
  end

  def queue_clear
    @queue = []
  end

  def find(attribute, criteria)
    @queue = []
    @full_list.each do |person|
      person_attr = person.send(attribute.to_sym)
      if person_attr && person_attr.downcase == criteria.downcase
        @queue << person
      end
    end
    return @queue
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

  def save_to_csv(filename = "queue_output.csv")
    exporter = Exporter.new
    exporter.save_to_csv(@queue, filename)
  end

  def print_queue(queue = @queue)
    exporter = Exporter.new
    puts exporter.print_queue(queue)
  end

  def print_sorted_queue(attribute)
    sorted_queue = @queue.sort_by do |person|
      person.send(attribute.to_sym)
    end
    print_queue(sorted_queue)
  end

  def export_to_html(filename = "queue_results.html")
    exporter = Exporter.new
    exporter.export_to_html(@queue, filename)
  end

end
