defmodule ScoFileWatcher do
  use Application

  def start(_type, _args) do
  import Supervisor.Spec, warn: false

  children = [
    # Send registration reminders periodically
    worker(ScoFileWatcher.Fw, [])
  ]

  # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
  # for other strategies and supported options
  opts = [strategy: :one_for_one]
  Supervisor.start_link(children, opts)
end
end
