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


  def open_file(filename = "./event_attendees.csv")

    contents = CSV.open filename, headers: true, header_converters: :symbol

    return contents
  end

  def load_file
    @full_list = []
    open_file.each do |row|
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

  def get_command
    print "Please enter a command"
    gets.chomp
  end

  def help_list
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
report.load_file
report.find("first_name", "Mary")
report.queue_district_by_zipcode
# report.save_to_csv
# report.save_sorted_queue("zipcode")
# report.find("first_name", "Joe")
# report.print_sorted_queue("zipcode")
report.export_to_html
# puts report.save_to_csv
# puts report.print_queue
