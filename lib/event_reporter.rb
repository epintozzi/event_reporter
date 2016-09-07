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


  def load_file(filename = "./event_attendees_short.csv")

    contents = CSV.open filename, headers: true, header_converters: :symbol

    return contents
  end

  def create_queue
    load_file.each do |row|
      person = Person.new(row[0], row[:regdate], DataManipulation.clean_first_name(row[:first_name]), DataManipulation.clean_last_name(row[:last_name]), row[:email_address], DataManipulation.clean_phone(row[:homephone]), row[:street], row[:city], row[:state], DataManipulation.clean_zipcode(row[:zipcode]))

      @queue << person
    end
    return @queue
  end

  def queue_count
    count = @queue.count
    return count
  end

  def queue_clear
    @queue = []
  end

  def save_to_csv
    exporter = Exporter.new
    exporter.save_to_csv(@queue)
  end

  def print_queue
    exporter = Exporter.new
    exporter.print_queue(@queue)
  end

  def queue_district_by_zipcode(zipcode)
    Sunlight::Congress::District.by_zipcode(zipcode)
  end

  def get_command
    print "Please enter a command"
    gets.chomp
  end

  def help
    "You can use the following commands: 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'."
  end

  def help(command)
    if command.downcase == "queue count"
      return "This command outputs how many records are in the current queue."
    end
    if command.downcase == "queue clear"
      return "This command empties the queue."
    end
    if command.downcase == "queue district"
      return "If there are 10 or fewer entries in the queue, this command will get Congressional District information for each entry."
    end
    if command.downcase == "queue print"
      return "This command prints a table displaying the registrant information for the people in your queue"
    end
    if command.downcase == "queue print by"
      return "This command prints the data table sorted by the specified attribute, for example: zipcode."
    end
    if command.downcase == "queue save to"
      return "This command exports the current queue to the specified filename as a CSV."
    end
    if command.downcase == "queue export html"
      return "This command exports the current queue to the specified filename as a valid HTML file."
    end
    if command.downcase == "find"
      return "This command loads the queue with all records matching the criteria for the given attribute."
    end
  end
end

report = EventReporter.new
report.create_queue
puts report.save_to_csv
puts report.print_queue
