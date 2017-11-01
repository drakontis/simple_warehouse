require "spec_helper"

describe Commands::Init do
  let(:warehouse) { Warehouse.new(live: true) }
  subject{ Commands::Init.new(warehouse: warehouse) }

  describe '#initialize' do
    it 'should create a new init command' do
      expect(subject).to be_a Commands::Init
      expect(subject.warehouse).to be_a Warehouse
    end
  end

  describe '#execute' do
    context 'with correct number of arguments' do
      it 'should set an new store' do
        expect(warehouse.store).to be nil
        width = 10
        height = 12

        expect{subject.execute([width, height])}.to output("Warehouse has been (Re)initialized with a new store with width: #{width} and height: #{height}\n").to_stdout

        expect(warehouse.store).to be_a Store
        expect(warehouse.store.width).to eq 10
        expect(warehouse.store.height).to eq 12
        expect(warehouse.store.crates).to be_empty
      end
    end

    context 'with correct number of arguments' do
      it 'should set an new store' do
        expect(warehouse.store).to be nil

        expect{subject.execute([10])}.to output("#{Commands::Command::WRONG_ARGUMENT_ERROR_MESSAGE}\n").to_stdout
      end
    end
  end
end
