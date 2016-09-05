require "csv"

class EventReporter

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def load_file(filename = "event_attendees_short.csv")

    contents = CSV.open filename, headers: true, header_converters: :symbol

    # contents.each do |row|
    #   id = row[0]
    #   name = row[:first_name]
    #   zipcode = clean_zipcode(row[:zipcode])
    # end
  end

  def help
    "You can use the following commands: 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'."
  end

end
