defmodule ArevelWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use ArevelWeb, :controller
      use ArevelWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: ArevelWeb

      import Plug.Conn
      import ArevelWeb.Gettext
      alias ArevelWeb.Router.Helpers, as: Routes

      # Phoenix live view
      import Phoenix.LiveView.Controller, only: [live_render: 3]
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/arevel_web/templates",
        namespace: ArevelWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import ArevelWeb.ErrorHelpers
      import ArevelWeb.Gettext
      alias ArevelWeb.Router.Helpers, as: Routes

      # Phonenix live view
      import Phoenix.LiveView, only: [live_render: 2, live_render: 3]

    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller

      # Phoenix live view
      import Phoenix.LiveView.Router

    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import ArevelWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
