defmodule ElixirNsq.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_nsq,
     version: "1.1.0",
     elixir: "~> 1.1",
     description: description(),
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpotion, :poison, :socket]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, "~> 3.1.0"},
      {:ibrowse, "~> 4.2"},
      {:httpotion, "~> 2.1.0"},
      {:uuid, "~> 1.1.2"},
      {:socket, "~> 0.3.1"},
      {:ex_doc, ">= 0.0.0", only: :dev},


      # testing
      {:secure_random, "~> 0.2", only: :test},

      # Small HTTP server for running tests
      {:http_server, github: "parroty/http_server", only: :test},
    ]
  end

  defp description do
    """
    A client library for NSQ, `ex_nsq` aims to be complete, easy to use,
    and well tested.

    Originally developed at Wistia (http://wistia.com) as `elixir_nsq`,
    `ex_nsq` was forked to make a version with merged PRs and updated
    dependencies available on Hex.pm for other projects to depend upon.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Mike Clarke"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/lambdafn/ex_nsq"
      },
    ]
  end
end
