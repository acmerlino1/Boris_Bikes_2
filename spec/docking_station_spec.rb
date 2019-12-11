require 'docking_station'

describe DockingStation do
    docking_station = DockingStation.new
    it { is_expected.to respond_to :release_bike }

    it 'releases working bike' do
    bike = docking_station.release_bike
    expect(bike).to be_working
    end

    it 'docks a bike' do
        bike = Bike.new
      expect(docking_station.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
        bike = Bike.new
        docking_station.dock(bike)
        expect(docking_station.bike).to eq bike
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }
end
