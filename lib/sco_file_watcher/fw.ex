defmodule ScoFileWatcher.Fw do
  use GenServer
  require Logger

  @initial_wait 1000
  @period 1000 * 1

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(state) do
    Process.send_after(self(), :work, @initial_wait)
    {:ok, state}
  end

  def handle_info(:work, state) do
    IO.puts("FileWatcher Stuff")
    #deactivate_old_registrations(Timex.Date.now())
    Process.send_after(self(), :work, @period)
    {:noreply, state}
  end


end
