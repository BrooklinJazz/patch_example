defmodule PatchExampleWeb.PageComponent do
  use PatchExampleWeb, :live_component

  def update(assigns, socket) do
    assigns =
      socket
      |> assign(assigns)
      |> assign(live_component_update_id: Enum.random(1..100))

    {:ok, assigns}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1 class="mt-10">Live Component Assigns</h1>
      <pre class="bg-black text-white p-10">
        <%= inspect(assigns, pretty: true) %>
      </pre>
    </div>
    """
  end
end
