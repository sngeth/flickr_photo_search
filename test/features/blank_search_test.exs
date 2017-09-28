defmodule SearchByTextTest do
  use FlickrPhotoSearch.FeatureCase, async: true

  test "shows flash error if search is blank", %{session: session} do
    session
    |> visit("/")
    |> fill_in(Query.css("input#q"), with: "")
    |> click(Query.button("Search"))
    |> assert_has(Query.css("p.alert-danger", text: "Search term cannot be blank"))
  end
end
