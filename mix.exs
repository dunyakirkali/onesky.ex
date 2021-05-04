defmodule Onesky.MixProject do
  use Mix.Project

  def project do
    [
      app: :onesky,
      version: "1.0.1",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, vcr: :test],
      aliases: aliases()
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
      {:excoveralls, "~> 0.13.4", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 1.5.5", only: [:dev, :test], runtime: false},
      {:tesla, "~> 1.4.0"},
      {:hackney, "~> 1.17.0"},
      {:jason, ">= 1.0.0"},
      {:exvcr, "~> 0.11", only: :test},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:doctor, "~> 0.17.0", only: :dev}
    ]
  end

  # Package Information
  defp package do
    [
      files: ["test", "lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Dunya Kirkali", "Onur Kucukkece"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ahtung/onesky.ex"}
    ]
  end

  # Package description
  defp description do
    """
    Elixir's OneSky API client
    """
  end

  defp aliases do
    [
      code_quality: ["credo --strict", "dialyzer", "doctor"]
    ]
  end
end
