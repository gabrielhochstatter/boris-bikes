class DockingStation

    attr_reader :bikerack


    def initialize(bike = nil)

      @bikerack = []
      deposit_bike(bike) if bike

    end

    def release_bike
      raise "No bikes available" if bikerack_empty?
      @bikerack.pop
    end

    def dock(bike)
      raise "Station is full" if bikerack_full?
      deposit_bike(bike)
      return bike
    end

    private


    def bikerack_full?
      @bikerack.size >= 20
    end

    def bikerack_empty?
      @bikerack.empty?
    end

    def deposit_bike(bike)
      @bikerack << bike
    end

end

class Bike
    def working?
    end
end
