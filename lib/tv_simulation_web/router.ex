defmodule TvSimulationWeb.Router do
  use TvSimulationWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TvSimulationWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", TvSimulationWeb do
    pipe_through :browser

    live "/", SimulationLive
  end
end
