require "rspec"

require_relative '../lib/area_summariser.rb'
describe AreaSummariser do

  context "of journeys" do
    let(:shortest)  { double(:journey, :destination_station => 'Euston', :duration => 30, :changes => 0, :frequency => 10) }
    let(:longer)    { double(:journey, :destination_station => 'Euston', :duration => 31, :changes => 1, :frequency => 5) }
    let(:longest)   { double(:journey, :destination_station => 'Waterloo', :duration => 45, :changes => 0, :frequency => 5) }
    let(:journeys)  { [longer, shortest, longest] }
    let(:area)     { double(:area, :journeys => journeys) }

    it "should choose the shortest journey" do
      AreaSummariser.shortest_journey(area).should == shortest
    end
  end

  context "for 5 primary schools" do
    let(:schools)  { [
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 1),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 4),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 5),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 5),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 5)
    ] }
    it "calculates the median overall overall inspection grade for school effectiveness score" do
      AreaSummariser.median_overall_inspection_grade_for_school_effectiveness_score_for(schools).should == 5
    end
  end
end
