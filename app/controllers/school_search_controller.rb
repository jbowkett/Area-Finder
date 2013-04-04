class SchoolSearchController < ApplicationController
  def request_download
    summary_id = params[:id]
    summary = AreaSummary.find(summary_id)
    summary.include_in_school_search = true
    summary.save!
    flash[:notice] = "#{summary.area.name} included in school search"
    redirect_to :back
  end
end
