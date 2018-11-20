defmodule Onesky.ProjectGroup do
  @moduledoc """
  [ProjectGroup](https://github.com/onesky/api-documentation-platform/blob/master/resources/project_group.md)
  """

  @doc """
  LIST all project_groups
  """
  def list_project_groups(client) do
    Tesla.get(client, "/project-groups")
  end
end
