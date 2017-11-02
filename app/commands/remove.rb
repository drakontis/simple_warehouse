module Commands
  class Remove < Command
    def execute(args = [])
      if @warehouse.store.nil?
        puts NOT_INITIALIZED_ERROR_MESSAGE
      elsif args.count != 2
        puts WRONG_ARGUMENT_ERROR_MESSAGE
      else
        width = args.first.to_i
        height = args.last.to_i
        position = ::Store::Position.new(x: width, y: height)

        crate = warehouse.store.crates.find{|crate| crate.slot.contains?(position) }

        if crate.nil?
          puts 'Cannot find crate. Please try again.'
        else
          warehouse.store.crates.delete crate
          puts "Crate has been successfully removed"
        end
      end
    end
  end
end
