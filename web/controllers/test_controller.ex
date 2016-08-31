defmodule TestApi.TestController do
  use TestApi.Web, :controller

  alias TestApi.Test

  plug :scrub_params, "test" when action in [:create, :update]

  def index(conn, _params) do
    #tests = Repo.all(Test)
    #render(conn, "index.json", tests: tests)
    IO.puts("Test")
    #send_resp(conn, 200, "test")
      
    meta_data = %{
        "id": "1",
        "wartenummer": "12345",
        "patient": "Anni Matör"
    }

    render(conn, "show.json", test: meta_data)
  end

  def create(conn, %{"test" => test_params}) do
    changeset = Test.changeset(%Test{}, test_params)

    case Repo.insert(changeset) do
      {:ok, test} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", "test")#test_path(conn, :show, test))
        |> render("show.json", test: test)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TestApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    test = Repo.get!(Test, id)
    render(conn, "show.json", test: test)
  end

  def update(conn, %{"id" => id, "test" => test_params}) do
    test = Repo.get!(Test, id)
    changeset = Test.changeset(test, test_params)

    case Repo.update(changeset) do
      {:ok, test} ->
        render(conn, "show.json", test: test)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TestApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    test = Repo.get!(Test, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(test)

    send_resp(conn, :no_content, "")
  end
end