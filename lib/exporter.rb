require "csv"

class Exporter

  def save_to_csv(queue, filename = "queue_output.csv")

    CSV.open(filename, "wb") do |csv|
      csv << ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE"]
      queue.each do |person|
        csv << [person.last_name, person.first_name, person.email_address, person.zipcode, person.city, person.state, person.street, person.home_phone]
      end
    end

  end

  def export_to_html

  end

  def print_queue
# col_sep: "\t"
  end

end
