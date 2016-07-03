defmodule UserService.Repo do
  @users [
    %{
      name: "Nick",
      age: 22
    },
    %{
      name: "foo",
      age: 1
    }
  ]

  def list(%{limit: limit, offset: offset}) do
    @users
      |> Enum.drop(offset)
      |> Enum.take(limit)
  end
end
