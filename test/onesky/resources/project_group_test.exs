defmodule ProjectGroupTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.ProjectGroup

  test "list_project_groups" do
    use_cassette "project_group#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ProjectGroup.list_project_groups()

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 5

      assert length(env.body["data"]) == 5
    end
  end

  test "languages" do
    use_cassette "project_group#languages" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ProjectGroup.languages(142066)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 5

      assert length(env.body["data"]) == 5
    end
  end
end
