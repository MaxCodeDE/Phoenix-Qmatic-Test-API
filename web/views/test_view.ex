defmodule TestApi.TestView do
  use TestApi.Web, :view

  def render("index.json", %{tests: tests}) do
    render_many(tests, TestApi.TestView, "test.json")
  end

  def render("show.json", %{test: test}) do
    %{data: render_one(test, TestApi.TestView, "test.json")}
  end

  def render("test.json", %{test: test}) do
    %{id: test.id,
      patient: test.patient,
      wartenummer: test.wartenummer}
  end
end
