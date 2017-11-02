require "spec_helper"

describe Commands::Locate do
  let(:warehouse) { Warehouse.new(live: true, store: Store.new(width: 12, height: 12)) }
  subject{ Commands::Locate.new(warehouse: warehouse) }

  describe '#initialize' do
    it 'should create a new locate command' do
      expect(subject).to be_a Commands::Locate
      expect(subject.warehouse).to be_a Warehouse
    end
  end

  describe '#execute' do
    before do
      warehouse.store.crates << Crate.new(product_code: 'T', slot: Slot.new(starts_at: Position.new(x: 0, y: 0), ends_at: Position.new(x: 3, y: 3)))
      warehouse.store.crates << Crate.new(product_code: 'T', slot: Slot.new(starts_at: Position.new(x: 7, y: 9), ends_at: Position.new(x: 9, y: 11)))
      warehouse.store.crates << Crate.new(product_code: 'W', slot: Slot.new(starts_at: Position.new(x: 4, y: 6), ends_at: Position.new(x: 5, y: 7)))
    end

    context 'Without initialized store' do
      before do
        warehouse.store = nil
      end

      it 'should display error message' do
        expect{subject.execute}.to output("#{Commands::Command::NOT_INITIALIZED_ERROR_MESSAGE}\n").to_stdout
      end
    end

    context 'With wrong number of arguments' do
      it 'should display error message' do
        expect{subject.execute}.to output("#{Commands::Command::WRONG_ARGUMENT_ERROR_MESSAGE}\n").to_stdout
      end
    end

    context 'locate' do
      context 'when crates found' do
        it 'it should locate the crates' do
          output = "Crates with product T found in the following slots:
Starts at: 0,0 ends at: 3,3
Starts at: 7,9 ends at: 9,11"

          expect{subject.execute(['T'])}.to output("#{output}\n").to_stdout
        end
      end

      context 'when crates not found' do
        it 'it should show a message' do
          expect{subject.execute(['Z'])}.to output("No crates found.\n").to_stdout
        end
      end
    end
  end
end
