(function() {
	"use strict";

	angular
		.module("app.matchday")
		.config(configRoute);

	function configRoute($stateProvider) {
		$stateProvider
			.state("matchday", {
				url: "/matchday",
				templateUrl: "app/matchday/matchday.html",
				controller: "Matchday",
				controllerAs: 'vm',
				resolve: {
					initData: getInitData
				}
			})
			.state("matchday.list-matchday", {
				url: "/list-matchday",
				templateUrl: "app/matchday/list-matchday.html",
				controllerAs: 'vm',
				controller: "ListMatchday"
			})
			.state("matchday.updatescore-matchday", {
				url: "/updatescore-matchday",
				templateUrl: "app/matchday/updatescore-matchday.html",
				controllerAs: 'vm',
				controller: "UpdateScoreMatchday"
			})
			.state("matchday.updaterank-matchday", {
				url: "/updaterank-matchday",
				templateUrl: "app/matchday/updaterank-matchday.html",
				controllerAs: 'vm',
				controller: "UpdateRankMatchday"
			})
			;

		function getInitData(dataservice) {
			return dataservice.getInitData("matchday").then(function(data) {
				return data;
			});
		}
	}
	
})();
