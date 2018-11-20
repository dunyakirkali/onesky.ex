defmodule OrderTest do
  use ExUnit.Case
  doctest Onesky.Order

  test "get_order" do
    {:ok, response} = Onesky.client() |> Onesky.Order.get_order(314254, 1)

    assert response.status == 403
  end

  test "list_orders" do
    {:ok, response} = Onesky.client() |> Onesky.Order.list_orders(314254)

    assert response.status == 200
  end
end
