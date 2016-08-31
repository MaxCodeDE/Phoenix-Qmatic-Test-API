defmodule TestApi.Router do
  use TestApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestApi do
    pipe_through :api

      resources "/test", TestController

  end

  # Other scopes may use custom stacks.
  # scope "/api", TestApi do
  #   pipe_through :api
  # end
end
