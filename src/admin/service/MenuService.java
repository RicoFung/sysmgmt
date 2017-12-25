package admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.MenuDao;
import admin.entity.Menu;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class MenuService extends BaseService<Menu,Long>
{
	@Autowired
	private MenuDao menuDao;

	@Override
	public BaseDao<Menu,Long> getEntityDao() {
		return menuDao;
	}
	
	public List getAll()
	{
		List<Menu> menuData = menuDao.query(null);
		List<Object> treeNodes = new ArrayList<Object>();
		for(int i=0; i<menuData.size(); i++)
		{
			Menu o = menuData.get(i);
			treeNodes.add(o.getM());
		}
		return treeNodes;
	}
}
