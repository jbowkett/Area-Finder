class AreaSummaryController < ApplicationController
  def index
    @areas = AreaSummary.all.sort {|a,b| a.name <=> b.name }

  end
end
