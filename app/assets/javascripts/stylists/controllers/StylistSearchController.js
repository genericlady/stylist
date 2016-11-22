app.controller("StylistSearchController", [
          "$scope", "stylists",
  function($scope ,  stylists) {
    
    var page = 0;

    $scope.stylists = [];

    $scope.search = function(searchParams) {
      $scope.searchTerms = searchParams;

      if (searchParams.name.length < 3 && searchParams.location.length < 2) {
        return;
      }

      if (searchParams.location.length > 0) {
        stylists.locationQuery($scope.searchTerms, page, function(results) {
          $scope.stylists = results.map(function(result) {
            var stylist = new Stylist;
            stylist.first_name = result.user.first_name; 
            stylist.last_name = result.user.last_name; 
            stylist.locations = [result];
            return stylist;
          });
          if ($scope.stylists.length > 0) {
            initializeMap();
          }
        });
      } else if (searchParams.name.length > 0) {
        stylists.stylistQuery($scope.searchTerms, page, function(results) {
           $scope.stylists = results.map(function(result) {
            var stylist = new Stylist;
            stylist.first_name = result.first_name;
            stylist.last_name = result.last_name;
            stylist.locations = result.locations;
            return stylist;
          });
          
          if ($scope.stylists.length > 0) {
            initializeMap();
          }
        });
      }

      $scope.searchedFor = searchParams;

    }

    initializeMap = function() {

      var stylist_markers = getStylistMarkers();
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 3,
        center: {lat: $scope.stylists[0].locations[0].latitude, lng: $scope.stylists[0].locations[0].longitude}
      });

      var map_image_path = {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'};
      var markerCluster = new MarkerClusterer(map, stylist_markers, map_image_path);

    }

    $scope.previousPage = function() {
      if (page > 0) {
        page = page - 1;
        $scope.search($scope.searchTerms);
      };
    }

    $scope.nextPage = function() {
      page = page + 1;
      $scope.search($scope.searchTerms);
    }

    function getStylistMarkers() {
      var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      var markers = $scope.stylists.map(function(stylist, i) {
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

  }
]);

