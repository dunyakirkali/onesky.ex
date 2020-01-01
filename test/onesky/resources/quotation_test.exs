defmodule QuotationTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.Quotation

  test "show_quotation" do
    use_cassette "quotation#show" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Quotation.show_quotation(314_254)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["specialization"] == "general"
      assert env.body["data"]["is_including_not_approved"] == true
    end
  end
end
