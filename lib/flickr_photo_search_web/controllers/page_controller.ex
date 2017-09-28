defmodule FlickrPhotoSearchWeb.PageController do
  use FlickrPhotoSearchWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", photo_urls: []
  end

  def search(conn, params) do
    if params["q"] == "" do
      conn
      |> put_flash(:error, "Search term cannot be blank")
      |> render "index.html", photo_urls: []
    else
      photo_urls = FlickrApi.search(params["q"])
      render conn, "index.html", photo_urls: photo_urls
    end
  end
end
