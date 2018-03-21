
class DockingStation

    DEFAULT_CAPACITY = 20
    attr_accessor :bikerack, :capacity
    #attr_reader :DEFAULT_CAPACITY
    def initialize(bike = nil, capacity = DEFAULT_CAPACITY)
      @bikerack = []
      deposit_bike(bike) if bike
      @capacity = capacity
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
      @bikerack.size >= @capacity
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
