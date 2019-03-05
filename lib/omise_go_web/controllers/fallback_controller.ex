defmodule OmiseGoWeb.FallbackController do
  use OmiseGoWeb, :controller

  def call(conn, {:error, :validation_failure, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(OmiseGoWeb.ValidationView)
    |> render("error.json", errors: errors)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(OmiseGoWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, _, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(OmiseGoWeb.ValidationView)
    |> render("error.json", errors: errors)
  end

  def call(conn, {:error, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(OmiseGoWeb.ValidationView)
    |> render("error.json", errors: errors)
  end
end
