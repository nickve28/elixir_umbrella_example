defmodule SubscriptionService.Service do
  use GenServer

  @default_list_pagination %{
    limit: 20,
    offset: 0
  }

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def handle_call({:list, payload}, _from, state) do
    users = SubscriptionService.Repo.list payload
    { :reply, users , state }
  end
end
