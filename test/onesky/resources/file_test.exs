defmodule FileTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias Tesla.Multipart

  doctest Onesky.File

  test "list_uploaded_files" do
    use_cassette "file#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.File.list_uploaded_files(314_254)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 1

      assert length(env.body["data"]) == 1
    end
  end

  test "delete_file" do
    use_cassette "file#delete" do
      file = %{"file_name" => "gettext_po_sample_file.po"}
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.File.delete_file(322_927, file)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["name"] == "gettext_po_sample_file.po"
    end
  end
end
