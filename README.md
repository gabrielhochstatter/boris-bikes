# boris-bikes #

Week one makers academy challenge on testing with rspec.

## Features

### Docking Station

Holds bikes up to a certain capacity (default is set to DEFAULT_CAPACITY at 20). Capacities other than the default of 20 can be set at initialization.

Allows user to deposit bikes with the #dock method, passing the bike to dock as an argument. This will then add the bike into the bikerack array.

Users can request a bike, and the DockingStation will return them a working bike. Attempting to request a bike when there are no bikes or all the bikes are broken will raise an error.

### Bike

Bike object to be stored in DockingStations. Has an attribute working? which is set to true if the bike is working.

Users can report the bike as broken by calling the #report_broken method on the bike instance.

### Van

#### .take_bikes(dockingstation)
Can pick up broken bikes from any DockingStation instance using the #take_bikes method while passing the DockingStation as an argument. #take_bikes will only remove broken bikes from the station.

#### .deliver_bikes(garage)
Bikes can be delivered to a Garage instance using the #deliver_bikes method passing the Garage instance as an argument. Bikes will be placed into the Garage's workshop and removed from the Van's inventory.

#### .collect_bikes(garage)
Vans can collect working bikes from a garage (passed as an argument). Only takes fixed bikes and removes them from the garage's workshop and adds them to the van's inventory. If a garage only has broken bikes an error will be raised.

Unimplemented features:
- Distributing the fixed bikes back to a DockingStation instance (#distribute_bikes)

### Garage

Holds bikes of any type (broken or working). Call the #fix_bikes method on the garage instance to fix all the bikes in the garage's workshop.
