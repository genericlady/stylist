app.factory('stylists', ['$http', function($http) {

  var query = function (searchTerms, page, callback) {
    $http.get("/stylists.json",
              {
                paramSerializer: '$httpParamSerializerJQLike',
                "params": {
                  "search_terms": searchTerms,
                  "page": page
                }
              }
    ).success(function(response) {
      callback(response);
    })
    .error(function(err) {
      return err;
    });
 
  };

  return {
    query: query,
  }
}]);

