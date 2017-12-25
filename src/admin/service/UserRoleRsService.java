package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.UserRoleRsDao;
import admin.entity.UserRoleRs;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class UserRoleRsService extends BaseService<UserRoleRs,Long>
{
	@Autowired
	private UserRoleRsDao userRoleRsDao;

	@Override
	public BaseDao<UserRoleRs,Long> getEntityDao() 
	{
		return userRoleRsDao;
	}
	
	@Override
	public void add(UserRoleRs po)
	{
		userRoleRsDao.add(po);
	}
}
