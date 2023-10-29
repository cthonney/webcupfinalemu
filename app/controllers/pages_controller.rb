class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :resources, :about ]

  def home
  end

  def resources
  end

  def continent
  end
end
