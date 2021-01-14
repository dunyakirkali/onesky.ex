defmodule FileTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

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

  test "upload_file" do
    use_cassette "file#upload" do
      translation_file = "fixture/files/Main.strings"

      file = [
        file: translation_file,
        file_format: "IOS_STRINGS",
        locale: "en-US",
        is_keeping_all_strings: "true",
        is_allow_translation_same_as_original: "false"
      ]

      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.File.upload_file(314_254, file)

      assert env.status == 201

      assert env.body["meta"]["status"] == 201

      assert env.body["data"]["name"] == "string.po"
      assert env.body["data"]["format"] == "GNU_PO"
    end
  end

  test "delete_file" do
    use_cassette "file#delete" do
      file = [file_name: "gettext_po_sample_file.po"]
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.File.delete_file(322_927, file)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["name"] == "gettext_po_sample_file.po"
    end
  end
end
