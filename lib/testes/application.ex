defmodule Testes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestesWeb.Telemetry,
      # Start the Ecto repository
      Testes.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Testes.PubSub},
      # Start Finch
      {Finch, name: Testes.Finch},
      # Start the Endpoint (http/https)
      TestesWeb.Endpoint
      # Start a worker by calling: Testes.Worker.start_link(arg)
      # {Testes.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
