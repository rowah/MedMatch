defmodule Thieth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ThiethWeb.Telemetry,
      # Start the Ecto repository
      Thieth.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Thieth.PubSub},
      # Start Finch
      {Finch, name: Thieth.Finch},
      # Start the Endpoint (http/https)
      ThiethWeb.Endpoint
      # Start a worker by calling: Thieth.Worker.start_link(arg)
      # {Thieth.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Thieth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ThiethWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
