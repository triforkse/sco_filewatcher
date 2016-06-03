# ScoFilewatcher

## Vision

The ScoFilewatcher should watch a directory including all sub directories (configurable)
and report file changes to the sco server for further processing...


## Development
Checkout the server first https://github.com/triforkse/sco
Initialize the server env (`mix deps.get`, `mix ecto.migrate`, ...)
Run the server with `iex -S mix phoenix.server`

Run the FileWatcher with mix run and modify some files in the same directory as
the sco_filewatcher project. When a file change was detected it sends some
json (event) to the server.

### TODO
Use git.diff <modified_file> to detected what has changed and send a kind of
normalized data to the server as an event payload...


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add sco_filewatcher to your list of dependencies in `mix.exs`:

        def deps do
          [{:sco_filewatcher, "~> 0.0.1"}]
        end

  2. Ensure sco_filewatcher is started before your application:

        def application do
          [applications: [:sco_filewatcher]]
        end
