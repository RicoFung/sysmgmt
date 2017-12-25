package admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import admin.entity.App;
import chok.devwork.BaseDao;

@Repository
public class AppDao extends BaseDao<App,Long>
{
	@Override
	public Class<App> getEntityClass()
	{
		return App.class;
	}
	
	public List<App> queryByUserId(Map<String, Object> m)
	{
		return this.getSqlSession().selectList(getStatementName("queryByUserId"), m);
	}
}
