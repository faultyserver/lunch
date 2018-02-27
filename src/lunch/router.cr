macro render_view(template)
  render "src/lunch/views/{{template.id}}.slang", "src/lunch/views/_layout.slang"
end


scope "/accounts" do
  get   "/new",     &->AccountsController._new(Krout::Env)
  post  "/create",  &->AccountsController.create(Krout::Env)
  get   "/edit",    &->AccountsController.edit(Krout::Env)
  post  "/update",  &->AccountsController.update(Krout::Env)
end

scope "/locations" do
  get   "/",                      &->LocationsController.index(Krout::Env)
  get   "/show/:location_id",     &->LocationsController.show(Krout::Env)
  get   "/new",                   &->LocationsController._new(Krout::Env)
  post  "/create",                &->LocationsController.create(Krout::Env)
  get   "/edit/:location_id",     &->LocationsController.edit(Krout::Env)
  post  "/update/:location_id",   &->LocationsController.update(Krout::Env)
end


get "/", &->StaticController.index(Krout::Env)

get   "/signin",  &->SessionsController._new(Krout::Env)
post  "/signin",  &->SessionsController.create(Krout::Env)
get   "/signout", &->SessionsController.destroy(Krout::Env)
