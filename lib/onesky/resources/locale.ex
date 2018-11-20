defmodule Onesky.Locale do
  @moduledoc """
  [Locale](https://github.com/onesky/api-documentation-platform/blob/master/resources/locale.md)
  """

  @doc """
  LIST all locales
  """
  def list_locales(client) do
    Tesla.get(client, "/locales")
  end
end
