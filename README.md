# ScoFilewatcher

##Vision

The ScoFilewatcher should watch a directory including all subdirs (configurable)
and report file changes to the sco server for further processing...


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
