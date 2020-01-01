defmodule OrderTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.Order

  test "get_order" do
    use_cassette "order#get" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Order.get_order(314_254, 1)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200

      assert env.body["data"]["amount"] == "695.00"
    end
  end

  test "list_orders" do
    use_cassette "order#list" do
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Order.list_orders(314_254)

      assert env.status == 200

      assert env.body["meta"]["status"] == 200
      assert env.body["meta"]["record_count"] == 1

      assert length(env.body["data"]) == 1
    end
  end

  test "create_order" do
    use_cassette "order#create" do
      order = %{files: ["string.po"], to_locale: "zh-TW", }
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Order.create_order(314_254, order)

      assert env.status == 201

      assert env.body["meta"]["status"] == 201

      assert env.body["data"]["id"] == 372
      assert env.body["data"]["order_type"] == "translate-only"
      assert env.body["data"]["note"] == "Message to translator"
    end
  end
end
