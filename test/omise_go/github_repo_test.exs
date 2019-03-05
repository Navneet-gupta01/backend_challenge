defmodule OmiseGo.GithubRepoTest do
  use OmiseGo.DataCase

  alias OmiseGo.GithubRepo

  describe "github" do
    @valid_attrs %{"page" => 10, "per_page" => 10}

    test "list_repositories/1 should list down searched repository" do
      {:ok, items} = GithubRepo.fetch_data(@valid_attrs)

      assert length(items) == 10
    end
  end
end
