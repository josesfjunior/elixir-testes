defmodule Testes.Repo do
  use Ecto.Repo,
    otp_app: :testes,
    adapter: Ecto.Adapters.Postgres
end
