Rails.application.routes.draw do
  get 'places/index'
  get 'places/show'
  get 'places/new'
  get 'places/create'
  # Define routes for Places
  get("/places", { :controller => "places", :action => "index" })   # List all places
  get("/places/new", { :controller => "places", :action => "new" }) # Show form for a new place
  post("/places", { :controller => "places", :action => "create" }) # Create a new place
  get("/places/:id", { :controller => "places", :action => "show" }) # Show a specific place

  # Define routes for Entries (Nested under Places)
  get("/places/:place_id/entries/new", { :controller => "entries", :action => "new" })  # Form to add entry
  post("/places/:place_id/entries", { :controller => "entries", :action => "create" })  # Create entry

  # Set root route to show the list of places
  root "places#index"
end
