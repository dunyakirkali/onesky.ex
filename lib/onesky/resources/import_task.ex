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

  @doc """
  SHOW import task
  """
  def show_import_task(client, project_id, import_task_id) do
    Tesla.get(client, "/projects/#{project_id}/import-tasks/#{import_task_id}")
  end
end
