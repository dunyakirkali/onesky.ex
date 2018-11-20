defmodule ProjectGroupTest do
  use ExUnit.Case
  doctest Onesky.ProjectGroup

  test "list_project_groups" do
    {:ok, response} = Onesky.client() |> Onesky.ProjectGroup.list_project_groups()

    assert response.status == 200
  end
end
