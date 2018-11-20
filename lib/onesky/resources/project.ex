defmodule Onesky.Project do
  @moduledoc """
  [Project](https://github.com/onesky/api-documentation-platform/blob/master/resources/project.md)
  """

  @doc """
  LIST all projects
  """
  def list_projects(client, project_group_id) do
    Tesla.get(client, "/project-groups/#{project_group_id}/projects")
  end
end
