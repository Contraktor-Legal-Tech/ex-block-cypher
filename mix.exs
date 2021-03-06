defmodule ExBlockCypher.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_block_cypher,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
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
      {:poison, ">= 1.0.0"},
      {:shorter_maps, ">= 2.2.3"},
      {:httpoison, "~> 0.8"},
      {:exvcr, "~> 0.8", only: :test},
      {:credo, "~> 0.8", only: [:dev, :test]}
    ]
  end
end
