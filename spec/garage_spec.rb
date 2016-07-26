require 'garage'

describe Garage do

  it_behaves_like BikeContainer

  describe '#fix_bike' do

    it 'fixes broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.add_bike(bike)
      subject.fix_bike(bike)
      expect(bike).not_to be_broken
    end

  end

end
