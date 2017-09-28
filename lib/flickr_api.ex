defmodule FlickrApi do
  def search(text) do
    HTTPoison.start

    text = URI.encode text

    HTTPoison.get!(request_url(text)).body
    |> Poison.decode!
    |> map_urls
  end

  def request_url(text) do
    api_url <> "?api_key=#{api_key()}&method=flickr.photos.search&text=#{text}&format=json&nojsoncallback=1"
  end

  def api_url do
    "https://api.flickr.com/services/rest/"
  end

  def api_key do
    System.get_env("FLICKR_API_KEY")
  end

  def map_urls(%{"photos" => photos}) do
    Enum.map(photos["photo"], fn(x) ->
      "https://farm#{x["farm"]}.staticflickr.com/#{x["server"]}/#{x["id"]}_#{x["secret"]}_m.jpg"
    end)
  end
end
