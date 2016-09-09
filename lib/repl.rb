require "pry"
require "./lib/event_reporter"
require "./lib/help"

class Repl

  def initialize
    @report = EventReporter.new
    @help = Help.new
  end

  def get_input
    puts "Please enter a command."
    full_command = gets.chomp
    user_input = full_command.split

    if user_input[0] == "load"
      @report.load_file(user_input[1])
    elsif user_input[0] == "help"
      if user_input [1].nil?
        @help.help_list
      else
        puts @help.help(user_input[1..-1].join(" "))
      end
    elsif full_command == "queue count"
      puts @report.queue_count
    elsif full_command == "queue clear"
      puts @report.queue_clear
    elsif full_command == "queue district"
      puts @report.queue_district_by_zipcode
    elsif full_command.start_with? "queue print by"
      puts @report.print_sorted_queue(user_input[-1])
    elsif full_command == "queue print"
      puts @report.print_queue
    elsif user_input[0] == "find"
      @report.find(user_input[1], user_input[2..-1].join(" "))
    elsif full_command.start_with? "queue save to"
      @report.save_to_csv(user_input[-1])
    elsif full_command.start_with? "queue export html"
      @report.export_to_html(user_input[-1])
    elsif full_command == "quit"
      exit
    end
  end
end

repl = Repl.new

loop do
  begin
    repl.get_input
  rescue
    puts "Error, please try again."
  end
end
