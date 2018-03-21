require 'app'

describe 'DockingStation' do
    it 'responds to release_bike' do
        expect(DockingStation.new).to respond_to(:release_bike)
    end

    it 'lets you dock a bike' do
      expect(DockingStation.new).to respond_to(:dock).with(1).argument
    end

    it 'docks something' do
      bike = Bike.new
      expect(DockingStation.new.dock(bike)).to eq bike
    end

    it 'starts empty' do
      expect(DockingStation.new.bikerack).to be_empty
    end

    describe '#release_bike' do
      it 'raises error when no bikes' do
        expect { DockingStation.new.release_bike }.to raise_error 'No bikes available'
      end

      it "returns last bike if there are any in the station" do
        test_bike = Bike.new
        expect(DockingStation.new(test_bike).release_bike).to eq test_bike
      end
    end

    describe '#dock' do
      it 'raises error when someone tries to dock a bike at a full station (20 bikes)' do
        test_station = DockingStation.new(Bike.new)
        test_bike = Bike.new
        19.times do test_station.dock(Bike.new) end
        expect { test_station.dock(test_bike) }.to raise_error 'Station is full'
      end

    end

end
