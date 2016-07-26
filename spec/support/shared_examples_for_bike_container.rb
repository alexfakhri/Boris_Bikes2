require 'bike_container'

shared_examples_for BikeContainer do

  describe 'initialization' do

    subject { described_class.new }
    let(:bike) { double(:bike) }

    it 'has a default capacity when initilized' do
      expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it 'does not accept more bikes than capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.add_bike(bike)
      end
      expect{ subject.add_bike(bike) }.to raise_error "#{described_class.name} full"
    end

    it 'has a variable capacity' do
      bike_container = described_class.new(50)
      50.times { bike_container.add_bike Bike.new }
      expect{ bike_container.add_bike Bike.new }.to raise_error "#{described_class.name} full"
    end

    it 'can be overriden on initialization' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end

  end

  describe 'add_bike' do

    let(:bike) { double(:bike) }

    it 'receives a bike' do
      subject.add_bike(bike)
      expect(subject).not_to be_empty
    end

    it 'raises and error when full' do
      subject.capacity.times { subject.add_bike(bike) }
      expect { subject.add_bike(bike) }.to raise_error "#{described_class.name} full"
    end

  end

  describe 'remove_bike' do

    let(:bike) { double(:bike) }

    before(:each) { subject.add_bike bike }

    it 'returns a bike' do
      expect(subject.remove_bike).to eq bike
    end

    it 'removes a bike from the collection' do
      subject.remove_bike
      expect(subject).to be_empty
    end

    it "raises and error when empty" do
      subject.remove_bike
      expect { subject.remove_bike }.to raise_error "#{described_class.name} empty"
    end

  end

end
