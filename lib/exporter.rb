require "csv"
require "pry"
require "terminal-table"
require "erb"

class Exporter

  def save_to_csv(queue, filename = "queue_output.csv")
    CSV.open(filename, "wb") do |csv|
      csv << ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE", "DISTRICT"]
      queue.each do |person|
        csv << [person.last_name, person.first_name, person.email_address, person.zipcode, person.city, person.state, person.street, person.home_phone, person.district]
      end
    end
  end

  def export_to_html(queue, filename = "queue_results.html")
    template = File.read "html_form.erb"
    erb_template = ERB.new template
    html_form = erb_template.result(binding)

    File.open(filename, "w") do |file|
      file.puts html_form
    end
    %x[open #{File.expand_path(filename)}]
  end

  def print_queue(queue)
    table = Terminal::Table.new :headings => ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE", "DISTRICT"] do |t|
      queue.each do |person|
        t << [person.last_name, person.first_name, person.email_address, person.zipcode, person.city, person.state, person.street, person.home_phone, person.district]
      end
    end
    return table
  end

end
