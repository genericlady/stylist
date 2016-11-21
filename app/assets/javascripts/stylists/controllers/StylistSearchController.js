app.controller("StylistSearchController", [
          "$scope", "stylists",
  function($scope ,  stylists) {
    var page = 0;

    $scope.stylists = [];

    $scope.search = function(search_params) {
      if (search_params.search_terms.length < 3) {
        return;
      }

      $scope.searchTerms = search_params['search_terms'];
      
      stylists.query($scope.searchTerms, page, function(results) {
        $scope.stylists = results;
      });
      

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


