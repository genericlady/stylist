app.controller("StylistSearchController", [
          "$scope", "$http",
  function($scope ,  $http) {
    var page = 0;

    $scope.stylists = [];

    $scope.search = function(search_params) {
      if (search_params.search_terms.length < 3) {
        return;
      }

      $scope.searchTerms = search_params['search_terms'];

      $http.get("/stylists.json",
                {
                  paramSerializer: '$httpParamSerializerJQLike',
                  "params": {
                    "search_terms": $scope.searchTerms,
                    "page": page
                  }
                }
      ).then(function(response) {
        $scope.stylists = response.data;
      },function(response) {
        alert("There was a problem: " + response.status);
        }
      );

      $scope.searchedFor = search_params['search_terms'];

    }

    $scope.previousPage = function() {
      if (page > 0) {
        page = page - 1;
        $scope.search({ "search_terms": $scope.searchTerms });
      };
    }

    $scope.nextPage = function() {
      page = page + 1;
      $scope.search({ "search_terms": $scope.searchTerms });
    }
  }
    
]);


