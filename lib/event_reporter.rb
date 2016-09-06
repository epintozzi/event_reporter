require "csv"
require "./lib/Person"
require 'pry'

class EventReporter

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

  def load_file(filename = "./event_attendees_short.csv")

    contents = CSV.open filename, headers: true, header_converters: :symbol

    return contents
  end

  def create_queue
    queue = []

    load_file.each do |row|
      person = Person.new(row[0], row[:regdate], row[:first_name], row[:last_name], row[:email_address], clean_phone(row[:home_phone]), row[:street], row[:city], row[:state], clean_zipcode(row[:zipcode]))

      queue << person
    end
    return queue
  end


  def help
    "You can use the following commands: 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'."
  end

end

report = EventReporter.new
puts report.create_queue
