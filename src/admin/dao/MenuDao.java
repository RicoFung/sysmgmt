package admin.dao;

import org.springframework.stereotype.Repository;

import admin.entity.Menu;
import chok.devwork.BaseDao;


@Repository
public class MenuDao extends BaseDao<Menu,Long>
{
	@Override
	public Class<Menu> getEntityClass()
	{
		return Menu.class;
	}
}
