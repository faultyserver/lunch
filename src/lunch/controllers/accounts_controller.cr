module AccountsController
  extend BaseController
  extend self

  def _new(env)
    error = nil
    render_view "accounts/new"
  end

  def create(env)
    account = Account.new
    account.username  = env.params.body["username"]?.as?(String)
    account.password  = env.params.body["password"]?.as?(String)

    changeset = Repo.insert(account)

    if changeset.valid?
      sign_in_user(env, changeset.instance)
      env.redirect("/")
    else
      render_view "accounts/new"
    end
  end

  def edit(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    render_view "accounts/edit"
  end

  def update(env)
    unless env.current_user?
      env.redirect("/signin")
      return
    end

    account = env.current_user
    account.username  = env.params.body["username"]?.as?(String)
    account.password  = env.params.body["password"]?.as?(String)

    changeset = Repo.update(account)

    if changeset.valid?
      sign_in_user(env, changeset.instance)
      env.redirect("/")
    else
      render_view "accounts/edit"
    end
  end
end
