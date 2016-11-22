app = angular.module('stylists',['ngMap']);

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
