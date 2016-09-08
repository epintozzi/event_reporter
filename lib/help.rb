require "pry"


class Help

  def help(input)
    case input.downcase
    when "queue count"
      return "This command outputs how many records are in the current queue."
    when "queue clear"
      return "This command empties the queue."
    when "queue district"
      return "If there are 10 or fewer entries in the queue, this command will get Congressional District information for each entry."
    when "queue print"
      return "This command prints a table displaying the registrant information for the people in your queue"
    when "queue print by"
      return "This command prints the data table sorted by the specified attribute, for example: zipcode."
    when "queue save to"
      return "This command exports the current queue to the specified filename as a CSV."
    when "queue export html"
      return "This command exports the current queue to the specified filename as a valid HTML file."
    when "find"
      return "This command loads the queue with all records matching the criteria for the given attribute."
    when "help"
      return "You can use the following commands: 'load', 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'."
    else
      "That command doesn't exist. For a list of commands, type help."
    end
  end
end
