require "spec_helper"

describe Commands::Help do
  let(:warehouse) { Warehouse.new(live: true) }
  subject{ Commands::Help.new(warehouse: warehouse) }

  describe '#initialize' do
    it 'should create a new help command' do
      expect(subject).to be_a Commands::Help
      expect(subject.warehouse).to be_a Warehouse
    end
  end

  describe '#execute' do
    it "should set false to warehouse's live attribute" do
      expect{ subject.execute }.to output("help             Shows this help message\ninit W H         (Re)Initialises the application as a W x H warehouse, with all spaces empty.\nstore X Y W H P  Stores a crate of product type P and of size W x H at position X,Y.\nlocate P         Shows a list of positions where product type can be found.\nremove X Y       Removes the crate at position X,Y.\nview             Shows a representation of the current state of the warehouse, marking each position as filled or empty.\nexit             Terminates the application.\n").to_stdout
    end
  end
end
