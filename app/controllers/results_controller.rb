class ResultsController < ApplicationController
  include LocationHelper

  def index
    @latitude = params[:latitude].to_f
    @longitude = params[:longitude].to_f
    @results = get_nearest_results(@latitude, @longitude)
  end

end
