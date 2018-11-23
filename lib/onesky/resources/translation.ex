defmodule Onesky.Translation do
  @moduledoc """
  [Translation](https://github.com/onesky/api-documentation-platform/blob/master/resources/translation.md)
  """

  @doc """
  LIST uploaded files
  """
  def get_translation_status(client, project_id, file) do
    Tesla.get(client, "/projects/#{project_id}/translations/status?file_name=#{file["file_name"]}&locale=#{file["locale"]}")
  end
end
