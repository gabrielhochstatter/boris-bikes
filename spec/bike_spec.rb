require 'app'

describe Bike do
    it { is_expected.to respond_to :working }
    it "new bike is working" do
      expect(Bike.new.working).to eq true
    end
    it "allows to report a broken bike" do
      broken_bike = Bike.new
      broken_bike.report_broken
      expect(broken_bike.working).to eq false
    end
end
