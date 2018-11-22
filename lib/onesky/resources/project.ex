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

  @doc """
  SHOW project details
  """
  def show_project_details(client, project_id) do
    Tesla.get(client, "/projects/#{project_id}")
  end

  @doc """
  CREATE a new project
  """
  def create_project(client, project_group_id, project) do
    Tesla.post(client, "/project-groups/#{project_group_id}/projects", project)
  end

  @doc """
  UPDATE a project
  """
  def update_project(client, project_id, project) do
    Tesla.put(client, "/projects/#{project_id}", project)
  end

  @doc """
  DELETE a project
  """
  def delete_project(client, project_id) do
    Tesla.delete(client, "/projects/#{project_id}")
  end

  @doc """
  Languages - list enabled languages of a project
  """
  def languages(client, project_id) do
    Tesla.get(client, "/projects/#{project_id}/languages")
  end
end
