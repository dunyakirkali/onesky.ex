defmodule Onesky do
  @moduledoc """
  [OneSky](http://oneskyapp.com/) API Client in Elixir.
  """

  @doc """
  The client
  """
  def client() do
    timestamp = System.system_time(:second)
    dev_hash = Base.encode16(:erlang.md5("#{timestamp}#{api_secret()}"), case: :lower)

    params = [
      api_key: api_key(),
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

  defp api_key() do
    Application.get_env(:onesky, :api_key)
  end

  defp api_secret() do
    Application.get_env(:onesky, :api_secret)
  end
end
