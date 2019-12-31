defmodule Onesky.Quotation do
  @moduledoc """
  [Quotation](https://github.com/onesky/api-documentation-platform/blob/master/resources/quotation.md)
  """

  @doc """
  SHOW a quotation
  """
  def show_quotation(client, project_id) do
    Tesla.get(client, "projects/#{project_id}/quotations")
  end
end
