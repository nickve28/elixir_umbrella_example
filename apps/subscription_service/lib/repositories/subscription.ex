defmodule SubscriptionService.Repo do
  @subcriptions [
    %{
      id: 1,
      user_id: 1,
      name: "Test subscription 1"
    },
    %{
      id: 2,
      user_id: 1,
      name: "Test subscription 2"
    },
    %{
      id: 3,
      user_id: 2,
      name: "Test subscription 3"
    }
  ]

  def list(%{user_id: user_id}) do
    @subcriptions
      |> Enum.filter(&(Map.get(&1, :user_id) == user_id))
  end
end
