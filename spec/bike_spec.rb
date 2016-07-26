require 'bike'

describe Bike do

  it 'is not broken on initialization' do
    bike = Bike.new
    expect(bike).not_to be_broken
  end

  it 'can be reported broke' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
