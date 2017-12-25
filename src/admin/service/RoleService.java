package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.RoleDao;
import admin.dao.RolePermitRsDao;
import admin.dao.UserRoleRsDao;
import admin.entity.Role;
import admin.entity.RolePermitRs;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;
import chok.util.CollectionUtil;

@Service
public class RoleService extends BaseService<Role,Long>
{
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private RolePermitRsDao rolePermitRsDao;
	@Autowired
	private UserRoleRsDao userRoleRsDao;

	@Override
	public BaseDao<Role,Long> getEntityDao() {
		return roleDao;
	}
	
	@Override
	public void add(Role po)
	{
		// 插入系统角色表
		roleDao.add(po);
		// 插入系统角色权限表
		if (po.get("tc_permit_ids").toString().length()<1) return;
		Long tcRoleId = po.getId();
		Long[] tcPermitIds = CollectionUtil.strToLongArray(po.get("tc_permit_ids").toString(), ",");
		for(Long tcPermitId : tcPermitIds)
		{
			RolePermitRs o = new RolePermitRs();
			o.set("tc_role_id", tcRoleId);
			o.set("tc_permit_id", tcPermitId);
			rolePermitRsDao.add(o);
		}
	}
	
	@Override
	public void del(Long[] ids) 
	{
		for(Long id:ids)
		{
			rolePermitRsDao.delByRoleId(id);
			userRoleRsDao.delByRoleId(id);
			roleDao.del(id);
		}
	}
	
	@Override
	public void upd(Role po)
	{
		roleDao.upd(po);
		if(po.get("tc_permit_ids")!=null)
		{
			// 清空旧记录
			rolePermitRsDao.delByRoleId(po.getLong("id"));
			// 插入系统角色权限表
			if (po.get("tc_permit_ids").toString().length()<1) return;
			Long tcRoleId = po.getLong("id");
			Long[] tcPermitIds = CollectionUtil.strToLongArray(po.get("tc_permit_ids").toString(), ",");
			for(Long tcPermitId : tcPermitIds)
			{
				RolePermitRs o = new RolePermitRs();
				o.set("tc_role_id", tcRoleId);
				o.set("tc_permit_id", tcPermitId);
				rolePermitRsDao.add(o);
			}
		}
	}
	
	@Override
	public Role get(Long id) 
	{
		Role po = roleDao.get(id);
		po.set("tc_permit_ids", rolePermitRsDao.getPermitIdsByRoleId(id));
		return po;
	}
	
	public List<Role> queryByUserId(Long userId)
	{
		return roleDao.queryByUserId(userId);
	}
}
