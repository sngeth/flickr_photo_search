use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :flickr_photo_search, FlickrPhotoSearchWeb.Endpoint,
  http: [port: 4001],
  server: true

config :flickr_photo_search, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :flickr_photo_search, FlickrPhotoSearch.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "flickr_photo_search_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :wallaby, screenshot_on_failure: true
