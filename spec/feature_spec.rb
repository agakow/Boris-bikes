require './lib/docking_station'
st = DockingStation.new
b1 = Bike.new
b2 = Bike.new
b1.report
b2.report
st.dock b1
st.dock b2
van = Van.new
van.takes_broken_bikes st
garage = Garage.new
van.drops_off_broken_bikes garage
garage.bikes_at_garage
garage.fix_bikes
van.accepts_fixed_bikes(garage)
van.brokenbikes
garage.bikes_at_garage
van.fixed_bikes
van.drops_off_fixed_bikes(st)
van.fixed_bikes
st.bikes
