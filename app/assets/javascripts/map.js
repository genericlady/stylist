var Map = (function() {

  var render = function(stylists) {

    var stylist_markers = stylistMarkers(stylists);
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 3,
      center: {lat: stylists[0].locations[0].latitude, lng: stylists[0].locations[0].longitude}
    });

    var map_image_path = {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'};
    var markerCluster = new MarkerClusterer(map, stylist_markers, map_image_path);

  }


  var stylistMarkers = function(stylists) {
    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var markers = stylists.map(function(stylist, i) {
      var locations = stylist.
        locations.
        map((location) => {
          return {lat: location.latitude, lng: location.longitude}; 
        });

      var stylistMarkers = locations.map(function(coords) {
        return new google.maps.Marker({
          position: coords,
          label: labels[i % labels.length]
        });
      });

      return stylistMarkers
    });

    var flattened_markers = markers.reduce(function(a, b) {
      return a.concat(b); 
    });

    return flattened_markers;
  };


  return {
    render: render,
  };
})();
