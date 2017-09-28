defmodule FlickrApiTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "fetches photos and maps to src url" do
    ExVCR.Config.filter_url_params(true)

    use_cassette "flickr_api/get_photos" do
      urls = FlickrApi.search("lolcat")

      assert length(urls) == 100
      assert hd(urls) =~
        ~r/https:\/\/farm\d+.staticflickr.com\/\d+\/\d+_[a-zA-Z\d]+_m.jpg/
    end
  end

  test "searches with spaces work successfully" do
    ExVCR.Config.filter_url_params(true)

    use_cassette "flickr_api/get_photos#2" do
      urls = FlickrApi.search("lol cat")

      assert length(urls) == 100
      assert hd(urls) =~
        ~r/https:\/\/farm\d+.staticflickr.com\/\d+\/\d+_[a-zA-Z\d]+_m.jpg/
    end
  end
end
