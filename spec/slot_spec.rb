require 'spec_helper'

describe Slot do
  subject(:slot){ Slot.new(starts_at: Position.new(x: 5, y: 3), ends_at: Position.new(x: 7, y: 5)) }

  describe '#initialize' do
    it 'should create a new slot' do
      expect(subject).to be_a Slot
      expect(subject.starts_at).to be_a Position
      expect(subject.starts_at.x).to eq 5
      expect(subject.starts_at.y).to eq 3
      expect(subject.ends_at).to be_a Position
      expect(subject.ends_at.x).to eq 7
      expect(subject.ends_at.y).to eq 5
    end
  end

  describe '#overlaps_with' do
    it "should return true if slot contains the second slot's starts_at" do
      slot = Slot.new(starts_at: Position.new(x: 6, y: 4), ends_at: Position.new(x: 8, y: 6))

      expect(subject.overlapping?(slot)).to be_truthy
    end

    it "should return true if slot contains the second slot's ends_at" do
      slot = Slot.new(starts_at: Position.new(x: 0, y: 0), ends_at: Position.new(x: 6, y: 4))

      expect(subject.overlapping?(slot)).to be_truthy
    end

    it "should return false none of starts_at and ends_at of the second slot are contained in the first slot" do
      slot = Slot.new(starts_at: Position.new(x: 0, y: 0), ends_at: Position.new(x: 1, y: 1))

      expect(subject.overlapping?(slot)).to be_falsey
    end
  end

  describe '#contains' do
    it 'should return true if a slot contains a position' do
      position = Position.new(x: 6, y: 4)

      expect(subject.contains(position)).to be_truthy
    end

    it 'should return false if a slot does not contains a position' do
      position = Position.new(x: 8, y: 9)

      expect(subject.contains(position)).to be_falsey
    end
  end
end
