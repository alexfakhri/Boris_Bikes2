require 'docking_station'

describe DockingStation do

  describe '#release_bike' do

    let(:bike) { double(:bike, broken?: false, working?: true) }

    it 'releases a Bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bikes' do
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).not_to be_broken
    end

    it 'does not release broken bikes' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises and erorr when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'raises an error when full' do
      subject.capacity.times { subject.dock double :bike }
      expect{ subject.dock double(:bike) }.to raise_error 'Docking station full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  end

end
