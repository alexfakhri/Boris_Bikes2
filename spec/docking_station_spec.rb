require 'docking_station'

describe DockingStation do

  it_behaves_like BikeContainer

  describe '#release_bike' do

    let(:bike) { double(:bike, broken?: false) }

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

  end

  describe '#dock' do

    let(:bike) { double(:bike)}

    it 'docks a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

  end

end
