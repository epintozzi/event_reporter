require "csv"
require "./lib/Person"

class EventReporter

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_phone(phone)
    phone = phone.gsub(/\D/, "")
    if phone.length > 11 or phone.length < 10
      return "0000000000"
    elsif phone.length == 11
      if phone[0] == 1
        phone = phone[1..11]
      else
        phone = "0000000000"
      end
    else
      return phone
    end
  end

  def load_file(filename = "./event_attendees_short.csv")

    contents = CSV.open filename, headers: true, header_converters: :symbol

    contents.each do |row|
      id = row[0]
      reg_date = row[:regdate]
      first_name = row[:first_name]
      last_name = row[:last_name]
      email_address = row[:email_address]
      home_phone = clean_phone(row[:home_phone])
      street = row[:street]
      city = row[:city]
      state = row[:state]
      zipcode = clean_zipcode(row[:zipcode])
    end
  end

  def create_person


  end


  def help
    "You can use the following commands: 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'."
  end

end
