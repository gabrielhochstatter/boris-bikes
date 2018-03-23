require "bikecontainer"

class Garage

  include BikeContainer
  attr_accessor :workshop
  def initialize
    @workshop = container
  end

  def fix_bikes
    @workshop.each { |bike| fix(bike) }
  end

  private

  def fix(bike)
    bike.working = true
  end

end

=begin

[FINISHED] Fix all the broken bikes in the garage's workshop => fix_bikes
    go through bikes and set working to true DONE


=end
