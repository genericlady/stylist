app = angular.module('stylists',[]);

app.controller("StylistSearchController", [
          "$scope", "$http",
  function($scope ,  $http) {
    $scope.stylists = [];
    $scope.search = function(params) {
      $http.get("/stylists.json",
                {
                  paramSerializer: '$httpParamSerializerJQLike',
                  "params": {
                    "search_terms": {
                      'stylist': params['search_terms']['stylist'],
                      'near':    params['search_terms']['near']
                    }
                  }
                }
      ).then(function(response) {
        $scope.stylists = response.data;
      },function(response) {
        alert("There was a problem: " + response.status);
        }
      );
    $scope.searchedFor = params['search_terms']['stylist'] + ' ' +
                         params['search_terms']['near']
    };
  }
]);

function fullAddress() {
  return function (location) {
    return location.address1
           + " "
           + location.address2
           + "  "
           + location.city
           + ", "
           + location.state
  };
}
app.filter('fullAddress', fullAddress);
