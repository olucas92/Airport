require 'airport'
require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  let(:grounded_plane) { double :plane, flying?: false }
  let(:flying_plane) { double :plane, flying?: true }

  it "should have a flying status after creation" do
    plane.fly!
    expect(plane).to be_flying
  end

  it "should be able to land" do
    plane.land!
    expect(plane).not_to be_flying
  end

  it "should be able to take off" do
    plane.land!
    plane.fly!
    expect(plane).to be_flying
  end


  # end

  # it "has a flying status when in the air" do
  # end

  # it "should have its status changed to flying after take off" do
  # end

end
