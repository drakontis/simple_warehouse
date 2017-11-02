require "spec_helper"

describe Commands::Store do
  let(:store) { Store::Store.new(width: 10, height: 10) }
  let(:warehouse) { Warehouse.new(live: true, store: store) }
  subject{ Commands::Store.new(warehouse: warehouse) }

  describe '#initialize' do
    it 'should create a new help command' do
      expect(subject).to be_a Commands::Store
      expect(subject.warehouse).to be_a Warehouse
    end
  end

  describe '#execute' do
    context 'without initialized store' do
      let(:store) { nil }

      it 'should print an error' do
        expect{subject.execute([10])}.to output("#{Commands::Command::NOT_INITIALIZED_ERROR_MESSAGE}\n").to_stdout
      end
    end

    context 'without wrong number of attributes' do
      it 'should print an error' do
        expect{subject.execute([10])}.to output("#{Commands::Command::WRONG_ARGUMENT_ERROR_MESSAGE}\n").to_stdout
      end
    end

    context 'with negative x' do
      it 'should print an error' do
        expect{subject.execute([-1, 1, 2, 4, 'T'])}.to output("X should be positive\n").to_stdout
      end
    end

    context 'with negative y' do
      it 'should print an error' do
        expect{subject.execute([1, -1, 2, 4, 'T'])}.to output("Y should be positive\n").to_stdout
      end
    end

    context 'with width smaller than 1' do
      it 'should print an error' do
        expect{subject.execute([1, 1, 0, 1, 'T'])}.to output("Width should be greater than zero\n").to_stdout
      end
    end

    context 'with height smaller than 1' do
      it 'should print an error' do
        expect{subject.execute([1, 1, 3, 0, 'T'])}.to output("Height should be greater than zero\n").to_stdout
      end
    end

    context 'with empty product code' do
      it 'should print an error' do
        expect{subject.execute([1, 1, 3, 2, ''])}.to output("Product code should not be empty\n").to_stdout
      end
    end

    context 'with overlapping' do
      it 'should print an error' do
        slot = Store::Slot.new(starts_at: Store::Position.new(x: 5, y: 3), ends_at: Store::Position.new(x: 7, y: 5))
        store.crates << Store::Crate.new(product_code: 'T', slot: slot)

        expect{subject.execute([6, 4, 2, 2, 'T'])}.to output("The slot is not available\n").to_stdout
      end
    end

    context 'when crate does not fit' do
      it 'should print an error' do
        expect{subject.execute([8, 12, 8, 11, 'T'])}.to output("Crate cannot fit in this position\n").to_stdout
      end
    end

    context 'with valid arguments' do
      it 'should add a crate' do
        expect do
          expect do
            subject.execute([0, 0, 4, 4, 'T'])
          end.to output("Crate has been successfully stored\n").to_stdout
        end.to change{store.crates.count}.by 1

        crate = store.crates.last
        expect(crate.product_code).to eq 'T'
        expect(crate.slot.starts_at.x).to eq 0
        expect(crate.slot.starts_at.y).to eq 0
        expect(crate.slot.ends_at.x).to eq 3
        expect(crate.slot.ends_at.y).to eq 3
      end
    end
  end

  describe '#overlapping_slots?' do
    before do
      store.crates << Store::Crate.new(product_code: 'T', slot: Store::Slot.new(starts_at: Store::Position.new(x: 0, y: 0), ends_at: Store::Position.new(x: 3, y: 3)))
      store.crates << Store::Crate.new(product_code: 'T', slot: Store::Slot.new(starts_at: Store::Position.new(x: 2, y: 4), ends_at: Store::Position.new(x: 4, y: 5)))
    end

    context 'with overlapping slots' do
      it 'should return true' do
        subject.x = 1
        subject.width = 2
        subject.y = 2
        subject.height = 2

        expect(subject.send(:overlapping_slots?)).to be_truthy
      end
    end

    context 'without overlapping slots' do
      it 'should return true' do
        subject.x = 3
        subject.width = 2
        subject.y = 3
        subject.height = 2

        expect(subject.send(:overlapping_slots?)).to be_truthy
      end
    end
  end

  describe '#is_excessive?' do
    it 'should return true if the width is too big' do
      subject.x = 8
      subject.width = 4
      subject.y = 3
      subject.height = 2

      expect(subject.send(:is_excessive?)).to be_truthy
    end

    it 'should return true if the height is too big' do
      subject.x = 3
      subject.width = 2
      subject.y = 8
      subject.height = 6

      expect(subject.send(:is_excessive?)).to be_truthy
    end

    it 'should return false if it is not redundant' do
      subject.x = 3
      subject.width = 2
      subject.y = 3
      subject.height = 6

      expect(subject.send(:is_excessive?)).to be_falsey
    end
  end

  describe '#slot' do
    before do
      subject.x = 0
      subject.y = 0
      subject.width = 5
      subject.height = 3
    end

    it 'should return a slot' do
      slot = subject.send(:slot)

      expect(slot).to be_a Store::Slot
      expect(slot.starts_at).to be_a Store::Position
      expect(slot.starts_at.x).to eq 0
      expect(slot.starts_at.y).to eq 0
      expect(slot.ends_at).to be_a Store::Position
      expect(slot.ends_at.x).to eq 4
      expect(slot.ends_at.y).to eq 2
    end
  end
end
