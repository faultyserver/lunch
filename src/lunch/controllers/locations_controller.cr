module LocationsController
  extend BaseController
  extend self

  def index(env)
    locations = Repo.all(Location)

    render_view "locations/index"
  end

  def show(env)
    location = Repo.get(Location, env.params.query["location_id"])

    render_view "locations/show"
  end

  def _new(env)
    unless env.current_user?
      env.redirect("/signin?redirect=/locations/new")
      return
    end

    error = nil
    render_view "locations/new"
  end

  def create(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    location = populate_location_from_params(Location.new, env.params.body)
    changeset = Repo.insert(location)

    if changeset.valid?
      env.redirect("/locations/show/#{changeset.instance.id}")
    else
      render_view "locations/new"
    end
  end

  def edit(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    location = Repo.get!(Location, env.params.url["location_id"])

    render_view "locations/edit"
  end

  def update(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    location_id = env.params.url["location_id"]
    location = Repo.get!(Location, location_id)
    location = populate_location_from_params(location, env.params.body)
    changeset = Repo.update(location)

    if changeset.valid?
      env.redirect("/locations/edit/#{location_id}")
    else
      render_view "locations/edit"
    end
  end


  private def populate_location_from_params(location, params)
    if id = params["id"]?.as?(Int32)
      location.id = id
    end
    location.name           = params["name"]?.as(String)
    location.street_address = params["street_address"]?.as(String)
    location.dine_in        = !!params["dine_in"]?
    location.average_wait   = params["average_wait"]?.as(String).to_i
    location.website        = params["website"]?.as(String)
    location.brianable      = !!params["brianable"]?
    location.alexable       = !!params["alexable"]?
    location.price_level    = params["price_level"]?.as(String).to_i
    location.group_size     = params["group_size"]?.as(String).to_i

    location
  end
end
