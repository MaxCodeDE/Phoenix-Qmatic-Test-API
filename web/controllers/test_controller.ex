defmodule TestApi.TestController do
  use TestApi.Web, :controller

  alias TestApi.Test

  plug :scrub_params, "test" when action in [:create, :update]

  def index(conn, _params) do
    #tests = Repo.all(Test)
    #render(conn, "index.json", tests: tests)
    #IO.puts("Test")
    #send_resp(conn, 200, "test")        
      
    demoPatienten = Map.new [{:data, [%{"id": "1", "wartenummer": "92483", "patient": "Anni Matör"} ,
                %{"id": "2", "wartenummer": "12323", "patient": "Anna Nass"} ,
                %{"id": "3", "wartenummer": "6254", "patient": "Bart Stoppel"} ] }]

    render(conn, "index.json", tests: demoPatienten.data)
  end

  def create(conn, %{"test" => test_params}) do
      
    demoPatient = %{"id": "1", "wartenummer": "92483", "patient": "Anni Matör"}

    render(conn, "test.json", test: demoPatient)
  end

end
