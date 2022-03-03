class Api::DistanceController < ApplicationController
  include LocationHelper

  def closest_venues
    # Api integration for closest venues for a given lat long, provided as a string comma separated
    lat_long = params[:ll]
    base_latitude = lat_long.split(",")[0].to_f
    base_longitude = lat_long.split(",")[1].to_f
    if lat_long_ok?(base_latitude, base_longitude)
      results = get_nearest_results(base_latitude, base_longitude)
      render json: {
        closest_venues: results
      }, status: 200
    else
      render json: {
        status: 400,
        message: "Invalid latitude or longitude provided, a latitude must be between -90 and 90, and a longitude must be between -180 and 180"
      }, status: 400
    end
  end

  private

  def lat_long_ok?(lat, long)
    if lat.nil? || long.nil? || lat > 90 || lat < -90 || long > 180 || long < -180
      return false
    else
      return true
    end
  end

end
