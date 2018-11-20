defmodule ProjectGroupTest do
  use ExUnit.Case
  doctest Onesky.ProjectGroup

  test "list_project_groups" do
    {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ProjectGroup.list_project_groups()

    assert env.status == 200
    assert env.body["meta"]["status"] == 200
    assert env.body["meta"]["record_count"] == 5
  end

  test "languages" do
    {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ProjectGroup.languages(142066)

    assert env.status == 200
    assert env.body["meta"]["status"] == 200
    assert env.body["meta"]["record_count"] == 5
  end
end
