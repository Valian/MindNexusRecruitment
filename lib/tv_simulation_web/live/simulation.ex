defmodule TvSimulationWeb.SimulationLive do
  @moduledoc false
  use TvSimulationWeb, :live_view
  require Logger

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-4">
      <.header>
        Simulation of tracking TV habits
        <:subtitle>Recruitment task for MindNexus company</:subtitle>
      </.header>

      <div class="grid grid-cols-3 gap-4">
        <.card title="Time passed"><%= @simulation_time_passed %> minutes</.card>
        <.card title="Participants"><%= @simulation_participants %></.card>
        <.card title="Channels"><%= @simulation_channels %></.card>
      </div>

      <.simple_form for={@form} phx-submit="save" phx-change="change">
        <.input
          field={@form[:question]}
          type="text"
          label="Question"
          placeholder="What would you like to ask?"
        />
        <:actions>
          <.button>Ask a question</.button>
        </:actions>
      </.simple_form>

      <p class="border p-4 italic rounded-lg">
        Answer to the question should appear here
      </p>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:simulation_time_passed, 0)
      |> assign(:form, get_form(%{}))
      # these can be hardcoded for the purpose of take-home assignment
      |> assign(:simulation_participants, 100)
      |> assign(:simulation_channels, 5)

    {:ok, socket}
  end

  @impl true
  def handle_event("change", %{"form" => params}, socket) do
    {:noreply, assign(socket, :form, get_form(params, action: :insert))}
  end

  @impl true
  def handle_event("save", %{"form" => _params}, socket) do
    {:noreply, put_flash(socket, :error, "It's your task to implement it!")}
  end

  defp get_form(params, action \\ :ignore) do
    params
    |> get_changeset()
    |> Map.put(:action, action)
    |> to_form(as: :form)
  end

  defp get_changeset(params) do
    data = %{}
    types = %{question: :string}

    {data, types}
    |> Ecto.Changeset.cast(params, Map.keys(types))
    |> Ecto.Changeset.validate_required([:question])
  end
end
