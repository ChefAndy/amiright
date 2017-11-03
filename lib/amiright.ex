defmodule Amiright do

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:https, Amiright.Router, [], [
              port: 443,
              otp_app: :amiright,
              keyfile: Application.fetch_env!(:amiright, :keyfile),
              certfile: Application.fetch_env!(:amiright, :certfile),
            ]
        )
    ]

    opts = [strategy: :one_for_one, name: Amiright.Supervisor]
    Supervisor.start_link(children, opts)
    
  end

end
