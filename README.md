# README

Venue finder provides the ability to enter a location in the format of latitude longitude and it will return a list of venues such as restaurants, pubs, coffee shops etc sorted by calculated Euclidean distance. To do this, the project makes use of the following API: https://developer.foursquare.com/reference/place-search
To make use of this api, an api key is required, however at present there isn't a way to generate a new key. I am happy to provide a working api key to test this project.

A valid latitude is between -90 and 90 inclusive and a valid longitude is between -180 and 180 inclusive.

To launch the venue finder:
Clone the repo
Cd into venue_finder
Open / create the .env file in a text editor, e.g. nano .env
Add the following - api_key=API_KEY_HERE, replacing API_KEY_HERE with the api key that I can provide
Save and close the .env file
You may need to run yarn install to update any packages
Run rails server

Then you can navigate to localhost:3000 in a browser and you will be presented with the landing page.
To find venues near to a location, you will need to enter a point as a latitude and longitude in their respective fields and hit submit. This will then present you with venues in order of distance to the given point, along with the type of venue and their address.

This functionality can also be accessed as an api endpoint. For this basic implementation no authentication is required to access the endpoint.
To test this, the endpoint is api/distance/closest_venues and requires a latitude and longitude as one single parameter, comma seperated. Therefore a basic example may look like:
http://localhost:3000/api/distance/closest_venues?ll=52.1,-1.24
A successful request returns a 200 response along with the sorted results in JSON format, this is quite a raw response and has not yet been tidied up.
An incorrect request with a bad latitude, longitude will return a 400 response.
