Rails.application.routes.draw do
  # Routes for Places
  get("/places", { :controller => "places", :action => "index" })
  get("/places/new", { :controller => "places", :action => "new" })
  post("/places", { :controller => "places", :action => "create" })
  get("/places/:id", { :controller => "places", :action => "show" })
  get("/places/:id/edit", { :controller => "places", :action => "edit" })
  patch("/places/:id", { :controller => "places", :action => "update" })
  delete("/places/:id", { :controller => "places", :action => "destroy" })

  # Routes for Entries (Nested under Places)
  get("/places/:place_id/entries/new", { :controller => "entries", :action => "new" })
  post("/places/:place_id/entries", { :controller => "entries", :action => "create" })
  get("/places/:place_id/entries/:id/edit", { :controller => "entries", :action => "edit" })
  patch("/places/:place_id/entries/:id", { :controller => "entries", :action => "update" })
  delete("/places/:place_id/entries/:id", { :controller => "entries", :action => "destroy" })
  
  # Set the root route to display all places
  root "places#index"
end
