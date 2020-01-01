defmodule Onesky.Screenshot do
  @moduledoc """
  [Screenshot](https://github.com/onesky/api-documentation-platform/blob/master/resources/screenshot.md)
  """

  @doc """
  UPLOAD screenshots
  """
  def upload_screenshots(client, project_id, screenshots) do
    Tesla.post(client, "projects/#{project_id}/screenshots", screenshots)
  end
end
