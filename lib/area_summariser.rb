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
end
