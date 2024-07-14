defmodule TvSimulation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TvSimulationWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:tv_simulation, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TvSimulation.PubSub},
      # Start a worker by calling: TvSimulation.Worker.start_link(arg)
      # {TvSimulation.Worker, arg},
      # Start to serve requests, typically the last entry
      TvSimulationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TvSimulation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TvSimulationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
