require 'van'

describe Van do

it 'takes broken bikes from the docking station' do
  bike = double(:bike, :report => false, :working? => false)
  bike.report
  station = DockingStation.new
  station.dock(bike)
  expect(subject.takes_broken_bikes(station)).to eq [bike]
end

it 'drops off at garage' do
  bike = double(:bike, :report => false, :working? => false)
  bike.report
  station = DockingStation.new
  station.dock(bike)
  subject.takes_broken_bikes(station)
  expect(subject.drops_off).to eq [] 
end

end
