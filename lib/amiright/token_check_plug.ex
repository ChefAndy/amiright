defmodule Amiright.TokenCheckPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
  	%{"token" => token} = conn.params	
    if token == Application.fetch_env!(:amiright, :token) do
      conn
    else
      conn
      |> send_resp(401, "")
      |> halt
    end
  end
end