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

  test "show_project_details" do
    use_cassette "project#show" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.show_project_details(314254)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["id"] == 314254
      assert env.body["data"]["name"] == "iPhone/iPad App"
      assert env.body["data"]["description"] == ""
      assert env.body["data"]["string_count"] == 534
      assert env.body["data"]["word_count"] == 2478
    end
  end
end
