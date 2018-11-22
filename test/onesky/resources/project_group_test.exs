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

  test "show_project_group_details" do
    use_cassette "project_group#show" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ProjectGroup.show_project_group_details(142066)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["id"] == "142066"
      assert env.body["data"]["name"] == "Grip"
      assert env.body["data"]["enabled_language_count"] == 5
      assert env.body["data"]["project_count"] == "3"
    end
  end

  test "delete_project_group" do
    use_cassette "project_group#delete" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ProjectGroup.delete_project_group(145685)

      assert env.status == 200
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
