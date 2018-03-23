require 'garage'
require 'app'

describe Garage do
  subject(:garage) { described_class.new }
  let(:broken_bike) { Bike.new }
  let(:broken_bike_2) { Bike.new }

  before do
    broken_bike.report_broken
    broken_bike_2.report_broken
    garage.workshop << broken_bike
  end

  describe '#fix_bikes'
    it "responds to fix_bikes" do
      expect(garage).to respond_to(:fix_bikes)
    end

    it "sets the first bike's working? state to true" do
      garage.fix_bikes
      expect(garage.workshop[0].working?).to be 
    end

    it "sets all the bikes in the workshop to be working" do
      garage.workshop << broken_bike_2
      garage.fix_bikes
      expect(garage.workshop.map {|bike| bike.working?}).to all(be)
    end





end
