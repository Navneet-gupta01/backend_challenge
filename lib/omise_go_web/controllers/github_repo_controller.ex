defmodule OmiseGoWeb.GithubRepoController do
  use OmiseGoWeb, :controller

  alias OmiseGo.GithubRepo
  action_fallback(OmiseGoWeb.FallbackController)

  def fetch_data(conn, %{"page" => _page, "per_page" => _per_page} = params) do
    with {:ok, data} <- GithubRepo.fetch_data(params) do
      conn |> render("index.json", github_repos: data)
    end
  end

  def show_html(conn, %{"page" => _page, "per_page" => _per_page} = params) do
    with {:ok, data} <- GithubRepo.fetch_data(params) do
      conn
      |> put_view(OmiseGoWeb.PageView)
      |> render("index.html", data: data)
    end
  end
end
