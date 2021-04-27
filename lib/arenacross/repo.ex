defmodule Arenacross.Repo do
  use Ecto.Repo,
    otp_app: :arenacross,
    adapter: Ecto.Adapters.Postgres
end
