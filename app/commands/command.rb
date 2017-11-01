module Commands
  class Command
    attr_accessor :warehouse

    def initialize(warehouse:)
      @warehouse = warehouse
    end

    def self.find(command, warehouse)
      case command
        when 'exit'
          Exit.new(warehouse: warehouse)
      end
    end

    def execute
      raise NotImplementedError
    end
  end
end
