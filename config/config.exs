# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_ninety_nine_backend_challenge,
  ecto_repos: [ElixirNinetyNineBackendChallenge.Repo]

# Configures the endpoint
config :elixir_ninety_nine_backend_challenge, ElixirNinetyNineBackendChallenge.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+u5A0/yIBXijNUq66NOLvu/JrBLlszB0BVCg52SDCc/1lWghQTlp5J/TQ+T3K7I1",
  render_errors: [view: ElixirNinetyNineBackendChallenge.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirNinetyNineBackendChallenge.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
