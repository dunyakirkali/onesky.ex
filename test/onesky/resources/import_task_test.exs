defmodule ImportTaskTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.ImportTask

  test "list_import_tasks" do
    use_cassette "import_task#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ImportTask.list_import_tasks(322_927)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 2

      assert length(env.body["data"]) == 2
    end
  end

  test "show_import_tasks" do
    use_cassette "import_task#show" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ImportTask.show_import_task(322_927, 5_114_469)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["id"] == 5_114_469
    end
  end
end
