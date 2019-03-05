defmodule OmiseGo.GithubRepo do
  alias Tentacat.Client
  alias Tentacat.Search

  def fetch_data(attrs \\ %{}) do
    client = Client.new()

    with {200, %{"items" => items}, _response} <-
           client
           |> Search.repositories(
             %{
               q: "elixir in:name",
               sort: "stars",
               page: Map.get(attrs, "page", 100),
               per_page: Map.get(attrs, "per_page", 10)
             },
             pagination: :none
           ) do
      {:ok, items}
    else
      {_status_code, error, _resp} ->
        {:error, error}
    end
  end
end
