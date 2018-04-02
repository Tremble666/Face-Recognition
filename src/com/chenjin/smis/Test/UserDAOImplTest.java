package com.chenjin.smis.Test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.chenjin.smis.DAO.impl.IUserDAO;
import com.chenjin.smis.DAO.impl.UserDAOImpl;
import com.chenjin.smis.damain.User;
import com.chenjin.smis.query.UserQueryObject;


public class UserDAOImplTest {
	private IUserDAO userDAO = new UserDAOImpl();
	@Test
	public void testSave() {
		User u = new User();
		u.setName("汤姆");
		u.setEmail("1435016360@qq.com");
		u.setPassword("123456");
		u.setRealName("撒旦");
		u.setAge(21);
		u.setSex("boy");
		u.setJob("大学生");
		u.setFilePath("D://img");
		u.setAuthority(1);
		u.setLogState(0);
		userDAO.save(u);
	}

	@Test
	public void testDelete() {
		userDAO.delete(4l);
	}

	@Test
	public void testUpdate() {
		User u = userDAO.get(6l);
		u.setAge(100);
		userDAO.update(u);
	}

	@Test
	public void testGet() {
		User u = userDAO.get(1l);
		System.out.println(u);
	}

	@Test
	public void testList() {
		UserQueryObject uo = new UserQueryObject();
		uo.setName("彩虹");
		List<User> list = userDAO.query(uo);
		for (User user : list) {
			System.out.println(user);
		}
	}
	@Test
	public void testQuery() throws Exception {
		UserQueryObject uo = new UserQueryObject();
		uo.setAge(21);
		uo.setEmail("1435016360@qq.com");
		uo.setSex("boy");
		List<User> list = userDAO.query(uo);
		for (User user : list) {
			System.out.println(user);
		}
	}
}
