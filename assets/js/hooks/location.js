export default Location = {
  mounted() {
    const this2 = this;

    function success(position) {
      const coords = position.coords

      console.debug(`Success! Lat ${coords.latitude}, long ${coords.longitude}, accuracy ${coords.accuracy}.`)

      this2.pushEvent("location-update", {coordinates: coords})
    }

    function error(err) {
      console.error(`Error: ${err.code}: ${err.message}.`)
    }

    const options = {
      enableHighAccuracy: true,
      // timeout: 5000,
      maxAge: 0
    }

    navigator.geolocation.watchPosition(success, error, options);
  }
}
