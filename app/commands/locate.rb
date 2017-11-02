module Commands
  class Locate < Command
    def execute(args = [])
      if @warehouse.store.nil?
        puts NOT_INITIALIZED_ERROR_MESSAGE
      elsif args.count != 1
        puts WRONG_ARGUMENT_ERROR_MESSAGE
      else
        product_code = args.first

        crates = @warehouse.store.crates.select{ |crate| crate.product_code == product_code}

        if crates.empty?
          puts 'No crates found.'
        else
          puts "Crates with product #{product_code} found in the following slots:"
          crates.each do |crate|
            puts "Starts at: #{crate.slot.starts_at.x},#{crate.slot.starts_at.y} ends at: #{crate.slot.ends_at.x},#{crate.slot.ends_at.y}"
          end
        end
      end
    end
  end
end
