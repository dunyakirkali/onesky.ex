defmodule ProjectTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.Project

  test "list_projects" do
    use_cassette "project#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.list_projects(142_066)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 3

      assert length(env.body["data"]) == 3
    end
  end

  test "show_project_details" do
    use_cassette "project#show" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.show_project_details(314_254)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["id"] == 314_254
      assert env.body["data"]["name"] == "iPhone/iPad App"
      assert env.body["data"]["description"] == ""
      assert env.body["data"]["string_count"] == 534
      assert env.body["data"]["word_count"] == 2478
    end
  end

  test "create_project" do
    use_cassette "project#create" do
      project = %{"project_type" => "website", "name" => "Ahtung", "description" => "The best company"}
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.create_project(142_066, project)

      assert env.status == 201

      assert env.body["meta"]["status"] == 201

      assert env.body["data"]["id"] == 322_910
      assert env.body["data"]["name"] == "Ahtung"
      assert env.body["data"]["description"] == "The best company"
    end
  end

  test "update_project" do
    use_cassette "project#update" do
      project = %{"name" => "Bhtung", "description" => "The worst company"}
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.update_project(322_910, project)

      assert env.status == 200
    end
  end

  test "delete_project" do
    use_cassette "project#delete" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.delete_project(322_910)

      assert env.status == 200
    end
  end

  test "languages" do
    use_cassette "project#languages" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Project.languages(322_927)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 3

      assert length(env.body["data"]) == 3
    end
  end
end
