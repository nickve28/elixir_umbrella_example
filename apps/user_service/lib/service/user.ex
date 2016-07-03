defmodule UserService.Service do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def handle_call({:list, payload}, _from, state) do
    users = UserService.Repo.list payload
    { :reply, users , state }
  end
end
