defmodule OmiseGoWeb.ValidationView do
  use OmiseGoWeb, :view

  def render("error.json", %{errors: errors}) do
    %{errors: errors}
  end
end
