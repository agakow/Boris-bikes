require 'docking_station'


describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :dock }


  describe '#release_bike' do

    it 'raises an error when empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when all bikes are broken' do
      bike  = double(:bike, :report => false, :working? => false)
      bike.report
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'All bikes are broken'
    end

    it 'release working bikes' do
      bike = double(:bike, :working? => true)
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock' do

    it 'raises an error when full' do
      subject.capacity.times {subject.dock double :bike}
      expect {subject.dock(double :bike)}.to raise_error 'No spaces to dock bike'
    end

    it 'docks a bike' do
      bike = double :bike
      expect(subject.dock(bike)).to eq bike
    end
  end

  describe '#capacity' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'allows user to set @capacity' do
      docking_station = DockingStation.new 10
      expect(docking_station.capacity).to eq(10)
    end

  end
end
