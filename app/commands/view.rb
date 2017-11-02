module Commands
  class View < Command
    def execute(args = [])
      if @warehouse.store.nil?
        puts NOT_INITIALIZED_ERROR_MESSAGE
      else
        draw_store
      end
    end

    #######
    private
    #######

    def draw_store
      width_indexes = (0..@warehouse.store.width-1).to_a
      reversed_height_indexes = (0..@warehouse.store.height-1).to_a.reverse!
      matrix = []

      reversed_height_indexes.each do |height_index|
        matrix_row = []

        y_index_number = height_index.to_s
        (@warehouse.store.height.to_s.size - height_index.to_s.size).times do
          y_index_number += ' '
        end

        matrix_row << y_index_number

        width_indexes.each do |width_index|
          element_prefix = ''

          (width_index.to_s.size - 1).times do
            element_prefix += ' '
          end

          matrix_row << element_prefix + '_'
          position = ::Store::Position.new(x: width_index, y: height_index)
          crate = @warehouse.store.crates.find{ |crate| crate.slot.contains?(position) }

          unless crate.nil?
            matrix_row[width_index+1] = element_prefix + crate.product_code
          end
        end

        matrix << matrix_row
      end
      x_index_row = ['/', '']
      (@warehouse.store.height.to_s.size - 2).times do
        x_index_row << ' '
      end
      x_index_row += (0..@warehouse.store.width-1).to_a

      matrix << x_index_row
      matrix.each do |matrix_row|
        puts matrix_row.join(' ')
      end
    end
  end
end
