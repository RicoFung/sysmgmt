package admin.dao;

import org.springframework.stereotype.Repository;

import admin.entity.UserRoleRs;
import chok.devwork.BaseDao;

@Repository
public class UserRoleRsDao extends BaseDao<UserRoleRs,Long>
{
	@Override
	public Class<UserRoleRs> getEntityClass()
	{
		return UserRoleRs.class;
	}
	
	public void delByUserId(Long userId)
	{
		this.getSqlSession().delete(getStatementName("delByUserId"), userId);
	}
	
	public void delByRoleId(Long roleId)
	{
		this.getSqlSession().delete(getStatementName("delByRoleId"), roleId);
	}
	
	public String getRoleIdsByUserId(Long userId)
	{
		return this.getSqlSession().selectOne(getStatementName("getRoleIdsByUserId"), userId);
	}
}
