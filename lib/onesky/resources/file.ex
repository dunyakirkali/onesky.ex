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
end
