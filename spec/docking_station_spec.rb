require 'docking_station'

describe DockingStation do 
  let (:bike) { double :bike }
  
  it { is_expected.to respond_to :release_bike }
  

  it 'releases working bikes' do
    allow(bike).to receive(:broken?).and_return(nil)
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike.broken?).to eq nil
  end 

  it { is_expected.to respond_to :dock }
  it { is_expected.to respond_to(:dock).with(1).argument } 

  it 'docks something' do
    expect(subject.dock(bike)).to eq [bike]
  end 

  it 'returns docked bikes' do
    subject.dock(bike)
    expect(subject.dock(@bikes)).not_to be_empty
  end 


  it 'allow user to set a capacity' do
    docking_station = DockingStation.new(25)
    expect(docking_station.capacity).to eq 25
  end

  it 'uses DEFAULT_CAPACITY when no argument is given' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'release_bike' do
    it 'release a bike' do
      allow(bike).to receive(:broken?).and_return(nil)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  
    describe '#release_bike' do
      it 'raised an error when there are no bikes available' do
        expect{ subject.release_bike }.to raise_error "No bikes available"
      end

      it 'does not release bike if broken' do
        allow(bike).to receive(:broken?).and_return(true)
        subject.dock(bike)
        expect{ subject.release_bike }.to raise_error "No working bikes available"
      end
    end 

    describe '#dock' do
      it "raised an error when full" do
        DockingStation::DEFAULT_CAPACITY.times { subject.dock double(:bike) }
        expect { subject.dock double(:bike) }.to raise_error "No space available"
      end

      it 'allows user to return broken bike' do
        allow(bike).to receive(:broken?).and_return(true)
        subject.dock(bike)
        expect(bike.broken?).to eq true
      end
    end
  end
end 
