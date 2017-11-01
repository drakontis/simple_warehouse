module Commands
  class Exit < Command
    def execute(args = [])
      puts 'Thank you for using simple_warehouse!'
      warehouse.live = false
    end
  end
end
