class AreaSummariser

  def self.set_summary_for(area)
    shortest_journey = shortest_journey(area)
    area.set_summary(shortest_journey)
  end

  def self.shortest_journey(area)
    area.journeys.min_by{|journey|journey.duration}
  end
end