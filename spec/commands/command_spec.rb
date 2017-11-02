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

    context 'init' do
      it 'should return an Init command' do
        result = Commands::Command.find('init', warehouse)

        expect(result).to be_a Commands::Init
        expect(result.warehouse).to be_a Warehouse
        expect(result.warehouse.live).to be_truthy
      end
    end

    context 'store' do
      it 'should return a Store command' do
        result = Commands::Command.find('store', warehouse)

        expect(result).to be_a Commands::Store
        expect(result.warehouse).to be_a Warehouse
        expect(result.warehouse.live).to be_truthy
      end
    end

    context 'remove' do
      it 'should return a Remove command' do
        result = Commands::Command.find('remove', warehouse)

        expect(result).to be_a Commands::Remove
        expect(result.warehouse).to be_a Warehouse
        expect(result.warehouse.live).to be_truthy
      end
    end

    context 'view' do
      it 'should return a View command' do
        result = Commands::Command.find('view', warehouse)

        expect(result).to be_a Commands::View
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

  describe 'WRONG_ARGUMENT_ERROR_MESSAGE' do
    it 'should return the error message' do
      expect(Commands::Command::WRONG_ARGUMENT_ERROR_MESSAGE).to eq 'Wrong number of arguments. Type `help` for instructions'
    end
  end
end
