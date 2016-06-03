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
        # diff = Git.diff changedFile, "HEAD"


        # IO.inspect(diff)
        t = "file modificaton"
        p = "put event payload here"
        e = Poison.encode!(%{type: "filechange"})
      # HTTPoison.post("localhost:4000/api/events", ["event[type]=#{t}\nevent[payload]=#{p}"], ["Content-Type": "application/x-www-form-urlencoded"])
        HTTPoison.post("localhost:4000/api/events", "{\"event\": {\"type\":\"#{t}\", \"p\": \"#{p}\"}}", ["Content-Type": "application/json"])

    end
    {:ok, state}
  end

  def handle_info(atm, state) do
    receive do
      {_watcher_process, {:fs, :file_event}, {changedFile, _type}} ->
        t = "file modificaton"
        p = "some payload"
        HTTPoison.post("localhost:4000/api/events", "{\"event\": {\"type\":\"#{t}\", \"p\": \"#{p}\"}}", ["Content-Type": "application/json"])
        IO.puts("#{changedFile} was updated")
        IO.puts("FileWatcher Stuff #{inspect atm} --- #{inspect state}")
    end
    {:noreply, state}
  end
end
