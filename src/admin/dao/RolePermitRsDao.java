package admin.dao;

import org.springframework.stereotype.Repository;

import admin.entity.RolePermitRs;
import chok.devwork.BaseDao;

@Repository
public class RolePermitRsDao extends BaseDao<RolePermitRs,Long>
{
	@Override
	public Class<RolePermitRs> getEntityClass()
	{
		return RolePermitRs.class;
	}
	
	public void delByRoleId(Long roleId)
	{
		this.getSqlSession().delete(getStatementName("delByRoleId"), roleId);
	}
	
	public void delByPermitId(Long permitId)
	{
		this.getSqlSession().delete(getStatementName("delByPermitId"), permitId);
	}
	
	public String getPermitIdsByRoleId(Long roleId)
	{
		return this.getSqlSession().selectOne(getStatementName("getPermitIdsByRoleId"), roleId);
	}
}
