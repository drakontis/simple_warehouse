module Commands
  class Exit < Command
    def execute
      puts 'Thank you for using simple_warehouse!'
      warehouse.live = false
    end
  end
end
