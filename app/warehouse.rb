require_relative 'store.rb'
require_relative 'crate.rb'
require_relative 'position.rb'
require_relative 'slot.rb'
require_relative 'commands/command.rb'
require_relative 'commands/exit.rb'
require_relative 'commands/help.rb'

class Warehouse
  attr_accessor :live

  def initialize(live: true)
    @live = live
  end

  def run
    @live = true
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      command = gets.chomp

      command = Commands::Command.find(command, self)
      if command.nil?
        show_unrecognized_message
      else
        command.execute
      end

      # case command
      #   when 'help'
      #     show_help_message
      #   when 'exit'
      #     exit
      #   else
      #     show_unrecognized_message
      # end
    end
  end

  private

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end
end
