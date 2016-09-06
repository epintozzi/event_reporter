require "csv"
require "./lib/Person"
require "./lib/data_manipulation"
require 'pry'

class EventReporter
  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end

#move clean_zip, clean_phone, & first/last_name to data_manipulation class
  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_phone(phone)
    return "0000000000" if phone.nil?
    phone = phone.to_s.gsub(/\D/, "")
    if phone.length == 10
      return phone
    elsif phone.length == 11 and phone[0] == "1"
      return phone[1..11]
    else
      return "0000000000"
    end
  end

  def clean_first_name(first_name)
    first_name.strip
  end

  def clean_last_name(last_name)
    last_name.strip
  end

  def load_file(filename = "./event_attendees_short.csv")

    contents = CSV.open filename, headers: true, header_converters: :symbol

    return contents
  end

  def create_queue
    load_file.each do |row|
      person = Person.new(row[0], row[:regdate], clean_first_name(row[:first_name]), clean_last_name(row[:last_name]), row[:email_address], clean_phone(row[:home_phone]), row[:street], row[:city], row[:state], clean_zipcode(row[:zipcode]))

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

  def get_command
    print "Please enter a command"
    gets.chomp
  end

  def help
    "You can use the following commands: 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'."
  end

end

report = EventReporter.new

puts report.queue_count
puts report.create_queue
puts report.queue_count
# report.queue_clear
# puts report.queue_count
