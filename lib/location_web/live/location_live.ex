defmodule LocationWeb.LocationLive do
  use LocationWeb, :live_view

  require Logger

  def mount(_params, _session, socket) do
    {:ok, assign(socket, lat: 0, long: 0, accuracy: 0)}
  end

  def render(assigns) do
    ~H"""
    <p id="location" phx-hook="Location">
      Hello lat {@lat} and long {@long} with accuracy {@accuracy}!
    </p>

    <iframe
      src={"https://www.google.com/maps/embed?pb=!1m13!1m8!1m3!1d737.6649957308954!2d#{@long}2!3d#{@lat}1!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zNDLCsDE4JzI1LjIiTiA3McKwMDYnMTcuNCJX!5e0!3m2!1sen!2sus!4v1739210693229!5m2!1sen!2sus"}
      width="600"
      height="450"
      style="border:0;"
      allowfullscreen=""
      loading="lazy"
      referrerpolicy="no-referrer-when-downgrade"
    >
    </iframe>
    """
  end

  def handle_event(
        "location-update",
        %{"coordinates" => %{"latitude" => lat, "longitude" => long, "accuracy" => accuracy}},
        socket
      ) do
    {:noreply, assign(socket, lat: lat, long: long, accuracy: accuracy)}
  end
end
