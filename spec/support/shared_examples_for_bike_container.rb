shared_examples_for BikeContainer do

  it 'has a default capacity when initilized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

end
