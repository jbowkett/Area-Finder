class AreaViewController < ApplicationController
  def index
    id = params[:id]
    @summary = AreaSummary.find(id)
    @area = @summary.area
    @primary_schools = @area.schools.select(&:is_primary?)
    @secondary_schools = @area.schools.reject(&:is_primary?)
  end
end
