defmodule TestApi.TestController do
  use TestApi.Web, :controller

  alias TestApi.Test

  plug :scrub_params, "test" when action in [:create, :update]

  def index(conn, _params) do
    #tests = Repo.all(Test)
    #render(conn, "index.json", tests: tests)
    #IO.puts("Test")
    #send_resp(conn, 200, "test")        
      
    demaPatienten = Map.new [{:data, [%{"id": "1", "wartenummer": "92483", "patient": "Anni Matör"} ,
                %{"id": "2", "wartenummer": "12323", "patient": "Anna Nass"} ,
                %{"id": "3", "wartenummer": "6254", "patient": "Bart Stoppel"} ] }]

    render(conn, "index.json", tests: demaPatienten.data)
  end

  def create(conn, %{"test" => test_params}) do
    #changeset = Test.changeset(%Test{}, test_params)

    IO.puts("TEST " <> test_params)
      
    demaPatienten = Map.new [{:data, [%{"id": "1", "wartenummer": "92483", "patient": "Anni Matör"} ,
                %{"id": "2", "wartenummer": "12323", "patient": "Anna Nass"} ,
                %{"id": "3", "wartenummer": "6254", "patient": "Bart Stoppel"} ] }]

    render(conn, "index.json", tests: demaPatienten.data)
  end

end
