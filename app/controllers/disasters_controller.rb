class DisastersController < ApplicationController
  def index
    @disasters = Disaster.all
    @markers = @disasters.geocoded.map do |disaster|
      {
        lat: disaster.latitude,
        lng: disaster.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {disaster: disaster})
      }
    end
  end

  def show
    @disaster = Disaster.find(params[:id])
  end
end
