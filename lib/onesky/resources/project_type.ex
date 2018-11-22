defmodule Onesky.ProjectType do
  @moduledoc """
  [ProjectType](https://github.com/onesky/api-documentation-platform/blob/master/resources/project_type.md)
  """

  @doc """
  LIST all project types
  """
  def list_project_types(client) do
    Tesla.get(client, "/project-types")
  end
end
