defmodule ProxyProtocolMc.Mixfile do
  use Mix.Project

  def project do
    [app: :proxy_protocol_mc,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger],
     mod: {ProxyProtocolMc.Application, []}]
  end

  defp deps do
    [
      {:smppex, "~> 2.0"},
      {:ranch_proxy_protocol, github: "heroku/ranch_proxy_protocol"},
      {:ranch, "~> 1.3", override: true}
    ]
  end
end
