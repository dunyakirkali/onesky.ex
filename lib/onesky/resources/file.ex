defmodule Onesky.File do
  @moduledoc """
  [File](https://github.com/onesky/api-documentation-platform/blob/master/resources/file.md)
  """

  alias Tesla.Multipart

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
    {filepath, fields} = Keyword.pop(file, :file)

    mp =
      fields
      |> Enum.reduce(Multipart.new(), fn {key, val}, mp -> Multipart.add_field(mp, key, val) end)
      |> Multipart.add_file(filepath)

    Tesla.post(client, "/projects/#{project_id}/files", mp)
  end

  @doc """
  DELETE a file
  """
  def delete_file(client, project_id, params) do
    Tesla.delete(client, "/projects/#{project_id}/files", query: params)
  end
end
