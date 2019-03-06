defmodule OmiseGoWeb.GithubRepoController do
  use OmiseGoWeb, :controller

  alias OmiseGo.GithubRepo
  alias OmiseGo.GithubResp

  action_fallback(OmiseGoWeb.FallbackController)

  def fetch_data(conn, %{"page" => _page} = params) do
    with {:ok, %{"items" => items}} <- GithubRepo.fetch_data(params) do
      conn |> render("index.json", github_repos: items)
    end
  end

  def show_html(conn, %{"page" => page} = params) do
    with {:ok, data} <- GithubRepo.fetch_data(params) do
      github_resp =
        GithubResp.new(%{
          repos: data["items"],
          totalItems: data["total_count"],
          page: String.to_integer(page),
          per_page: 10
        })

      conn
      |> put_view(OmiseGoWeb.PageView)
      |> render("index.html", data: github_resp)
    end
  end

end
