defmodule ProjectTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.Project

  test "list_projects" do
    use_cassette "project#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.list_projects(142066)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 3

      assert length(env.body["data"]) == 3
    end
  end
end
