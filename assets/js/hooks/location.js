export default Location = {
  mounted() {
    const success = (positionObject) => this.pushEvent("location-update", {coordinates: positionObject.coords})

    const error = (err) => console.error(`Error: ${err.code}: ${err.message}.`)

    const options = {
      enableHighAccuracy: true,
      // timeout: 5000,
      maxAge: 0
    }

    navigator.geolocation.watchPosition(success, error, options);
  }
}
