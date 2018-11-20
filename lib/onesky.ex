defmodule Onesky do
  @moduledoc """
  [OneSky](http://oneskyapp.com/) API Client in Elixir.
  """

  @api_key Application.get_env(:onesky, :api_key)
  @api_secret Application.get_env(:onesky, :api_secret)

  @doc """
  The client
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
      Tesla.Middleware.JSON,
      { Tesla.Middleware.BaseUrl, "https://platform.api.onesky.io/1" },
      { Tesla.Middleware.Query, params }
    ]
    adapter = { Tesla.Adapter.Hackney, [] }

    Tesla.client(middleware, adapter)
  end
end
