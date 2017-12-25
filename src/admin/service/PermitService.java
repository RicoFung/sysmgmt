package admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.PermitDao;
import admin.entity.Permit;
import chok.devwork.BaseDao;
import chok.devwork.BaseService;

@Service
public class PermitService extends BaseService<Permit,Long>
{
	@Autowired
	private PermitDao permitDao;

	@Override
	public BaseDao<Permit,Long> getEntityDao() {
		return permitDao;
	}
	
	@Override
	public void del(Long[] ids) 
	{
		for(Long id:ids)
		{
			// 删除菜单关联关系
			// 删除角色关联关系
			// 删除父子关联关系
			// 删除主表记录
			permitDao.del(id);
		}
	}
	
	public List<Permit> queryByRoleId(Long roleId)
	{
		return permitDao.queryByRoleId(roleId);
	}
	
	public List<Object> queryBtnPermitByUserId(Long userId)
	{
		List<Permit> btnPermitData = permitDao.queryBtnPermitByUserId(userId);
		List<Object> treeNodes = new ArrayList<Object>();
		for(int i=0; i<btnPermitData.size(); i++)
		{
			Permit o = btnPermitData.get(i);
			treeNodes.add(o.getM());
		}
		return treeNodes;
	}
	
	public int getCountByUserIdAndActionUrl(Map m)
	{
		return permitDao.getCountByUserIdAndActionUrl(m);
	}
}
