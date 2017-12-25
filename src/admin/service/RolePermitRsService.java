package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.RolePermitRsDao;
import admin.entity.RolePermitRs;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class RolePermitRsService extends BaseService<RolePermitRs,Long>
{
	@Autowired
	private RolePermitRsDao rolePermitRsDao;

	@Override
	public BaseDao<RolePermitRs,Long> getEntityDao() {
		return rolePermitRsDao;
	}
	
	public void delByRoleId(Long roleId)
	{
		rolePermitRsDao.delByRoleId(roleId);
	}
}
