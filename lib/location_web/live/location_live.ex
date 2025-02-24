defmodule LocationWeb.LocationLive do
  use LocationWeb, :live_view

  require Logger

  @map_token Application.compile_env!(:location, :map_token)

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       lat: 0,
       long: 0,
       left: -0.0009,
       lower: -0.0005,
       right: 0.0009,
       upper: 0.0005,
       accuracy: 0.0,
       ready: false,
       token: @map_token
     )}
  end

  def render(assigns) do
    ~H"""
    <p id="location" phx-hook="Location">
      Hello lat {@lat} and long {@long} with a {@accuracy}-meter margin of error!
    </p>

    <div :if={!@ready}>
      <p>
        Loading current position....
      </p>
    </div>

    <div :if={@ready}>
      <img
        id="mapbox"
        src={"https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/geojson(%7B%22type%22%3A%22Point%22%2C%22coordinates%22%3A%5B#{@long}%2C#{@lat}%5D%7D)/#{@long},#{@lat},16.33/400x400?access_token=#{@token}"}
      />
    </div>
    """
  end

  def handle_event(
        "location-update",
        %{"coordinates" => %{"latitude" => lat, "longitude" => long, "accuracy" => accuracy}},
        socket
      ) do
    {:noreply,
     assign(socket,
       lat: lat,
       long: long,
       left: long - 0.0009,
       lower: lat - 0.0005,
       right: long + 0.0009,
       upper: lat + 0.0005,
       accuracy: Float.round(accuracy, 3),
       ready: true
     )}
  end
end
