defmodule Crossarena.Repo do
  use Ecto.Repo,
    otp_app: :crossarena,
    adapter: Ecto.Adapters.Postgres
end
