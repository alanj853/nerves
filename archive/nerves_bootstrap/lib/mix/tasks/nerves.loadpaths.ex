defmodule Mix.Tasks.Nerves.Loadpaths do
  use Mix.Task
  alias Nerves.Env

  require Logger

  def run(_args) do
    Mix.Task.reenable "deps.loadpaths"
    try do
      Env.initialize
      Env.bootstrap
      Env.stop
      Mix.shell.info """
      ------------------
      Nerves Environment
      ------------------
      Toolchain:  #{System.get_env("NERVES_TOOLCHAIN")}
      System:     #{System.get_env("NERVES_SYSTEM")}
      """
    rescue
      _e ->
        Mix.shell.info "Nerves.Env has not been compiled"
    end
  end
end
