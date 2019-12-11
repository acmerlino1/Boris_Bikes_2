require 'docking_station'

describe DockingStation do
    docking_station = DockingStation.new
    it { is_expected.to respond_to :release_bike }

    it 'releases bike' do
    bike = docking_station.release_bike
    expect(bike).to be_working
    end
end
