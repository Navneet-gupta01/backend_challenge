defmodule OmiseGoWeb.OmiseGoController do
  use OmiseGoWeb, :controller

  alias OmiseGo.ParentChild
  action_fallback(OmiseGoWeb.FallbackController)

  def format(conn, %{} = a) do
    data = ParentChild.format_data(a)
    render(conn, "index.json", omise_gos: data)
  end
end
