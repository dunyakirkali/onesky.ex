defmodule ProjectTypeTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.ProjectType

  test "list_project_types" do
    use_cassette "project_type#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ProjectType.list_project_types()

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 15

      assert length(env.body["data"]) == 15
    end
  end
end
