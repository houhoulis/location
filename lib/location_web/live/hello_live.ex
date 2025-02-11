defmodule LocationWeb.HelloLive do
  use LocationWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Hello!</h1>
    """
  end
end
