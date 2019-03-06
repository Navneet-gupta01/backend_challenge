defmodule OmiseGoWeb.OmiseGoView do
  use OmiseGoWeb, :view

  alias __MODULE__

  def render("index.json", %{omise_gos: data}) do
    IO.puts("render index.json")
    IO.inspect(data)
    render_many(data, OmiseGoView, "formated.json")
  end

  def render("show.json", %{omise_go: omise_go}) do
    IO.puts("render show.json")
    IO.inspect(omise_go)
    render_one(omise_go, OmiseGoView, "formated.json")
  end

  def render("formated.json", %{omise_go: data}) do
    %{
      id: data["id"],
      title: data["title"],
      level: data["level"],
      children: data["children"],
      parent_id: data["parent_id"]
    }
  end
end
