defmodule Onesky.Translation do
  @moduledoc """
  [Translation](https://github.com/onesky/api-documentation-platform/blob/master/resources/translation.md)
  """

  @doc """
  EXPORT translations in files
  """
  def export_files(client, project_id, params) do
    Tesla.get(client, "/projects/#{project_id}/translations", query: params)
  end

  @doc """
  export translations in MULTILINGUAL files
  """
  def export_multilingual_files(client, project_id, params) do
    Tesla.get(client, "/projects/#{project_id}/translations/multilingual", query: params)
  end

  @doc """
  LIST uploaded files
  """
  def get_appstore_description(client, project_id, params) do
    Tesla.get(client, "/projects/#{project_id}/translations/app-descriptions", query: params)
  end

  @doc """
  LIST uploaded files
  """
  def get_translation_status(client, project_id, params) do
    Tesla.get(client, "/projects/#{project_id}/translations/status", query: params)
  end
end
