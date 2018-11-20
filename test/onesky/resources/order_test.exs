defmodule OrderTest do
  use ExUnit.Case
  doctest Onesky.Order

  test "get_order" do
    {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Order.get_order(314254, 1)

    assert env.status == 403
    assert env.body["meta"]["status"] == 403
    assert env.body["meta"]["record_count"] == nil
  end

  test "list_orders" do
    {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Order.list_orders(314254)

    assert env.status == 200
    assert env.body["meta"]["status"] == 200
    assert env.body["meta"]["record_count"] == 0
  end
end
