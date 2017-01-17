var Map = (function() {

  var render = function(markers) {
    var mapMarkers = 
      markers.map(function(marker) {
        return new google.maps.Marker(marker)
      });

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
      center: {lat: 36.801087, lng: -98.667907},
      scrollwheel: false
    });

    var mapImagePath = {
      imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
    };

    var markerCluster = new MarkerClusterer(map, mapMarkers, mapImagePath);

  }

  return {
    render: render,
  };
})();
