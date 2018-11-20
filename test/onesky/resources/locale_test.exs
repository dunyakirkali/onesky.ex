defmodule LocaleTest do
  use ExUnit.Case
  doctest Onesky.Locale

  test "list_locales" do
    {:ok, response} = Onesky.client() |> Onesky.Locale.list_locales()

    assert response.status == 200
  end
end
