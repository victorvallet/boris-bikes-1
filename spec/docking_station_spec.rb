require 'docking_station'

describe DockingStation do

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to :bikes }

  it 'docks returning bikes (broken or not)' do
    bike = Bike.new
    expect(subject.dock(bike).last).to eq bike
  end

  it 'releases docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  describe 'initialization' do
    it 'raises an error when full' do
      # 20.times { subject.dock Bike.new }
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
  

  describe '#release_bike' do

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it { is_expected.to respond_to :release_bike }

    it 'returns a working bike' do
       bike = Bike.new
       subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it "Should not release a broken bike" do
      # allow(bike).to receive(:broken?).and_return(false)
      bike = Bike.new
      bike.broken = true
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'This bike is broken'
    end

  end
end
