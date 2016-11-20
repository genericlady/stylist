app.factory('stylists', ['$http', function($http) {

  var query = function (searchTerms, page) {
    $http.get("/stylists.json",
              {
                paramSerializer: '$httpParamSerializerJQLike',
                "params": {
                  "search_terms": searchTerms,
                  "page": page
                }
              }
    ).success(function(response) {
      return response.data;
    })
    .error(function(err) {
      return err;
    });
 
  };

  return {
    query: query,
  }
}]);

