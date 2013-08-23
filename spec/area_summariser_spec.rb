require "rspec"

require_relative '../lib/area_summariser.rb'
describe AreaSummariser do

  let(:journeys) { [] }
  let(:schools)  { [] }
  let(:area)     { double(:area, :journeys => journeys, :schools => schools) }
  context "of journeys" do
    let(:shortest)  { double(:journey, :destination_station => 'Euston', :duration => 30, :changes => 0, :frequency => 10) }
    let(:longer)    { double(:journey, :destination_station => 'Euston', :duration => 31, :changes => 1, :frequency => 5) }
    let(:longest)   { double(:journey, :destination_station => 'Waterloo', :duration => 45, :changes => 0, :frequency => 5) }
    let(:journeys)  { [longer, shortest, longest] }

    it "should choose the shortest journey" do
      AreaSummariser.shortest_journey(area).should == shortest
    end

  end

  context "for 2 primary schools" do
    it "calculate the median overall overall inspection grade for school effectiveness score" do
      true.should == false
    end
  end
end
