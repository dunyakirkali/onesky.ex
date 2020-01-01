defmodule ScreenshotTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Onesky.Screenshot

  test "upload_screenshots" do
    use_cassette "screenshots#upload" do
      image = "fixture/screenshots/screenshot.png" |> File.read! |> Base.encode64()
      screenshots = [
        %{
          "name" => "screenshot.png",
          "image" => image,
          "tags" => [
            %{
              "key" => "common.nav.product.smartphone",
              "x" => 460,
              "y" => 30,
              "width" => 150,
              "height" => 50,
              "file" => "string.po"
            }
          ]
        }
      ]
      {:ok, %Tesla.Env{} = env} = Onesky.client() |> Onesky.Screenshot.upload_screenshots(314254, screenshots)

      assert env.status == 201
    end
  end
end
