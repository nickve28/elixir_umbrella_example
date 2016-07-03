defmodule UserService.Repo do
  @users [
    %{
      id: 1,
      name: "Nick",
      age: 22
    },
    %{
      id: 2,
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
