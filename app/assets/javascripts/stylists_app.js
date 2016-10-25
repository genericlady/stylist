app = angular.module('stylists',[]);

app.controller("StylistSearchController", [
          "$scope", "$http",
  function($scope ,  $http) {
    var page = 0;

    $scope.searchTerms = { "search_terms": { "stylist": "", "near": "" } };
    $scope.stylist = "";
    $scope.near    = "";

    $scope.stylists = [];
    $scope.search = function(search_params) {
      if (search_params.search_terms.near.length < 3 && 
          search_params.search_terms.stylist.length < 3) {
        return;
      }

      $scope.stylist = search_params['search_terms']['stylist'];
      $scope.near    = search_params['search_terms']['near'];

      $http.get("/stylists.json",
                {
                  paramSerializer: '$httpParamSerializerJQLike',
                  "params": {
                    "search_terms": { 'stylist': $scope.stylist, 'near': $scope.near },
                    "page": page
                  }
                }
      ).then(function(response) {
        $scope.stylists = response.data;
      },function(response) {
        alert("There was a problem: " + response.status);
        }
      );
      $scope.searchedFor = search_params['search_terms']['stylist'] +
                           ' ' +
                           search_params['search_terms']['near'];

    }

    $scope.previousPage = function() {
      if (page > 0) {
        page = page - 1;
        $scope.search({ "search_terms": { 'stylist': $scope.stylist, 'near': $scope.near } });
      };
    }

    $scope.nextPage = function() {
      page = page + 1;
      $scope.search({ "search_terms": { 'stylist': $scope.stylist, 'near': $scope.near } });
    }
  }
    
]);

function fullAddress() {
  return function (location) {
    return location.address1
             + " "
             + location.city
             + ", "
             + location.state
  };
}
app.filter('fullAddress', fullAddress);
