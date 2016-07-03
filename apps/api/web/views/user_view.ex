defmodule Api.UserView do
  use Api.Web, :view

  defp get_subscription_for_user(user) do
    subscriptions = Api.Repo.Subscription.list(%{user_id: Map.get(user, :id)})
    Map.merge(user, %{subscriptions: subscriptions})
  end

  def render("index.json", payload = %{include: "subscriptions"}) do
    users = Api.Repo.User.list(%{limit: Map.get(payload, :limit), offset: Map.get(payload, :offset)})
    users
      |> Enum.map(fn user -> Task.async(fn -> get_subscription_for_user(user) end) end)
      |> Enum.map(&Task.await/1)
  end

  def render("index.json", payload) do
    Api.Repo.User.list(payload)
  end
end
