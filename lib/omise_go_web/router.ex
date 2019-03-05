defmodule OmiseGoWeb.Router do
  use OmiseGoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug(Plug.RequestId)
  end

  scope "/api", OmiseGoWeb do
    pipe_through :api

    get("/github/:page/:per_page", GithubRepoController, :fetch_data)
    post("/format", OmiseGoController, :format)
  end
end
