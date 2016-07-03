defmodule Api.UserView do
  use Api.Web, :view

  def render("index.json", payload) do
    Api.Repo.User.list(payload)
  end
end
