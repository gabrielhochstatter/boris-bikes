require 'app'

describe 'DockingStation' do

    let(:bike) { double :bike }

    it 'responds to release_bike' do
        expect(DockingStation.new).to respond_to(:release_bike)
    end


    it 'lets you dock a bike' do
      expect(DockingStation.new).to respond_to(:dock).with(1).argument
    end

    it 'docks something' do
      expect(DockingStation.new.dock(bike)).to eq bike
    end

    it 'starts empty' do
      expect(DockingStation.new.bikerack).to be_empty
    end

    it 'sets the default capacity when not called' do
      expect(DockingStation.new.capacity).to eq DockingStation::DEFAULT_CAPACITY
      #default capacity predefined so scope operator (::) called without creating new instance of class, whereas for capacity variable new instance of the class needs to be created first
    end

    describe '#release_bike' do
      it 'raises error when no bikes' do
        expect { DockingStation.new.release_bike }.to raise_error 'No bikes available'
      end

      it "raises error when all the bikes are broken" do
        allow(bike).to receive(:report_broken).and_return(false)
        allow(bike).to receive(:working).and_return(false)
        test_station = DockingStation.new
        broken_bike = bike
        broken_bike.report_broken
        test_station.dock(broken_bike)

        expect {test_station.release_bike}.to raise_error "No bikes available"
      end

      it "returns last bike if there are any in the station" do
        allow(bike).to receive(:report_broken).and_return(true)
        allow(bike).to receive(:working).and_return(true)
        test_bike = bike
        expect(DockingStation.new(test_bike).release_bike).to eq test_bike
      end

      it "returned bike is working" do
        allow(bike).to receive(:report_broken).and_return(false)
        allow(bike).to receive(:working).and_return(true)
        broken_bike = bike
        broken_bike.report_broken
        working_bike = bike
        test_station = DockingStation.new

        test_station.dock(working_bike)
        test_station.dock(broken_bike)
        released_bike = test_station.release_bike
        expect(released_bike.working).to eq true
      end
    end

    describe '#dock' do
      it 'raises error when someone tries to dock a bike at a full station (20 bikes)' do
        test_station = DockingStation.new(double(:bike))
        test_bike = double(:bike)
        19.times do test_station.dock(double(:bike)) end
        #Bike.new called for new bike object passed in 19 times
        expect { test_station.dock(test_bike) }.to raise_error 'Station is full'
      end





    end

end
