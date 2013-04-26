class AreaSummaryController < ApplicationController
  def index
    all_areas = AreaSummary.find(:all, :conditions => ["status != 'duplicate' "], :order => 'name')

    @areas_with_schools = all_areas.select{|area|area.schools.size >0 }
    @areas_yet_to_be_downloaded = all_areas - @areas_with_schools
  end
end
