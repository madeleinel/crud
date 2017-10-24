use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :crud, CrudWeb.Endpoint,
  secret_key_base: "1LhtSHQkb7wnn7X+8IGfVIFOyfuSk6I9q8klhguz2/rrSOWIJHNlxxUFZwTQtznN"

# Configure your database
config :crud, Crud.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "crud_prod",
  pool_size: 15
