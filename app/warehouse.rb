require_relative 'store.rb'
require_relative 'crate.rb'
require_relative 'position.rb'
require_relative 'slot.rb'
require_relative 'commands/command.rb'
require_relative 'commands/exit.rb'
require_relative 'commands/help.rb'
require_relative 'commands/init.rb'
require_relative 'commands/store.rb'
require_relative 'commands/remove.rb'

class Warehouse
  attr_accessor :live, :store

  def initialize(live: true, store: store)
    @live = live
    @store = store
  end

  def run
    @live = true
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      args = gets.chomp.split(' ')

      command = Commands::Command.find(args.shift, self)
      if command.nil?
        show_unrecognized_message
      else
        command.execute(args)
      end
    end
  end

  private

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end
end
