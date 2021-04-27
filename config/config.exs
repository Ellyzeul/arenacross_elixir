# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :arenacross,
  ecto_repos: [Arenacross.Repo]

# Configures the endpoint
config :arenacross, ArenacrossWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5bIJpKTqCIH0JUp+MKzRdxOcbKVTkEV55OoMOWUA0vfFg+Lc7/xIcWvNuEmlkRZP",
  render_errors: [view: ArenacrossWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Arenacross.PubSub,
  live_view: [signing_salt: "WazGfgg4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
