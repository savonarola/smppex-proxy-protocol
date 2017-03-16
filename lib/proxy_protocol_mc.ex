defmodule ProxyProtocolMc do
  use SMPPEX.MC

  require Logger

  def start do
    config = Application.get_env(:proxy_protocol_mc, __MODULE__)
    port = config[:port]
    max_connections = config[:max_connections]
    {:ok, _ref} = SMPPEX.MC.start(
      {__MODULE__, []},
      [ transport_opts: [
          port: port,
          max_connections: max_connections
        ],
        transport: :ranch_proxy
      ]
    )
  end

  def init(socket, transport, []) do
    Logger.info("Proxy info: #{inspect transport.proxyname(socket)}")
    {:ok, %{}}
  end

end
