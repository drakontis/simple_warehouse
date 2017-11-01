module Commands
  class Command
    WRONG_ARGUMENT_ERROR_MESSAGE = 'Wrong number of arguments. Type `help` for instructions'

    attr_accessor :warehouse

    def initialize(warehouse:)
      @warehouse = warehouse
    end

    def self.find(command, warehouse)
      case command
        when 'exit'
          Exit.new(warehouse: warehouse)
        when 'help'
          Help.new(warehouse: warehouse)
        when 'init'
          Init.new(warehouse: warehouse)
        when 'store'
          Store.new(warehouse: warehouse)
      end
    end

    def execute(args = nil)
      raise NotImplementedError
    end
  end
end
