defmodule ProxyProtocolMc.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    ProxyProtocolMc.start

    children = []

    opts = [strategy: :one_for_one, name: ProxyProtocolMc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
