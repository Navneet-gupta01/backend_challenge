defmodule OmiseGoWeb.OmiseGoController do
  use OmiseGoWeb, :controller

  alias OmiseGo.ParentChild
  action_fallback(OmiseGoWeb.FallbackController)

  # def github_repo(conn, %{"page" => page, "per_page" => per_page}) do
  #   render(conn, "index.json", github: %{})
  # end

  def format(conn, %{} = a) do
    IO.inspect(a)
    data = ParentChild.format_data(a)
    # IO.inspect(data)
    render(conn, "index.json", omise_gos: data)
  end
end
