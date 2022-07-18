defmodule Theater.Repo do
  use Ecto.Repo,
    otp_app: :theater,
    adapter: Ecto.Adapters.Postgres
end
