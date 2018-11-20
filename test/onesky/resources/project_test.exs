defmodule ProjectTest do
  use ExUnit.Case
  doctest Onesky.Project

  test "list_projects" do
    {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.list_projects(142066)

    assert env.status == 200
    assert env.body["meta"]["status"] == 200
    assert env.body["meta"]["record_count"] == 3
  end
end
