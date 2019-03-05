defmodule OmiseGo.Repo do
  use Ecto.Repo,
    otp_app: :omise_go,
    adapter: Ecto.Adapters.Postgres
end
