class Api::DistanceController < ApplicationController
  include LocationHelper

  def closest_venues
    # Api integration for closest venues for a given lat long, provided as a string comma separated
    lat_long = params[:ll]
    base_latitude = lat_long.split(",")[0].to_f
    base_longitude = lat_long.split(",")[1].to_f
    results = get_nearest_results(base_latitude, base_longitude)
    render json: {
      closest_venues: results
    }, status: 200
  end

end
