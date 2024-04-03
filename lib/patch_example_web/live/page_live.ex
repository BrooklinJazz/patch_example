defmodule PatchExampleWeb.PageLive do
  use PatchExampleWeb, :live_view

  def mount(_params, _session, socket) do
    IO.inspect("MOUNTING")
    {:ok, assign(socket, mount_id: Enum.random(1..100))}
  end

  def handle_params(params, _uri, socket) do
    IO.inspect("PATCHING")
    {:noreply, assign(socket, patch_id: Enum.random(1..100))}
  end

  def render(assigns) do
    ~H"""
    <p>Mounted:<%= @mount_id %></p>
    <p>Patched:<%= @patch_id %></p>
    <.button>
      <.link navigate={"/"}>navigate (re-mount)</.link>
    </.button>
    <.button>
      <.link patch={"/"}>patch</.link>
    </.button>

    <h1 class="mt-10">Parent LiveView Assigns:</h1>
    <pre class="bg-black text-white p-10">
      <%= inspect(assigns, pretty: true) %>
    </pre>

    <.live_component module={PatchExampleWeb.PageComponent} id={:page_component} patch_id={@patch_id} mount_id={@mount_id} />
    """
  end
end
