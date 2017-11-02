module Commands
  class Store < Command
    attr_accessor :product_code,
                  :x,
                  :y,
                  :width,
                  :height

    def execute(args = [])
      if @warehouse.store.nil?
        puts NOT_INITIALIZED_ERROR_MESSAGE
      elsif args.count != 5
        puts WRONG_ARGUMENT_ERROR_MESSAGE
      else
        set_attributes(args)
        store_crate
      end
    end

    #######
    private
    #######

    def set_attributes(args)
      @x = args.shift.to_i
      @y = args.shift.to_i
      @width = args.shift.to_i
      @height = args.shift.to_i
      @product_code = args.shift
    end

    def store_crate
      if x < 0
        puts 'X should be positive'
      elsif y < 0
        puts 'Y should be positive'
      elsif width <= 0
        puts 'Width should be greater than zero'
      elsif height <= 0
        puts 'Height should be greater than zero'
      elsif product_code.empty?
        puts 'Product code should not be empty'
      elsif overlapping_slots?
        puts 'The slot is not available'
      elsif is_excessive?
        puts 'Crate cannot fit in this position'
      else
        warehouse.store.crates << ::Store::Crate.new(product_code: product_code, slot: slot)
        puts 'Crate has been successfully stored'
      end
    end

    def overlapping_slots?
      warehouse.store.crates.any?{ |crate| crate.slot.overlapping?(slot) }
    end

    def is_excessive?
      slot.ends_at.x > warehouse.store.width || slot.ends_at.y > warehouse.store.height
    end

    def slot
      if !@slot.nil?
        @slot
      else
        end_width = x + width - 1
        end_height = y + height - 1

        @slot ||= ::Store::Slot.new(starts_at: ::Store::Position.new(x: x, y: y), ends_at: ::Store::Position.new(x: end_width, y: end_height))
      end
    end
  end
end
