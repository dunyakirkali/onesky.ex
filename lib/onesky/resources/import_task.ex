defmodule Onesky.ImportTask do
  @moduledoc """
  [ImportTask](https://github.com/onesky/api-documentation-platform/blob/master/resources/import_task.md)
  """

  @doc """
  LIST all import tasks
  """
  def list_import_tasks(client, project_id) do
    Tesla.get(client, "/projects/#{project_id}/import-tasks")
  end
end
