defmodule <%= application_module %>.Endpoint do
  use Phoenix.Endpoint, otp_app: :<%= application_name %>

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :<%= application_name %>,
    only: ~w(css images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_<%= application_name %>_key",
    signing_salt: "<%= signing_salt %>",
    encryption_salt: "<%= encryption_salt %>"

  plug :router, <%= application_module %>.Router
end
