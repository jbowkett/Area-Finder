class AreaSummariser

  def self.set_summary_for(area)
    all_areas_with_this_name = Area.all.select{|from_all_areas_area| from_all_areas_area.name == area.name}
    previously_summarised = all_areas_with_this_name.select { |selected_area| !selected_area.areaSummary.nil? }
    should_create_summary = previously_summarised.size == 0
    if(should_create_summary)
      shortest_journey = shortest_journey(area)
      area.set_summary(shortest_journey)
    end
  end

  def self.shortest_journey(area)
    area.journeys.min_by{|journey|journey.duration}
  end
end