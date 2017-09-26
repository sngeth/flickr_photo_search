defmodule FlickrPhotoSearchWeb.PageController do
  use FlickrPhotoSearchWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
