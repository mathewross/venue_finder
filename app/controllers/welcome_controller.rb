class WelcomeController < ApplicationController
  include LocationHelper

  def search
    latitude = params[:post][:latitude].to_f
    longitude = params[:post][:longitude].to_f
    redirect_to results_path(:latitude => latitude, :longitude => longitude)
  end

end
