defmodule TheaterWeb.Router do
  use TheaterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TheaterWeb do
    pipe_through :browser

    # get "/", PageController, :index
    get "/about", PageController, :about
    resources "/movies", MovieController
    resources "/actors", ActorController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TheaterWeb do
  #   pipe_through :api
  # end
end
