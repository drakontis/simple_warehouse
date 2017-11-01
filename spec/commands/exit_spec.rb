require "spec_helper"

describe Commands::Exit do
  let(:warehouse) { Warehouse.new(live: true) }
  subject{ Commands::Exit.new(warehouse: warehouse) }

  describe '#initialize' do
    it 'should create a new exit command' do
      expect(subject).to be_a Commands::Exit
      expect(subject.warehouse).to be_a Warehouse
    end
  end

  describe '#execute' do
    it "should set false to warehouse's live attribute" do
      expect{ subject.execute }.to output("Thank you for using simple_warehouse!\n").to_stdout
      expect(warehouse.live).to be_falsey
    end
  end
end
