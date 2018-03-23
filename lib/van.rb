#require "app"
#require "bikecontainer"

class Van

  include BikeContainer
  attr_accessor :inventory
  def initialize
    @inventory = container
  end

  def take_bikes(dockingstation)
    dockingstation.bikerack.each { |bike| @inventory << bike if bike.working? == false }
    dockingstation.bikerack.delete_if {|bike| bike.working? == false}
  end

  def deliver_bikes(garage)
    @inventory.each { |bike| garage.workshop << bike }
    @inventory.clear
  end

  def collect_bikes(garage)
    raise "All bikes are broken! Cannot pick up bikes!" if !garage.workshop.any? { |bike| bike.working? }
    garage.workshop.each { |bike| @inventory << bike if bike.working? }
    garage.workshop.delete_if { |bike| bike.working? }
  end

  def distribute_bikes(dockingstation)
    @inventory.each { |bike| dockingstation.bikerack << bike if bike.working? }
    @inventory.delete_if { |bike| bike.working? }
  end

  private

end


=begin
Van methods/actions

[FINISHED] pickup broken bikes from DockingStations => take_bikes(from a DockingStation)
    only collect broken bikes DONE
    store them in Van DONE
    remove broken bikes from DockingStation's bikerack DONE

[FINISHED] deliver broken bikes to Garages => deliver_bikes(Garage to deliver to)
    argument is the garage to deliver to DONE
    remove the bikes from Van DONE
    add them to Garage's workshop DONE

[FINISHED] collect fixed bikes => collect_bikes(Garage to collect from)
    remove the fixed bikes from Garage DONE
    add only the fixed bikes to Van's inventory DONE
    raises error if all bikes in garage are broken DONE


[FINISHED] distribute fixed bikes => distribute_bikes(DockingStation to deliver to)
    remove fixed bikes from the van DONE
    transfer fixed bikes only to DockingStation DONE
    keep any broken bikes in the Van DONE

=end
