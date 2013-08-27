require 'rspec'

require_relative '../lib/area_summariser.rb'
describe AreaSummariser do

  context 'of journeys' do
    let(:shortest)  { double(:journey, :destination_station => 'Euston', :duration => 30, :changes => 0, :frequency => 10) }
    let(:longer)    { double(:journey, :destination_station => 'Euston', :duration => 31, :changes => 1, :frequency => 5) }
    let(:longest)   { double(:journey, :destination_station => 'Waterloo', :duration => 45, :changes => 0, :frequency => 5) }
    let(:journeys)  { [longer, shortest, longest] }
    let(:area)     { double(:area, :journeys => journeys) }

    it 'should choose the shortest journey' do
      AreaSummariser.shortest_journey(area).should == shortest
    end
  end

  context 'for overall inspection grade of 5 schools' do
    let(:schools)  { [
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 1),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 4),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 5),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 5),
        double(:school, :overall_inspection_grade_for_school_effectiveness_score => 5)
    ] }
    it 'calculates the median score' do
      AreaSummariser.median_overall_inspection_grade_for_school_effectiveness_score_for(schools).should == 5
    end
    it 'calculates the mean score' do
      AreaSummariser.mean_overall_inspection_grade_for_school_effectiveness_score_for(schools).should == 4
    end
  end
  context 'for achievement score of 5 schools' do
    let(:schools)  { [
        double(:school, :achievement_score => 1),
        double(:school, :achievement_score => 4),
        double(:school, :achievement_score => 5),
        double(:school, :achievement_score => 5),
        double(:school, :achievement_score => 5)
    ] }
    it 'calculates the median score' do
      AreaSummariser.median_achievement_score_for(schools).should == 5
    end
    it 'calculates the mean score' do
      AreaSummariser.mean_achievement_score_for(schools).should == 4
    end
  end
  context 'for pupil behaviour and safety score of 5 schools' do
    let(:schools)  { [
        double(:school, :pupil_behaviour_and_safety_score => 1),
        double(:school, :pupil_behaviour_and_safety_score => 4),
        double(:school, :pupil_behaviour_and_safety_score => 5),
        double(:school, :pupil_behaviour_and_safety_score => 5),
        double(:school, :pupil_behaviour_and_safety_score => 5)
    ] }
    it 'calculates the median score' do
      AreaSummariser.median_pupil_behaviour_and_safety_score_for(schools).should == 5
    end
    it 'calculates the mean score' do
      AreaSummariser.mean_pupil_behaviour_and_safety_score_for(schools).should == 4
    end
  end
  context 'for quality of teaching score of 5 schools' do
    :quality_of_leadership_score
    let(:schools)  { [
        double(:school, :quality_of_teaching_score  => 1),
        double(:school, :quality_of_teaching_score  => 4),
        double(:school, :quality_of_teaching_score  => 5),
        double(:school, :quality_of_teaching_score  => 5),
        double(:school, :quality_of_teaching_score  => 5)
    ] }
    it 'calculates the median score' do
      AreaSummariser.median_quality_of_teaching_score_for(schools).should == 5
    end
    it 'calculates the mean score' do
      AreaSummariser.mean_quality_of_teaching_score_for(schools).should == 4
    end
  end
  context 'for quality of leadership score of 5 schools' do
    let(:schools)  { [
        double(:school, :quality_of_leadership_score => 1),
        double(:school, :quality_of_leadership_score => 4),
        double(:school, :quality_of_leadership_score => 5),
        double(:school, :quality_of_leadership_score => 5),
        double(:school, :quality_of_leadership_score => 5)
    ] }
    it 'calculates the median score' do
      AreaSummariser.median_quality_of_leadership_score_for(schools).should == 5
    end
    it 'calculates the mean score' do
      AreaSummariser.mean_quality_of_leadership_score_for(schools).should == 4
    end
  end
end
