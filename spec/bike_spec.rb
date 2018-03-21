require 'app'

describe Bike do 
    it { is_expected.to respond_to :working }
    it "new bike is working" do
      expect(Bike.new.working).to eq true
    end
    it "allows to report a broken bike" do
      docking_station = DockingStation.new
      bike = Bike.new
      docking_station.dock(bike, true)
      expect(bike.working).to eq false
    end
end 
