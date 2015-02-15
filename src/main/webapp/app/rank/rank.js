(function() {
    'use strict';

    angular
        .module('app.rank')
        .controller('Rank', Rank);

    function Rank(dataservice) {
        var vm = this;
        vm.ranks = [];
        vm.weeks = [];
        vm.nextRankDisable = true;
        vm.prevRankDisable = false;
        vm.currWeek = null;
        vm.selectedWeek = null;

        activate();
        function activate() {
            var promises = [getAllPassedWeek(),getRanksByWeekNmr(null)];
            return dataservice.ready(promises).then(function(result){
                processWeekData(result[0]);
                var lastWeek = parseInt(vm.weeks[0].weekNumber);
                processRankData(result[1], lastWeek);
            });
        }

        function processRankData(ranks, currWeek){
            vm.ranks = ranks;
            initCurrPrevNext(currWeek);
        }

        function processWeekData(weeks){
            vm.weeks = weeks;
            _.each(vm.weeks, function(w){
                // Set dateView attribute
                w.dateView = getFormattedWeek(w);
            });
        }

        function getFormattedWeek(w){
            var date = new Date(w.startDay);
            var m = moment(date);
            return '#' + w.weekNumber + ' - ' + m.format('YYYY, DD MMM');
        }

        function initCurrPrevNext(currWeek){
            vm.currWeek = currWeek;

            vm.nextRankDisable = false;
            vm.prevRankDisable = false;

            var lastWeek = parseInt(vm.weeks[0].weekNumber);
            if (currWeek == 1) {
                vm.prevRankDisable = true;
            } else if (currWeek == lastWeek) {
                vm.nextRankDisable = true;
            }

            var currWeek = _.find(vm.weeks, function(w){
                return parseInt(w.weekNumber) === vm.currWeek;
            });
            vm.selectedWeek = getFormattedWeek(currWeek);
        }

        // ngClick
        vm.changeWeek = function(otherWeek){
            otherWeek = parseInt(otherWeek);
            getRanksByWeekNmr(otherWeek).then(function(data){
                processRankData(data, otherWeek);
            });
        }

        // Get weeks through service
        function getAllPassedWeek() {
            return dataservice.getAllPassedWeek().then(function(data) {
                console.log("data : ", data);
                return data.weeks;
            });
        }

        // Get ranks through service
        function getRanksByWeekNmr(weekNumber) {
            return dataservice.getRanksByWeekNmr(weekNumber).then(function(data) {
                return data.ranks;
            });
        }
    }
})();