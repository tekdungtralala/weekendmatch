package com.wiwit.eplweb.filter;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.http.HttpStatus;

import com.wiwit.eplweb.util.PathPattern;
import com.wiwit.eplweb.util.PathPatternUtil;
import com.wiwit.eplweb.util.WebappProps;

public class CustomFilter implements Filter {

	private static final Logger logger = LoggerFactory
			.getLogger(CustomFilter.class);

	private SessionService service;

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest rq, ServletResponse rs,
			FilterChain chain) throws IOException, ServletException {
		// String url = ((HttpServletRequest) req).getRequestURL().toString();
		// String queryString = ((HttpServletRequest) req).getQueryString();

		HttpServletRequest req = (HttpServletRequest) rq;
		HttpServletResponse res = (HttpServletResponse) rs;

		String path = req.getServletPath();
		String method = req.getMethod();

		PathPattern p = PathPatternUtil.getPathPattern(path);
		if (p != null) {
			if (p.isSecuredPath() && p.getMethods().contains(method)) {
				logger.info(method + " SECURED : " + path);

				Resource resource = new ClassPathResource("webapp.properties");
				Properties props = PropertiesLoaderUtils
						.loadProperties(resource);

				String authKey = props
						.getProperty(WebappProps.ADMIN_SESSION_KEY.toString());
				String authVal = req.getHeader(authKey);

				if (service.findBySession(authVal) != null) {
					chain.doFilter(rq, rs);
				} else {
					res.setStatus(HttpStatus.FORBIDDEN.value());
				}
			} else {
				chain.doFilter(rq, rs);
			}
		} else {
			logger.info(method + " FAIL : " + path);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.info("Init filter");
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"filter-context.xml");
		service = context.getBean(SessionService.class);
	}

}