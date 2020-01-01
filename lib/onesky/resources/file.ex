defmodule Onesky.File do
  @moduledoc """
  [File](https://github.com/onesky/api-documentation-platform/blob/master/resources/file.md)
  """

  @doc """
  LIST uploaded files
  """
  def list_uploaded_files(client, project_id) do
    Tesla.get(client, "/projects/#{project_id}/files")
  end

  @doc """
  UPLOAD a file
  """
  def upload_file(client, project_id, file) do
    Tesla.post(client, "/projects/#{project_id}/files", file)
  end

  @doc """
  DELETE a file
  """
  def delete_file(client, project_id, params) do
    Tesla.delete(client, "/projects/#{project_id}/files", query: params)
  end
end
