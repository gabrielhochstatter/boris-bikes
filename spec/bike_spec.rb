require 'app'

describe Bike do 
    it { is_expected.to respond_to :working }
    it "new bike is working" do
      expect(Bike.new.working).to eq true
    end
end 
