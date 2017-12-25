package admin.dao;

import org.springframework.stereotype.Repository;

import admin.entity.User;
import chok.devwork.BaseDao;

@Repository
public class UserDao extends BaseDao<User,Long>
{
	@Override
	public Class<User> getEntityClass()
	{
		return User.class;
	}
}
