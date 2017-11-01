module Commands
  class Init < Command
    def execute(args = [])
      if args.count != 2
        puts 'Wrong number of arguments'
      else
        width = args.first
        height = args.last

        warehouse.store = Store.new(width: width, height: height)

        puts "Warehouse has been (Re)initialized with a new store with width: #{width} and height: #{height}"
      end
    end
  end
end
