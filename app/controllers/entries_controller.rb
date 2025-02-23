class EntriesController < ApplicationController
  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new
  end

  def create
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["date"] = params["date"]
    @entry["place_id"] = @place["id"]
    @entry.save

    redirect_to("/places/#{@place["id"]}")
  end

  def edit
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = @place.entries.find(params["id"])
  end

  def update
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = @place.entries.find(params["id"])
    @entry.update(title: params["title"], description: params["description"], date: params["date"])

    redirect_to("/places/#{@place["id"]}")
  end

  def destroy
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = @place.entries.find(params["id"])
    @entry.destroy

    redirect_to("/places/#{@place["id"]}")
  end
end
