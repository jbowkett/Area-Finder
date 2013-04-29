class AreaSummaryController < ApplicationController
  def index
    all_areas = AreaSummary.all.sort {|a,b| a.name <=> b.name }

    @areas_with_schools = all_areas.select{|summary|summary.area.schools.size >0 }
    @areas_yet_to_be_downloaded = all_areas - @areas_with_schools
  end
end
