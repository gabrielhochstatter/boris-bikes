require 'van'
require "app"

describe Van do
  subject(:van) { described_class.new }
  let(:test_station) { double(:dockingstation, bikerack: [test_bike, broken_bike]) }
  let(:test_bike) { double(:bike, working?: true) }
  let(:transferred_bike) { double(:bike, working?: true) }
  let(:broken_bike) { double(:bike, working?: false) }
  let(:test_garage) { double(:garage, workshop: [test_bike, broken_bike]) }

  describe '#take_bikes' do

    it "responds to #take_bikes" do
      expect(van).to respond_to(:take_bikes)
    end

    it "the vans inventory has the taken bikes" do
      van.take_bikes(test_station)
      expect(van.inventory).to include broken_bike
    end

    it "only takes broken bikes (not working ones) from the station" do
      van.take_bikes(test_station)
      expect(van.inventory).to match_array [broken_bike]
    end

    it "broken bikes are removed from the DockingStation's bikerack" do
      van.take_bikes(test_station)
      expect(test_station.bikerack).to match_array [test_bike]
    end

  end

  describe '#deliver_bikes' do

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

    it "van responds to #collect_bikes" do
      expect(van).to respond_to(:collect_bikes)
    end

    it "raises error if all bikes are broken (no bikes to pick up)" do
      test_garage = double(:garage, workshop: [broken_bike])
      expect { van.collect_bikes(test_garage) }.to raise_error "All bikes are broken! Cannot pick up bikes!"
    end

    it "removes the fixed/working bikes from the garage" do
      test_garage.workshop << test_bike
      van.collect_bikes(test_garage)
      expect(test_garage.workshop.map { |bike| bike.working? }).to all(be_falsey)
    end

    it "adds only fixed bikes to the vans inventory" do
      test_garage.workshop << test_bike
      van.collect_bikes(test_garage)
      expect(van.inventory.map { |bike| bike.working? }).to all(be)
    end

  end

  describe '#distribute_bikes' do
    it "van responds to distribute_bikes" do
      expect(van).to respond_to(:distribute_bikes)
    end

    it "removes broken bikes from the van" do
      van.inventory << transferred_bike
      van.inventory << broken_bike
      van.distribute_bikes(test_station)
      expect(van.inventory).to eq [broken_bike]
    end

    it "transfers fixed bikes to the dockingstation" do
      van.inventory << transferred_bike
      van.inventory << broken_bike
      van.distribute_bikes(test_station)
      expect(test_station.bikerack).to include transferred_bike
    end





  end


end
