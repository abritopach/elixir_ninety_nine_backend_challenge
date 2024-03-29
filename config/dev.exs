use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :elixir_ninety_nine_backend_challenge, ElixirNinetyNineBackendChallenge.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :elixir_ninety_nine_backend_challenge, ElixirNinetyNineBackendChallenge.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :elixir_ninety_nine_backend_challenge, ElixirNinetyNineBackendChallenge.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixir_ninety_nine_backend_challenge_dev",
  hostname: "localhost",
  pool_size: 10


# Configure your scheduler
config :elixir_ninety_nine_backend_challenge, ElixirNinetyNineBackendChallenge.Scheduler,
jobs: [
  make_request: [
    schedule: {:extended, "*/20"}, # Runs every two seconds
    task: {ElixirNinetyNineBackendChallenge.BackgroundTask, :get_companies, []}
  ]
]