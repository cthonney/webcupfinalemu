DISASTERS_KEYS = {
  "Volcanic eruption": "volcano.png",
  "Earthquakes": "earthquake.png",
  "Hurricane": "hurricane.png",
  "Cyclone": "cyclone.png",
  "Typhoon": "typhoon.png",
  "Tsunami": "tsunami.png",
  "Floods": "flood.png",
  "Megafire": "fire.png"
}

class DisastersController < ApplicationController
skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @disasters = Disaster.all
    @recent_disasters = Disaster.where("created_at > ?", Time.now - 4.hour )
    @markers = @recent_disasters.geocoded.map do |disaster|
      {
        lat: disaster.latitude,
        lng: disaster.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {disaster: disaster}),
        marker_html: render_to_string(partial: "marker", locals: { disaster: disaster, keys: DISASTERS_KEYS })
      }
    end

    @all_markers = @disasters.geocoded.map do |disaster|
      {
        lat: disaster.latitude,
        lng: disaster.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {disaster: disaster}),
        marker_html: render_to_string(partial: "marker", locals: { disaster: disaster, keys: DISASTERS_KEYS })
      }
    end
  end

  def show
    @disaster = Disaster.find(params[:id])
    @review = Review.new
    @past_disasters = Disaster.where("created_at < ?", Time.now - 4.hour ).near([@disaster.latitude, @disaster.longitude], 1000)
    @marker =
      {
        lat: @disaster.latitude,
        lng: @disaster.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {disaster: @disaster}),
        marker_html: render_to_string(partial: "marker", locals: { disaster: @disaster, keys: DISASTERS_KEYS })
      }
  end
end
