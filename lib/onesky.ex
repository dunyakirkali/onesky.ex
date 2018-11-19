defmodule Onesky do
  @moduledoc """
  [OneSky](http://oneskyapp.com/) API Client in Elixir.
  """

  @api_key Application.get_env(:onesky, :api_key)
  @api_secret Application.get_env(:onesky, :api_secret)

  @doc """
  LIST all orders

  ## Examples

      iex> Onesky.client() |> Onesky.get_order(314254, 1)
      :world

  """
  def get_order(client, project_id, order_id) do
    Tesla.get(client, "projects/#{project_id}/orders/#{order_id}")
  end

  @doc """
  LIST all orders

  ## Examples

      iex> Onesky.client() |> Onesky.list_orders(314254)
      :world

  """
  def list_orders(client, project_id) do
    Tesla.get(client, "projects/#{project_id}/orders")
  end

  @doc """
  LIST all locales

  ## Examples

      iex> Onesky.client() |> Onesky.list_locales()
      :world

  """
  def list_locales(client) do
    Tesla.get(client, "/locales")
  end

  @doc """
  LIST all project_groups

  ## Examples

      iex> Onesky.client() |> Onesky.list_project_groups()
      :world

  """
  def list_project_groups(client) do
    Tesla.get(client, "/project-groups")
  end

  @doc """
  LIST all projects

  ## Examples

      iex> Onesky.client() |> Onesky.list_projects(142066)
      :world

  """
  def list_projects(client, project_group_id) do
    Tesla.get(client, "/project-groups/#{project_group_id}/projects")
  end

  @doc """
  The client

  ## Examples

      iex> Onesky.client()
      :ok

  """
  def client() do
    timestamp = System.system_time(:second)
    dev_hash = Base.encode16(:erlang.md5("#{timestamp}#{@api_secret}"), case: :lower)

    params = [
      api_key: @api_key,
      timestamp: timestamp,
      dev_hash: dev_hash
    ]

    middleware = [
      { Tesla.Middleware.BaseUrl, "https://platform.api.onesky.io/1" },
      Tesla.Middleware.JSON,
      { Tesla.Middleware.Query, params }
    ]
    adapter = { Tesla.Adapter.Hackney, [] }

    Tesla.client(middleware, adapter)
  end
end
