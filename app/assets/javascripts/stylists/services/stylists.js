app.factory('stylists', ['$http', function($http) {

  var stylistQuery = function (searchTerms, page, callback) {
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

  var locationQuery = function (searchTerms, page, callback) {
    $http.get("/locations.json",
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
    stylistQuery: stylistQuery,
    locationQuery: locationQuery
  }
}]);

