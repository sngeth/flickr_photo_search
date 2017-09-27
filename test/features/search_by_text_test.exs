defmodule SearchByTextTest do
  use FlickrPhotoSearch.FeatureCase, async: true

  test "the page has a search box", %{session: session} do
    session
    |> visit("/")
    |> assert_has(Query.css("input#q"))
  end

  def fill_in_search(session, query) do
    session
    |> fill_in(Query.text_field("q"), with: query)
    |> click(Query.button("Search"))
  end

  test "user can search Flickr API", %{session: session} do
  end
end
