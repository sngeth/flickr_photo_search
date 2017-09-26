defmodule SearchByTextTest do
  use FlickrPhotoSearch.FeatureCase, async: true

  test "the page has a title", %{session: session} do
    header = session
    |> visit("/")
    |> find(Query.css("h2"))
    |> Element.text

    assert header =~ ~r/Welcome to Flickr Photo Search/i
  end
end
