defmodule LocationWeb.LocationLive do
  use LocationWeb, :live_view

  require Logger

  def mount(_params, _session, socket) do
    {:ok, assign(socket, lat: 0, long: 0, accuracy: 0)}
  end

  # def handle_params(unsigned_params, uri, socket) do
  # end

  def render(assigns) do
    ~H"""
    <p id="location" phx-hook="Location">
      Hello lat {@lat} and long {@long} with accuracy {@accuracy}!
    </p>

    <p>
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1651.9876543210987!2d-100.41940000000001!3d30.77490000000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1d0x8085b5e7d8694021%3A0x4dfc46a69894eef7!2sSan%20Francisco%2C%20CA!5e0!3m2!1sen!2sus!4v1678886400000!5m2!1sen!2sus"
      width="600"
      height="450"
      style="border:0;"
      allowfullscreen=""
      loading="lazy"
      referrerpolicy="no-referrer-when-downgrade"
    </p>
    <p>
      src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d23609.09887853592!2d-101.1098368!3d30.2969344!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sus!4v1738887747984!5m2!1sen!2sus"
      width="600"
      height="450"
      style="border:0;"
      allowfullscreen=""
      loading="lazy"
      referrerpolicy="no-referrer-when-downgrade"
      >
    </p>
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
