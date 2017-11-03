defmodule Amiright.Router do
	@moduledoc """
	This is the route file. It's where the bulk of the work is done for this simple app.
	Here are the available post parameters from slack.
	#token=abceasyas123
	#team_id=T0001
	#team_domain=example
	#channel_id=C2147483705
	#channel_name=test
	#user_id=U2147483697
	#user_name=Steve
	#command=/weather
	#text=94070
	#response_url=https://hooks.slack.com/commands/1234/5678

	"""
	use Plug.Router

	plug Plug.Parsers, parsers: [:urlencoded]
	plug Amiright.TokenCheckPlug,
	plug :match
	plug :dispatch

	get "/" do
		send_resp(conn, 200, "")
	end
	
	post "/amiright" do 
		%{"user_name" => user_name} = conn.params
		response_json = Poison.encode!(%{"response_type" => "in_channel", "text"=> "You are SO right " <> user_name <> "!"})

		conn
		|> put_resp_content_type("application/json")
		|> send_resp(200, response_json)
	end

	post "/ordered" do
		send_resp(conn, 200, "It is SO ordered.")
	end

	match _ do
		send_resp(conn, 404, "not found")
	end	
end


