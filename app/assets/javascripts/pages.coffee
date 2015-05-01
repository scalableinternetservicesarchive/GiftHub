# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
$(document).ready(function() {
    var app = angular.module('GiftHubApp', ['ui.bootstrap']);
    app.controller('MainCtrl', ['$scope',
        function($scope) {
            $scope.test = "Hello, world!";
        }
    ]);
    app.controller('ExchangePagingCtrl', ['$scope',
        function($scope) {
            $scope.currentPage = 1;
            $scope.totalItems = 4;

            $scope.setPage = function (pageNo) {
                $scope.currentPage = pageNo;
            };

            $scope.pageChanged = function() {
                $log.log('Page changed to: ' + $scope.currentPage);
            };
        }
    ]);
});


`