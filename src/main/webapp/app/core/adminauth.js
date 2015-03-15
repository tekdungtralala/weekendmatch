(function() {
	'use strict';

	angular
		.module('app.core')
		.factory('adminauth', AdminAuth);

	function AdminAuth($cookieStore, $rootScope, $state) {
		var ADMIN_SESSION_KEY = 'epl-admin-session';
		var EPL_AUTH_HEADER = 'epl-authentication';

		var service = {
			// Save admin session into cookie
			putAdminSession: putAdminSession,
			// Take admin session from cookie 
			getAdminSession: getAdminSession,
			// Remove admin session on cookies
			delAdminSession: delAdminSession,
			// Generate http conf for admin
			getConf: getConf
		};

		return service;

		function getConf(o, method, url) {
			var req = {
				method: method,
				url: url,
				headers: {
					"Content-Type": "application/json"
				}
			}

			if (o) {
				req.data = JSON.stringify(o);
			}

			req.headers[EPL_AUTH_HEADER] = getAdminSession();

			return req;
		}

		function delAdminSession() {
			$cookieStore.remove(ADMIN_SESSION_KEY);
		}

		function getAdminSession() {
			return $cookieStore.get(ADMIN_SESSION_KEY);
		}

		function putAdminSession(session) {
			$cookieStore.put(ADMIN_SESSION_KEY, session);
		}
	}
	
})();