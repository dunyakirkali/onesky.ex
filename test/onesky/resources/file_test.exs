defmodule FileTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias Tesla.Multipart

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

  # test "upload_file" do
  #   use_cassette "file#upload" do
  #     file = Multipart.new
  #       |> Multipart.add_field("file_format", "GNU_PO")
  #       |> Multipart.add_file("#{File.cwd!}/fixture/translations/gettext_po_sample_file.po", name: "file")
  #     {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.File.upload_file(322927, file)
  #
  #     assert env.status == 201
  #
  #     assert env.body["meta"]["status"] == 201
  #
  #     assert env.body["name"] == 1
  #     assert env.body["fformat"] == 1
  #   end
  # end

  test "delete_file" do
    use_cassette "file#delete" do
      file = %{"file_name" => "gettext_po_sample_file.po"}
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.File.delete_file(322927, file)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["name"] == "gettext_po_sample_file.po"
    end
  end
end
