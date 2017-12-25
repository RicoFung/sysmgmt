package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AppDao;
import admin.entity.App;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class AppService extends BaseService<App,Long>
{
	@Autowired
	private AppDao appDao;

	@Override
	public BaseDao<App,Long> getEntityDao() {
		return appDao;
	}
}
