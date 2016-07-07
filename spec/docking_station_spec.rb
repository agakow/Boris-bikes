require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :dock }
  it { is_expected.to respond_to :bikes }

  describe '#release_bike' do

    it 'raises an error' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'release working bikes' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock' do

    it 'raises an error when full' do
      expect {21.times{ subject.dock(Bike.new) }}.to raise_error 'No spaces to dock bike'
    end

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
  end

end
