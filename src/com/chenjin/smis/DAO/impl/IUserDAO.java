package com.chenjin.smis.DAO.impl;

import java.util.List;


import com.chenjin.smis.damain.User;
import com.chenjin.smis.query.UserQueryObject;

public interface IUserDAO {
	/**
	 * 保存用户信息入表
	 * 
	 * @param user
	 *            用户对象
	 * @return null
	 */
	void save(User user);

	/**
	 * 根据用户id删除表中对应信息
	 * 
	 * @param id
	 *            用户主键
	 * @return null
	 */
	void delete(Long id);

	/**
	 * 更改对应主键值的用户信息
	 * 
	 * @param id
	 *            用户主键
	 * @param user
	 *            更改后的用户对象
	 * @return null
	 */
	void update(User user);

	/**
	 * 根据指定id返回对应用户信息
	 * 
	 * @param id
	 *            用户主键
	 * @return 用户对象
	 */
	User get(Long id);

	/**
	 * 返回表中所有用户信息
	 * 
	 * @return 用户对象集合
	 */
	List<User> list();

	// 将查询信息封装成对象，重构代码
	List<User> query(UserQueryObject uo);
}
