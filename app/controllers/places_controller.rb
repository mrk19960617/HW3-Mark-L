class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = @place.entries
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]  # Assign form input to Place name
    if @place.save
      redirect_to("/places")  # Redirect to the list of places after saving
    else
      render "new"  # Stay on form if there's an error
    end
  end
end
