defmodule OmiseGoWeb.Router do
  use OmiseGoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug(Plug.RequestId)
  end

  scope "/", OmiseGoWeb do
    pipe_through :browser

    get("/github/:page", GithubRepoController, :show_html)
  end

  scope "/api", OmiseGoWeb do
    pipe_through :api

    get("/github/:page", GithubRepoController, :fetch_data)
    post("/format", OmiseGoController, :format)
  end
end
