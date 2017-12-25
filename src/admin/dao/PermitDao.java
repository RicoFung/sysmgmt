package admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import admin.entity.Permit;
import chok.devwork.BaseDao;

@Repository
public class PermitDao extends BaseDao<Permit,Long>
{
	@Override
	public Class<Permit> getEntityClass()
	{
		return Permit.class;
	}
	
	public List<Permit> queryByRoleId(Long roleId)
	{
		return this.getSqlSession().selectList(getStatementName("queryByRoleId"), roleId);
	}
	
	public List<Permit> queryBtnPermitByUserId(Long userId)
	{
		return this.getSqlSession().selectList(getStatementName("queryBtnPermitByUserId"), userId);
	}
	
	public int getCountByUserIdAndActionUrl(Map m){
		return (Integer) this.getSqlSession().selectOne(getStatementName("getCountByUserIdAndActionUrl"), m);
	}
}
