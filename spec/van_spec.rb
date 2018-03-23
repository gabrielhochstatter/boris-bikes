require 'van'
require "app"

describe Van do
  subject(:van) { described_class.new }
  let(:test_station) { DockingStation.new }
  let(:test_bike) { Bike.new }
  let(:broken_bike) { Bike.new }
  let(:test_garage) { Garage.new }
  let(:bike) { double :bike }
  let(:station) { double :station }


  describe '#take_bikes' do
    before do
      allow(station).to receive(:take_bikes)
      broken_bike.report_broken
      test_station.dock(broken_bike)
    end

    it "responds to #take_bikes" do
      expect(van).to respond_to(:take_bikes)
    end

    it "the vans inventory has the taken bikes" do
      van.take_bikes(test_station)
      expect(van.inventory).to include broken_bike
    end

    it "only takes broken bikes (not working ones) from the station" do
      test_station.dock(test_bike)
      van.take_bikes(test_station)
      expect(van.inventory).to match_array [broken_bike]
    end

    it "broken bikes are removed from the DockingStation's bikerack" do
      test_station.dock(test_bike)
      van.take_bikes(test_station)
      expect(test_station.bikerack).to match_array [test_bike]
    end

  end

  describe '#deliver_bikes' do
    before do
      allow(station).to receive(:take_bikes)
      broken_bike.report_broken
      test_station.dock(broken_bike)
      van.take_bikes(test_station)
    end

    it "removes bikes from the vans inventory" do
      van.take_bikes(test_station)
      van.deliver_bikes(test_garage)
      expect(van.inventory.empty?).to be
    end

    it "places the removed bikes into the garage's workshop" do
      van.take_bikes(test_station)
      van.deliver_bikes(test_garage)
      expect(test_garage.workshop).to include broken_bike
    end

  end

  describe '#collect_bikes' do
    before do
      broken_bike.report_broken
      test_garage.workshop << test_bike
      test_garage.workshop << broken_bike
    end

    it "van responds to #collect_bikes" do
      expect(van).to respond_to(:collect_bikes)
    end

    it "raises error if all bikes are broken (no bikes to pick up)" do
      test_bike.report_broken
      expect { van.collect_bikes(test_garage) }.to raise_error "All bikes are broken! Cannot pick up bikes!"
    end

    it "removes the fixed/working bikes from the garage" do
      van.collect_bikes(test_garage)
      expect(test_garage.workshop.map { |bike| bike.working? }).to all(be_falsey)
    end

    it "adds only fixed bikes to the vans inventory" do
      van.collect_bikes(test_garage)
      expect(van.inventory.map { |bike| bike.working? }).to all(be)
    end

  end


end
