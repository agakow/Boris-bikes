require 'van'

describe Van do

it 'takes broken bikes' do
  bike = double(:bike, :report => false, :working? => false)
  bike.report
  station = DockingStation.new
  station.dock(bike)
  expect(subject.takes_broken_bikes).to eq [bike]
end

end
