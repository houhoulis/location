defmodule Location.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LocationWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:location, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Location.PubSub},
      # Start a worker by calling: Location.Worker.start_link(arg)
      # {Location.Worker, arg},
      # Start to serve requests, typically the last entry
      LocationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Location.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LocationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
