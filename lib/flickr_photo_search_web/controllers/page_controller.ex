defmodule FlickrPhotoSearchWeb.PageController do
  use FlickrPhotoSearchWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", photo_urls: []
  end

  def search(conn, params) do
    photo_urls = FlickrApi.search(params["q"])
    render conn, "index.html", photo_urls: photo_urls
  end
end
