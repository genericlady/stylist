# Steps to take
- modify the default devise user account creation to include entering location data
- on account creation the lookup for address -> ip should happen and become saved
- on location creation lookup the lat long of address and save that data to database
- [address to lat long](https://github.com/alexreisner/geocoder)
- stub a real address
- initiate map in javascript using the first persons first location
- https://developers.google.com/maps/documentation/javascript/
- make a map marker for every user location
 [Markers](https://developers.google.com/maps/documentation/javascript/markers)
- do things with google maps

# Implement Map Feature
- Google Maps has two types of markers.
- A group marker will show how many hits in the area
- A single marker will show one hit
- When you select a user the map should switch to single marker
- Restrict refferers on api key in google console

# Bigger Clusters
The more people the bigger the cluster png

# Query user by location
maybe use a where statement here to only include the locations that match
the query
outer join
left outer join

# Useful Public Data
- schedule for each location
- price/service

