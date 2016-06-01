defmodule ScoFileWatcher.Fw do
  use GenServer
  require Logger

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(state) do
    :fs.start_link(:my_watcher, Path.absname("."))
    :fs.subscribe(:my_watcher)
    receive do
      {_watcher_process, {:fs, :file_event}, {changedFile, type}} ->
      IO.puts("#{changedFile} was updated: #{inspect type}")
    end
    {:ok, state}
  end

  def handle_info(atm, state) do
    receive do
      {_watcher_process, {:fs, :file_event}, {changedFile, _type}} ->
      IO.puts("#{changedFile} was updated")
      IO.puts("FileWatcher Stuff #{inspect atm} --- #{inspect state}")
    end
    {:noreply, state}
  end
end
