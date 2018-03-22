require 'van'
require "app"

describe Van do
  subject(:van) { described_class.new }
  let(:bike) { double :bike }
  let(:station) { double :station }


  describe '#take_bikes' do
    before do
      allow(station).to receive(:take_bikes)
    end

    it "responds to #take_bikes" do
      expect(van).to respond_to(:take_bikes)
    end

    it "the vans inventory has the taken bikes" do
      test_bike = Bike.new
      test_station = DockingStation.new
      test_bike.report_broken
      test_station.dock(test_bike)
      van.take_bikes(test_station)
      expect(van.inventory).to include test_bike
    end

    it "only takes broken bikes from the station" do
      test_bike = Bike.new
      broken_bike = Bike.new
      broken_bike.report_broken
      test_station = DockingStation.new
      test_station.dock(test_bike)
      test_station.dock(broken_bike)
      van.take_bikes(test_station)
      expect(van.inventory).to match_array [broken_bike]
    end

    it "removes the broken bikes from the DockingStation" do
      test_bike = Bike.new
      broken_bike = Bike.new
      broken_bike.report_broken
      test_station = DockingStation.new
      test_station.dock(test_bike)
      test_station.dock(broken_bike)
      van.take_bikes(test_station)
      expect(test_station.bikerack).to match_array [test_bike]
    end
  end

  describe '#deliver_bikes' do
    
  end


end
