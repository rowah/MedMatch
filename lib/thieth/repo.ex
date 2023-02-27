defmodule Thieth.Repo do
  use Ecto.Repo,
    otp_app: :thieth,
    adapter: Ecto.Adapters.Postgres
end
