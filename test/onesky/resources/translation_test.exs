defmodule TranslationTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.Translation

  test "export_files" do
    use_cassette "translation#export_files" do
      params = [locale: "zh-TW", source_file_name: "string.po"]

      {:ok, %Tesla.Env{} = env} =
        Onesky.client() |> Onesky.Translation.export_files(322_974, params)

      assert env.status == 200
    end
  end

  test "export_multilingual_files" do
    use_cassette "translation#export_multilingual_files" do
      params = [source_file_name: "app.json"]

      {:ok, %Tesla.Env{} = env} =
        Onesky.client() |> Onesky.Translation.export_multilingual_files(322_974, params)

      assert env.status == 200
    end
  end

  test "get_appstore_description" do
    use_cassette "translation#app_store" do
      locale = [locale: "en"]

      {:ok, %Tesla.Env{} = env} =
        Onesky.client() |> Onesky.Translation.get_appstore_description(322_974, locale)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["APP_NAME"] == "ABN AMRO Grip"
      assert env.body["data"]["TITLE"] == nil
      assert env.body["data"]["DESCRIPTION"] == nil
    end
  end

  test "get_translation_status" do
    use_cassette "translation#status" do
      file = [file_name: "Localizable.strings", locale: "nl-NL"]

      {:ok, %Tesla.Env{} = env} =
        Onesky.client() |> Onesky.Translation.get_translation_status(314_254, file)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["file_name"] == "Localizable.strings"
      assert env.body["data"]["progress"] == "100.0%"
      assert env.body["data"]["string_count"] == 534
      assert env.body["data"]["word_count"] == 2478
    end
  end
end
