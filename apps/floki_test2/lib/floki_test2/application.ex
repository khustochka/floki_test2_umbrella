defmodule FlokiTest2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DNSCluster, query: Application.get_env(:floki_test2, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FlokiTest2.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FlokiTest2.Finch}
      # Start a worker by calling: FlokiTest2.Worker.start_link(arg)
      # {FlokiTest2.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: FlokiTest2.Supervisor)
  end
end
