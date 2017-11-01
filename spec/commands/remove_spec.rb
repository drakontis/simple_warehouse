require "spec_helper"

describe Commands::Remove do
  let(:warehouse) { Warehouse.new(live: true, store: Store.new(width: 10, height: 10)) }
  subject{ Commands::Remove.new(warehouse: warehouse) }

  before do
    warehouse.store.crates << Crate.new(product_code: 'T', slot: Slot.new(starts_at: Position.new(x: 0, y: 0), ends_at: Position.new(x: 3, y: 3)))
  end

  describe '#execute' do
    context 'Without initialized store' do
      before do
        warehouse.store = nil
      end

      it 'should display error message' do
        expect{subject.execute([1])}.to output("#{Commands::Command::NOT_INITIALIZED_ERROR_MESSAGE}\n").to_stdout
      end
    end

    context 'With wrong number of arguments' do
      it 'should display error message' do
        expect{subject.execute([1])}.to output("#{Commands::Command::WRONG_ARGUMENT_ERROR_MESSAGE}\n").to_stdout
      end
    end

    context 'Trying to remove a crate that not exists' do
      it 'should display error message' do
        expect{subject.execute([5, 5])}.to output("Cannot find crate. Please try again.\n").to_stdout
      end
    end

    context 'Trying to remove the correct crate' do
      it 'should remove tha crate' do
        expect do
          expect do
            subject.execute([1, 1])
          end.to output("Crate has been successfully removed\n").to_stdout
        end.to change{ warehouse.store.crates.count }.by(-1)
      end
    end
  end
end
