DISASTERS_KEYS = {
  "Volcanic eruption": "éruption volcanique",
  "Earthquakes": "tremblements de terre",
  "Hurricane": "Ouragan",
  "Cyclone": "Cyclone",
  "Typhoon": "Typhon",
  "Tsunami": "Tsunami",
  "Floods": "Inondations",
  "Megafire": "Mégafeu"
}

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
