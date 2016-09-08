require "pry"
require "./lib/event_reporter"

class Repl

  # def initialize
  #   report = EventReporter.new
  # end

  def get_input
    puts "Please enter a command."
    user_input = gets.chomp
    # until user_input == 'quit'
    if user_input == "queue count"
      report = EventReporter.new
      puts report.queue_count
    elsif user_input == "queue clear"
      puts EventReporter.queue_clear
    elsif user_input == "queue district"
      puts EventReporter.queue_district_by_zipcode
    elsif user_input == "queue print"
      puts EventReporter.print_queue
      #fix to account for any filename; this will fail is user doesn't event valid file name or enters anything other than a single filename after 'load'
    elsif user_input.start_with?("load")
      user_input = user_input.split
      puts EventReporter.load_file(user_input[1])
      #finish for other attributes. startwith method?
    elsif user_input == "queue print by last_name"
      user_input = user_input.split
      puts EventReporter.print_sorted_queue(user_input[-1])
      #fix to account for any filename
    elsif user_input == "queue save to city_sample.csv"
      user_input = user_input.split
      exporter = Exporter.new
      exporter.save_to_csv(queue, user_input[-1])
      #fix to account for any filename
    elsif user_input == "queue export html test_output.html"
      user_input = user_input.split
      exporter = Exporter.new
      exporter.export_to_html(queue, user_input[-1])
      #finish to account for all attributes and criteria
    elsif user_input == "find first_name Mary"
      user_input = user_input.split
      puts EventReporter.find(user_input[1], user_input[2])
    end
    end
  # end
end

repl = Repl.new
repl.get_input
