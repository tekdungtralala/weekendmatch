<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" data-ng-app="app">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="SHORTCUT ICON" href="eplweb_components/image/favicon.ico">

    <title>English Premier League</title>

    <!-- Module Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
    <link href="bower_components/angular-busy/dist/angular-busy.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="eplweb_components/css/index.css" rel="stylesheet">

    <style>
        body {
            padding-top: 70px;
            /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
        }
    </style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class='epl-body'>
    <!-- bower module -->
    <script src="bower_components/jquery/dist/jquery.js"></script>
    <script src="bower_components/angular/angular.js"></script>
    <script src="bower_components/angular-route/angular-route.js"></script>
    <script src="bower_components/angular-animate/angular-animate.js"></script>
    <script src="bower_components/angular-busy/dist/angular-busy.js"></script>
    <script src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="bower_components/underscore/underscore.js"></script>
    <script src="bower_components/moment/moment.js"></script>

    <!-- other module -->
    <script src="eplweb_components/js/highcharts.js"></script>
    <script src="eplweb_components/js/exporting.js"></script>

    <!-- app module -->
    <script src="app/app.module.js"></script>

    <!-- route module -->
    <script src="app/blocks/router/router.module.js"></script>
    <script src="app/blocks/router/routehelper.js"></script>

    <!-- core module -->
    <script src="app/core/core.module.js"></script>
    <script src="app/core/constants.js"></script>
    <script src="app/core/config.js"></script>
    <script src="app/core/dataservice.js"></script>
    <script src="app/core/datautil.js"></script>

    <script src="app/dashboard/dashboard.module.js"></script>
    <script src="app/dashboard/config.route.js"></script>
    <script src="app/dashboard/dashboard.js"></script>

    <script src="app/rank/rank.module.js"></script>
    <script src="app/rank/config.route.js"></script>
    <script src="app/rank/rank.js"></script>

    <script src="app/matchday/matchday.module.js"></script>
    <script src="app/matchday/config.route.js"></script>
    <script src="app/matchday/matchday.js"></script>

    <script src="app/team/team.module.js"></script>
    <script src="app/team/config.route.js"></script>
    <script src="app/team/team.js"></script>

    <script src="app/totw/totw.module.js"></script>
    <script src="app/totw/config.route.js"></script>
    <script src="app/totw/totw.js"></script>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
        cg-busy="{promise:promise, wrapperClass:'container'}">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" 
                    class="navbar-toggle" data-toggle="collapse" 
                    data-target="#bs-example-navbar-collapse-1">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand epl-sub-menu" href="#/">
                    English Premier League
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#/rank" class='epl-sub-menu'>Tables</a>
                    </li>
                    <li>
                        <a href="#/matchday" class='epl-sub-menu'>Matchday</a>
                    </li>
                    <li>
                        <a href="#/totw" class='epl-sub-menu'>Team of The Week</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <script>
        $( document ).ready(function() {
            $('.epl-sub-menu').click(function(){
                var collapseElmt = $('#bs-example-navbar-collapse-1');
                if ( collapseElmt.hasClass('in')) collapseElmt.collapse('toggle');
            });
        });
    </script>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div data-ng-view id='epl-main-container'>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->

    <div id='epl-eof'/>
</body>

</html>
