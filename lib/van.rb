#require "app"

class Van

  attr_accessor :inventory
  def initialize
    @inventory = []
  end

  def take_bikes(dockingstation)
    dockingstation.bikerack.each { |bike| @inventory << bike if bike.working? == false }
    dockingstation.bikerack.delete_if {|bike| bike.working? == false}
  end

  def deliver_bikes(garage)

  end

  def collect_bikes(garage)

  end

  def distribute_bikes(dockingstation)

  end


end


=begin
Van methods/actions

[FINISHED] pickup broken bikes from DockingStations => take_bikes(from a DockingStation)
    only collect broken bikes DONE
    store them in Van DONE
    remove broken bikes from DockingStation's bikerack DONE

deliver broken bikes to Garages => deliver_bikes(Garage to deliver to)
    argument is the garage to deliver to
    remove the bikes from Van
    add them to Garage's inventory

collect fixed bikes => collect_bikes(Garage to collect from)
    add only the fixed bikes to Van's inventory
    remove the fixed bikes from Garage

distribute fixed bikes => distribute_bikes(DockingStation to deliver to)
    transfer fixed bikes only to DockingStation
    keep any broken bikes in the Van

=end
