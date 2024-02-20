defmodule Wfloat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WfloatWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:wfloat, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Wfloat.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Wfloat.Finch},
      # Start a worker by calling: Wfloat.Worker.start_link(arg)
      # {Wfloat.Worker, arg},
      # Start to serve requests, typically the last entry
      WfloatWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wfloat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WfloatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
