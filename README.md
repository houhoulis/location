## A simple LiveView app that shows the user their current location.

### Includes live-rendering of map images via Mapbox's [Static Images API][mapbox-api]

This is a simple LiveView app that shows the user their current location (latitude and longitude). It also plots the location on a static map image, which refreshes as the user's location changes. The map feature uses (and requires) a [Mapbox][mapbox] API token as an environment variable.

I wrote this app as an example to use when writing a blog post about implementing a JavaScript LiveView client hook. The blog post is drafted and will hopefully be published soon 🤞🏼

The app is currently [deployed on fly.io][deployed], if you want to see it in action.

### Port number when running in development mode

I changed the port number specification in `config/dev.exs` from the standard 4000 to 4001. This was purely for my convenience, as I often have multiple Phoenix applications running locally.

[mapbox-api]: https://docs.mapbox.com/api/maps/static-images/
[mapbox]: https://www.mapbox.com/
[deployed]: https://location-leaf-7860.fly.dev/location
