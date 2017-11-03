defmodule Amiright do

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Amiright.Router, [], [port: 4000]
        )
    ]

    opts = [strategy: :one_for_one, name: Amiright.Supervisor]
    Supervisor.start_link(children, opts)
    
  end

end
