Rails.application.routes.draw do
  get 'entries/new'
  get 'entries/create'
  get 'entries/edit'
  get 'entries/update'
  get 'entries/destroy'
  # Routes for Places
  get("/places", { :controller => "places", :action => "index" })
  get("/places/new", { :controller => "places", :action => "new" })
  post("/places", { :controller => "places", :action => "create" })
  get("/places/:id", { :controller => "places", :action => "show" })

  # Routes for Entries (Nested under Places)
  get("/places/:place_id/entries/new", { :controller => "entries", :action => "new" })
  post("/places/:place_id/entries", { :controller => "entries", :action => "create" })
  get("/places/:place_id/entries/:id/edit", { :controller => "entries", :action => "edit" })
  patch("/places/:place_id/entries/:id", { :controller => "entries", :action => "update" })
  delete("/places/:place_id/entries/:id", { :controller => "entries", :action => "destroy" })
end
