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

  @doc """
  SHOW project group details
  """
  def show_project_group_details(client, project_group_id) do
    Tesla.get(client, "/project-groups/#{project_group_id}")
  end

  @doc """
  DELETE a project group
  """
  def delete_project_group(client, project_group_id) do
    Tesla.delete(client, "/project-groups/#{project_group_id}")
  end

  @doc """
  Languages - list enabled languages of a project group
  """
  def languages(client, project_group_id) do
    Tesla.get(client, "/project-groups/#{project_group_id}/languages")
  end
end
