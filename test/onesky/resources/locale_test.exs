defmodule LocaleTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.Locale

  test "list_locales" do
    use_cassette "locale#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Locale.list_locales()

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 487

      assert length(env.body["data"]) == 487
    end
  end
end
