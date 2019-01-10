defmodule ElixirNinetyNineBackendChallenge.Router do
  use ElixirNinetyNineBackendChallenge.Web, :router

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

  scope "/", ElixirNinetyNineBackendChallenge do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/testapi/v1", ElixirNinetyNineBackendChallenge do
     pipe_through :api
     get "/companies", CompanyController, :index
  end
end
