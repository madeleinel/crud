# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :crud,
  ecto_repos: [Crud.Repo]

# Configures the endpoint
config :crud, CrudWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uzzqucPKt7uixtwAgE2BJg9DdkHW8FHctsqGrfcBLTDcCaXV7BFV4A5Xqro+sHw1",
  render_errors: [view: CrudWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Crud.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
