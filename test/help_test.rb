require_relative "test_helper"
require "./lib/help"


class HelpTest < Minitest::Test

def test_it_shows_list_of_help_items

  help = Help.new

  input = "help"

  assert_equal "You can use the following commands: 'load', 'queue count', 'queue clear', 'queue district', 'queue print', 'queue print by', 'queue save to', 'queue export html', and 'find'.",  help.help(input)
end
end
