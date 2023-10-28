class DisastersController < ApplicationController
  def index
    @disasters = Disaster.all
  end

  def show
    @disaster = Disaster.find(params[:id])
  end
end
