# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :flickr_photo_search,
  ecto_repos: [FlickrPhotoSearch.Repo]

# Configures the endpoint
config :flickr_photo_search, FlickrPhotoSearchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qNtZ+IcY99O79Sy9slKOc4ETb2bn6tQlqYyHN9cjX+Qn4gWdahEa0qBzbWC+rKNf",
  render_errors: [view: FlickrPhotoSearchWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FlickrPhotoSearch.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
