require 'docking_station'

describe DockingStation do

  describe '#release_bike' do

    it 'releases a Bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
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
      subject.capacity.times { subject.dock Bike.new }
      expect{ subject.dock Bike.new }.to raise_error 'Docking station full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  end

  describe 'initialization' do

    subject { DockingStation.new }
    let(:bike) { Bike.new }

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
      expect{ docking_station.dock Bike.new }.to raise_error 'Docking station full'
    end

  end

end
