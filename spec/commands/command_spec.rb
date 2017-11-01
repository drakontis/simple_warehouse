require "spec_helper"

describe Commands::Command do
  let(:warehouse) { Warehouse.new(live: true) }
  subject{ Commands::Command.new(warehouse: warehouse) }

  describe '#initialize' do
    it 'should create a new command' do
      expect(subject).to be_a Commands::Command
      expect(subject.warehouse).to be_a Warehouse
    end
  end

  describe '#find' do
    context 'exit' do
      it 'should return an Exit command' do
        result = Commands::Command.find('exit', warehouse)

        expect(result).to be_a Commands::Exit
        expect(result.warehouse).to be_a Warehouse
        expect(result.warehouse.live).to be_truthy
      end
    end

    context 'help' do
      it 'should return a Help command' do
        result = Commands::Command.find('help', warehouse)

        expect(result).to be_a Commands::Help
        expect(result.warehouse).to be_a Warehouse
        expect(result.warehouse.live).to be_truthy
      end
    end
  end

  describe '#execute' do
    it 'should raise a NotImplementedError' do
      expect{subject.execute}.to raise_error NotImplementedError
    end
  end
end
