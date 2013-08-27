require 'stats_calculator'

class AreaSummariser

  def self.set_summary_for(area)
    shortest_journey = shortest_journey(area)
    area.set_summary(shortest_journey)
  end

  def self.shortest_journey(area)
    area.journeys.min_by{|journey|journey.duration}
  end

  def self.median_overall_inspection_grade_for_school_effectiveness_score_for(schools)
    scores = schools.collect(&:overall_inspection_grade_for_school_effectiveness_score)
    StatsCalculator.calculate_median(scores)
  end

  def self.mean_overall_inspection_grade_for_school_effectiveness_score_for(schools)
    scores = schools.collect(&:overall_inspection_grade_for_school_effectiveness_score)
    StatsCalculator.calculate_mean(scores)
  end

  def self.median_achievement_score_for(schools)
    scores = schools.collect(&:achievement_score)
    StatsCalculator.calculate_median(scores)
  end

  def self.mean_achievement_score_for(schools)
    scores = schools.collect(&:achievement_score)
    StatsCalculator.calculate_mean(scores)
  end

  def self.median_pupil_behaviour_and_safety_score_for(schools)
    scores = schools.collect(&:pupil_behaviour_and_safety_score)
    StatsCalculator.calculate_median(scores)
  end

  def self.mean_pupil_behaviour_and_safety_score_for(schools)
    scores = schools.collect(&:pupil_behaviour_and_safety_score)
    StatsCalculator.calculate_mean(scores)
  end

  def self.median_quality_of_teaching_score_for(schools)
    scores = schools.collect(&:quality_of_teaching_score)
    StatsCalculator.calculate_median(scores)
  end

  def self.mean_quality_of_teaching_score_for(schools)
    scores = schools.collect(&:quality_of_teaching_score)
    StatsCalculator.calculate_mean(scores)
  end

  def self.median_quality_of_leadership_score_for(schools)
    scores = schools.collect(&:quality_of_leadership_score)
    StatsCalculator.calculate_median(scores)
  end

  def self.mean_quality_of_leadership_score_for(schools)
    scores = schools.collect(&:quality_of_leadership_score)
    StatsCalculator.calculate_mean(scores)
  end

end
