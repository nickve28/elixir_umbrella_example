defmodule Api.UserController do
  use Api.Web, :controller

  def index(conn, payload) do
    list_payload = %{
      limit: Map.get(payload, "limit") |> String.to_integer,
      offset: Map.get(payload, "offset") |> String.to_integer
    }
    render conn, "index.json", list_payload
  end
end
