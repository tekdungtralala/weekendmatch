package com.wiwit.eplweb.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wiwit.eplweb.model.User;

@Service
public class UserDAO {

	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public User findByEmail(String email) {
		Session session = this.sessionFactory.getCurrentSession();

		List<User> result = session.createQuery(
				"from User as u where u.email = '" + email + "'").list();
		if (result == null || result.size() == 0) {
			return null;
		}
		return result.get(0);
	}
}