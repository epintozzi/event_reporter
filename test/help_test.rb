require_relative "test_helper"
require "./lib/help"


class HelpTest < Minitest::Test

  def test_it_outputs_definition_of_command
    help = Help.new

    assert_equal "This command outputs how many records are in the current queue.", help.help("queue count")

    assert_equal "This command empties the queue.", help.help("queue clear")

    assert_equal "This command prints a table displaying the registrant information for the people in your queue", help.help("queue print")

    assert_equal "If there are 10 or fewer entries in the queue, this command will get Congressional District information for each entry.", help.help("queue district")

    assert_equal "This command prints the data table sorted by the specified attribute, for example: zipcode.", help.help("queue print by")

    assert_equal "This command exports the current queue to the specified filename as a CSV.", help.help("queue save to")

    assert_equal "This command exports the current queue to the specified filename as a valid HTML file.", help.help("queue export html")

    assert_equal "This command loads the queue with all records matching the criteria for the given attribute.", help.help("find")

    assert_equal "This command erases any previously loaded data, and then loads event_attendees.csv unless a different file is specified by the user.", help.help("load")

    assert_equal "That command doesn't exist. For a list of commands, type 'help'.", help.help("hello")
  end

end
