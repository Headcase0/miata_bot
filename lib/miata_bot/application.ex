defmodule MiataBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      MiataBot.Repo,
      MiataBot.Ets,
      MiataBot.Discord,
      MiataBot.LookingForMiataWorker,
      MiataBot.Web.Endpoint
      # Starts a worker by calling: MiataBot.Worker.start_link(arg)
      # {MiataBot.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MiataBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
