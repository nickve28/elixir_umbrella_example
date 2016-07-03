defmodule Api.Repo.Subscription do
  def list(payload) do
    { :ok, pid } = GenServer.start_link(SubscriptionService.Service, [])
    GenServer.call(pid, {:list, payload})
  end
end
