defmodule LocationWeb.LocationLive do
  use LocationWeb, :live_view

  require Logger

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       lat: 0,
       long: 0,
       left: -0.0018,
       lower: -0.001,
       right: 0.0018,
       upper: 0.001,
       accuracy: 0,
       ready: false
     )}
  end

  def render(assigns) do
    ~H"""
    <p id="location" phx-hook="Location">
      Hello lat {@lat} and long {@long} with accuracy {@accuracy}!
    </p>

    <p>
      width="100%"
      height="300px"
      frameborder="0"
      allowfullscreen
      allow="geolocation"
      src="//umap.openstreetmap.fr/en/map/new/?scaleControl=false&miniMap=false&scrollWheelZoom=false&zoomControl=true&editMode=disabled&moreControl=false&searchControl=null&tilelayersControl=null&embedControl=null&datalayersControl=true&onLoadPanel=none&captionBar=false&captionMenus=true&datalayers=&editinosmControl=true&captionControl=true#18/46.40502/23.93210"
      >
    </p>
    <p>
      <a href="//umap.openstreetmap.fr/en/map/new/?scaleControl=false&miniMap=false&scrollWheelZoom=true&zoomControl=true&editMode=disabled&moreControl=false&searchControl=null&tilelayersControl=null&embedControl=null&datalayersControl=true&onLoadPanel=none&captionBar=false&captionMenus=true&datalayers=&editinosmControl=true&captionControl=true#18/46.40502/23.93210">
        See full screen on uMap
      </a>
    </p>

    <div :if={!@ready}>
      <p>
        Loading current position....
      </p>
    </div>
    <div :if={@ready}>
      <iframe
        width="425"
        height="350"
        src={"https://www.openstreetmap.org/export/embed.html?bbox=#{@left}%2C#{@lower}%2C#{@right}%2C#{@upper}&layer=mapnik&marker=#{@lat}%2C#{@long}"}
        style="border: 1px solid black"
      >
      </iframe>
      <br />
      <small>
        <a href={"https://www.openstreetmap.org/?mlat=#{@lat}&amp;mlon=#{@long}#map=19/#{@lat}/#{@long}"}>
          View Larger Map on OpenStreetMap
        </a>
      </small>
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
       left: long - 0.0018,
       lower: lat - 0.001,
       right: long + 0.0018,
       upper: lat + 0.001,
       accuracy: accuracy,
       ready: true
     )}
  end
end
