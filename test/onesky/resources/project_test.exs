defmodule ProjectTest do
  use ExUnit.Case
  doctest Onesky.Project

  test "list_projects" do
    {:ok, response} = Onesky.client() |> Onesky.Project.list_projects(142066)

    assert response.status == 200
  end
end
