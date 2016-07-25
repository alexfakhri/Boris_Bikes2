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

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end


end
