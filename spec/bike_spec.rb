require 'bike'

describe Bike do
  it { is_expected.to respond_to :broken?}

  it "report if bike is broken" do
    expect(subject.report_broken).to eq true
  end
end  