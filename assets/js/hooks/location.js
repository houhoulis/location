export default Location = {
  mounted() {
    const success = (positionObject) => this.pushEvent("location-update", {coordinates: positionObject.coords})

    const error = (err) => console.error(`Error: ${err.code}: ${err.message}.`)

    const options = {
      enableHighAccuracy: true,
      maxAge: 5000 // client can return a cached position for up to 5 seconds before attempting to retrieve the real current position
    }

    navigator.geolocation.watchPosition(success, error, options);
  }
}
