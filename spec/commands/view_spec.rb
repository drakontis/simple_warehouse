require "spec_helper"

describe Commands::View do
  let(:warehouse) { Warehouse.new(live: true, store: Store::Store.new(width: 12, height: 12)) }
  subject{ Commands::View.new(warehouse: warehouse) }

  before do
    warehouse.store.crates << Store::Crate.new(product_code: 'T', slot: Store::Slot.new(starts_at: Store::Position.new(x: 0, y: 0), ends_at: Store::Position.new(x: 3, y: 3)))
    warehouse.store.crates << Store::Crate.new(product_code: 'W', slot: Store::Slot.new(starts_at: Store::Position.new(x: 4, y: 6), ends_at: Store::Position.new(x: 5, y: 7)))
  end

  describe '#initialize' do
    it 'should create a new view command' do
      expect(subject).to be_a Commands::View
      expect(subject.warehouse).to be_a Warehouse
    end
  end

  describe '#execute' do
    context 'Without initialized store' do
      before do
        warehouse.store = nil
      end

      it 'should display error message' do
        expect{subject.execute}.to output("#{Commands::Command::NOT_INITIALIZED_ERROR_MESSAGE}\n").to_stdout
      end
    end

    context 'draw' do
      it 'should draw the store' do
        output = "11 _ _ _ _ _ _ _ _ _ _  _  _
10 _ _ _ _ _ _ _ _ _ _  _  _
9  _ _ _ _ _ _ _ _ _ _  _  _
8  _ _ _ _ _ _ _ _ _ _  _  _
7  _ _ _ _ W W _ _ _ _  _  _
6  _ _ _ _ W W _ _ _ _  _  _
5  _ _ _ _ _ _ _ _ _ _  _  _
4  _ _ _ _ _ _ _ _ _ _  _  _
3  T T T T _ _ _ _ _ _  _  _
2  T T T T _ _ _ _ _ _  _  _
1  T T T T _ _ _ _ _ _  _  _
0  T T T T _ _ _ _ _ _  _  _
/  0 1 2 3 4 5 6 7 8 9 10 11"

        expect{subject.execute}.to output("#{output}\n").to_stdout
      end
    end
  end
end
