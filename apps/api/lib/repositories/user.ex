defmodule Api.Repo.User do
  def list(payload) do
    { :ok, pid } = GenServer.start_link(UserService.Service, [])
    GenServer.call(pid, {:list, payload})
  end
end
