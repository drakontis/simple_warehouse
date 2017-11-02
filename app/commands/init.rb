module Commands
  class Init < Command
    def execute(args = [])
      if args.count != 2
        puts WRONG_ARGUMENT_ERROR_MESSAGE
      else
        width = args.first.to_i
        height = args.last.to_i

        warehouse.store = ::Store::Store.new(width: width, height: height)

        puts "Warehouse has been (Re)initialized with a new store with width: #{width} and height: #{height}"
      end
    end
  end
end
