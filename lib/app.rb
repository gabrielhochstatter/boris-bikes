require_relative 'bikecontainer'
require_relative 'van'
require_relative 'garage'

class DockingStation

    include BikeContainer
    DEFAULT_CAPACITY = 20
    attr_accessor :bikerack, :capacity
    #attr_reader :DEFAULT_CAPACITY
    def initialize(capacity = DEFAULT_CAPACITY)
      raise "Capacity cannot be negative!!" if capacity < 0
      @bikerack = container
      #deposit_bike(bike) if bike
      @capacity = capacity
    end

    def release_bike
      raise "No bikes available" if bikerack_empty? || all_broken?
      w_index = @bikerack.index {|bike| bike.working}
      @bikerack.delete_at(w_index)
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

    def all_broken?
      !@bikerack.any? {|bike| bike.working}
    end

    def deposit_bike(bike)
      @bikerack << bike
    end

end

class Bike
    attr_accessor :working
    def initialize
      @working = true
    end

    def working?
      @working
    end

    def report_broken
      @working = false
    end
end
