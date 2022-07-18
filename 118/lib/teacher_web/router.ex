defmodule TeacherWeb.Router do
  use TeacherWeb, :router

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

  scope "/", TeacherWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/posts", PostController do
      resources "/comments", CommentController, only: [:create]
    end

    resources "/registrations", UserController, only: [:new, :create]
    resources "/password_reset", PasswordResetController, except: [:index, :show]

    get "/sign_in", SessionController, :new
    post "/sign_in", SessionController, :create
    delete "/sign_out", SessionController, :delete
  end

  if Mix.env() == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end

  # Other scopes may use custom stacks.
  # scope "/api", TeacherWeb do
  #   pipe_through :api
  # end
end
