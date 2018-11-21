defmodule Onesky.MixProject do
  use Mix.Project

  def project do
    [
      app: :onesky,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [vcr: :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.2.1"},
      {:hackney, "~> 1.14.0"},
      {:jason, ">= 1.0.0"},
      {:exvcr, "~> 0.10", only: :test}
    ]
  end
end
