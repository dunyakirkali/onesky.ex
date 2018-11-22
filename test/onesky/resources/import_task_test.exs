defmodule ImportTaskTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.ImportTask

  test "list_import_tasks" do
    use_cassette "import_task#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.ImportTask.list_import_tasks(322927)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 2

      assert length(env.body["data"]) == 2
    end
  end
end
