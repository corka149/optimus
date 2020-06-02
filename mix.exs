defmodule Optimus.Mixfile do
  use Mix.Project

  def project do
    [
      app: :optimus,
      version: "0.1.11",
      elixir: "~> 1.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      dialyzer: [
        plt_add_deps: true,
        plt_add_apps: [:ssl],
        flags: ["-Werror_handling", "-Wrace_conditions"]
      ],
      package: package()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:dialyxir, ">= 1.0.0-rc.7", only: :dev},
      {:excoveralls, ">= 0.0.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:yamerl, "~> 0.6"}
    ]
  end

  defp package do
    [
      name: :optimus,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Ilya Averyanov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/funbox/optimus"},
      description: "Command line option parser inspired by clap.rs"
    ]
  end
end
