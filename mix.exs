defmodule Bit64.MixProject do
  use Mix.Project

  def project do
    [
      app: :bit64,
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:benchee, "~> 0.9", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  defp description() do
    "A package to encode something. base58 and bit64"
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{
        # "GitHub" => "https://github.com/elixir-ecto/postgrex"
        },
    ]
  end
end
