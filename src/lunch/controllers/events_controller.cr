module EventsController
  extend BaseController
  extend self

  def index(env)
    events = Repo.all(Outing)

    render_view "events/index"
  end

  def show(env)
    event = Repo.get(Outing, env.params.url["event_id"])

    render_view "events/show"
  end

  def _new(env)
    unless env.current_user?
      env.redirect("/signin?redirect=/events/new")
      return
    end

    error = nil
    locations = Repo.all(Location)
    render_view "events/new"
  end

  def create(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    event = populate_event_from_params(Outing.new, env.params.body)
    event.owner = env.current_user
    changeset = Repo.insert(event)

    if changeset.valid?
      env.redirect("/events/show/#{changeset.instance.id}")
    else
      locations = Repo.all(Location)
      render_view "events/new"
    end
  end

  def edit(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    event = Repo.get!(Outing, env.params.url["event_id"])

    render_view "events/edit"
  end

  def update(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    event_id = env.params.url["event_id"]
    event = Repo.get!(Outing, event_id)
    event = populate_event_from_params(event, env.params.body)
    changeset = Repo.update(event)

    if changeset.valid?
      env.redirect("/events/edit/#{event_id}")
    else
      render_view "events/edit"
    end
  end


  private def populate_event_from_params(event, params)
    if id = params["id"]?.as?(Int32)
      event.id = id
    end

    event.location_id = params["location_id"].as?(Int32)

    event
  end
end
