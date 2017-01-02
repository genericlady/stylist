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
            Map.render($scope.stylists);
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
            Map.render($scope.stylists);
          }
        });
      }

      $scope.searchedFor = searchParams;

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
  }
]);

