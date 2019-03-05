defmodule OmiseGoWeb.GithubRepoView do
  use OmiseGoWeb, :view

  alias OmiseGoWeb.GithubRepoView

  def render("index.json", %{github_repos: data}) do
    IO.puts("render index.json")
    IO.inspect(data)
    render_many(data, GithubRepoView, "github.json")
  end

  def render("show.json", %{github_repo: github_repo}) do
    IO.puts("render show.json")
    IO.inspect(github_repo)
    render_one(github_repo, GithubRepoView, "github.json")
  end

  def render("github.json", %{github_repo: github_repo}) do
    %{
      id: github_repo["id"],
      name: github_repo["name"],
      stargazers_count: github_repo["stargazers_count"],
      score: github_repo["score"],
      created_at: github_repo["created_at"]
    }
  end
end
