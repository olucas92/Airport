require 'airport'
require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it "should have a flying status after creation" do
    expect(plane).to be_flying
  end

  it "should be able to land" do
    expect(plane).to be_flying
    plane.land!
    expect(plane).not_to be_flying
  end

  # it "should be able to take off" do
  # end

  # it "has a flying status when in the air" do
  # end

  # it "should have its status changed to flying after take off" do
  # end

end
