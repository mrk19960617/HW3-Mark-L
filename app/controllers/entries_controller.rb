class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)

    if @entry.save
      redirect_to "/places/#{@place.id}"
    else
      render "new"
    end
  end

  def edit
    @place = Place.find(params[:place_id])
    @entry = @place.entries.find(params[:id])
  end

  def update
    @place = Place.find(params[:place_id])
    @entry = @place.entries.find(params[:id])

    if @entry.update(entry_params)
      redirect_to "/places/#{@place.id}"
    else
      render "edit"
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @entry = @place.entries.find(params[:id])
    @entry.destroy

    redirect_to "/places/#{@place.id}"
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :date)
  end
end
