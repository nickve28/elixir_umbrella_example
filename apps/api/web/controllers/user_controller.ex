defmodule Api.UserController do
  use Api.Web, :controller

  def index(conn, payload) do
    list_payload = %{
      limit: String.to_integer(Map.get(payload, "limit")),
      offset: String.to_integer(Map.get(payload, "offset")),
      include: Map.get(payload, "include")
    }
    render conn, "index.json", list_payload
  end
end
