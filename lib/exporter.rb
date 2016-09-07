require "csv"
require "pry"
require "terminal-table"

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

  def print_queue(queue)
    table = Terminal::Table.new :headings => ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE", "DISTRICT"] do |t|
      queue.each do |person|
        t << [person.last_name, person.first_name, person.email_address, person.zipcode, person.city, person.state, person.street, person.home_phone]
      end
    end
    return table
  end

end
