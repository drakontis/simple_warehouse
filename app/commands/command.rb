module Commands
  class Command
    WRONG_ARGUMENT_ERROR_MESSAGE = 'Wrong number of arguments. Type `help` for instructions'
    NOT_INITIALIZED_ERROR_MESSAGE = 'Please initialize the store'

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
        when 'remove'
          Remove.new(warehouse: warehouse)
        when 'view'
          View.new(warehouse: warehouse)
        when 'locate'
          Locate.new(warehouse: warehouse)
      end
    end

    def execute(args = nil)
      raise NotImplementedError
    end
  end
end
