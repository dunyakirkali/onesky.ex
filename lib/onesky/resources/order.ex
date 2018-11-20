defmodule Onesky.Order do
  @moduledoc """
  [Order](https://github.com/onesky/api-documentation-platform/blob/master/resources/order.md)
  """

  @doc """
  GET an order
  """
  def get_order(client, project_id, order_id) do
    Tesla.get(client, "projects/#{project_id}/orders/#{order_id}")
  end

  @doc """
  LIST all orders
  """
  def list_orders(client, project_id) do
    Tesla.get(client, "projects/#{project_id}/orders")
  end
end
