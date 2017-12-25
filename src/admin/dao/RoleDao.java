package admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import admin.entity.Role;
import chok.devwork.BaseDao;

@Repository
public class RoleDao extends BaseDao<Role,Long>
{
	@Override
	public Class<Role> getEntityClass()
	{
		return Role.class;
	}
	
	public List<Role> queryByUserId(Long userId)
	{
		return this.getSqlSession().selectList(getStatementName("queryByUserId"), userId);
	}
}
