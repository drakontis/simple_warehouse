module Commands
  class Help < Command
    def execute(args = [])
      puts 'help             Shows this help message
init W H         (Re)Initialises the application as a W x H warehouse, with all spaces empty.
store X Y W H P  Stores a crate of product type P and of size W x H at position X,Y.
locate P         Shows a list of positions where product type can be found.
remove X Y       Removes the crate at position X,Y.
view             Shows a representation of the current state of the warehouse, marking each position as filled or empty.
exit             Terminates the application.'
    end
  end
end
