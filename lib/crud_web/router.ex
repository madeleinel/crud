defmodule CrudWeb.Router do
  use CrudWeb, :router

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

  scope "/", CrudWeb do
    pipe_through :browser # Use the default browser stack

    get "/", QuoteController, :homepage
    resources "/quotes", QuoteController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrudWeb do
  #   pipe_through :api
  # end
end
