var Map = (function() {

  var render = function(markers) {
    var mapMarkers = 
      markers.map(function(marker) {
        return new google.maps.Marker(marker)
      });

    var center = mapMarkers[0].position || {lat: 36.801087, lng: -98.667907};
    if (mapMarkers.length <= 1) {
     var zoom = 15; 
    } else {
     var zoom = 4;
    } 

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: zoom,
      center: center,
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
