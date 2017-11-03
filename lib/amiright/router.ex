defmodule Amiright.Router do
	use Plug.Router

	plug Plug.Parsers, parsers: [:urlencoded]
	plug :match
	plug :dispatch

	get "/" do
		send_resp(conn, 200, "")
	end
	
	post "/" do
		%{"text" => text} = conn.params
		send_resp(conn, 200, text)
	end

	post "/ordered" do
		send_resp(conn, 200, "It is SO ordered.")
	end

	match _ do
		send_resp(conn, 404, "not found")
	end	
end