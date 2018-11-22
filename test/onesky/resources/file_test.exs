defmodule FileTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.File

  test "list_uploaded_files" do
    use_cassette "file#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.File.list_uploaded_files(314254)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 1

      assert length(env.body["data"]) == 1
    end
  end
end
