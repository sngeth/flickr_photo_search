defmodule FlickrPhotoSearch.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias FlickrPhotoSearch.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import FlickrPhotoSearchWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(FlickrPhotoSearch.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(FlickrPhotoSearch.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(FlickrPhotoSearch.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
