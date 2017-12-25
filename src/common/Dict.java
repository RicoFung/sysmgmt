package common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import chok.devwork.BaseModel;
import chok.devwork.BaseService;

public class Dict 
{
	/**
	 * 获取应用树节点集合
	 * @param appId 已关联应用id
	 * @param params
	 * @return List<Object>
	 */
	public static List<Object> getAppTreeNodes(Long appId, Map<String, Object> params)
	{
		return getTreeNodes(appId, params, Factory.getAppService());
	}
	
	/**
	 * 获取菜单树节点集合
	 * @param menuId 已关联菜单id
	 * @param params
	 * @return List<Object>
	 */
	public static List<Object> getMenuTreeNodes(Long menuId, Map<String, Object> params)
	{
		return getTreeNodes(menuId, params, Factory.getMenuService());
	}
	
	/**
	 * 获取权限树节点集合
	 * @param permitId 已关联权限id
	 * @param params
	 * @return List<Object>
	 */
	public static List<Object> getPermitTreeNodes(Long permitId, Map<String, Object> params)
	{
		return getTreeNodes(permitId, params, Factory.getPermitService());
	}
	
	/**
	 * 获取角色树节点集合
	 * @param roleId 已关联角色id
	 * @param params
	 * @return List<Object>
	 */
	public static List<Object> getRoleTreeNodes(Long roleId, Map<String, Object> params)
	{
		return getTreeNodes(roleId, params, Factory.getRoleService());
	}
	
	/**
	 * 获取树节点集合(通用)
	 * @param selectedId
	 * @param params
	 * @param service
	 * @return List<Object>
	 */
	private static List<Object> getTreeNodes(Long selectedId, Map<String, Object> params, BaseService service)
	{
		List<Object> treeNodes = new ArrayList<Object>();
		if(selectedId!=0)
		{// 所有，且标记已选
			BaseModel selectedObj = (BaseModel) service.get(selectedId);
			List<BaseModel> objData = service.query(params);
			for(int i=0; i<objData.size(); i++)
			{
				BaseModel o = objData.get(i);
				if(o.getLong("id") == selectedObj.getLong("id"))
				{
					o.set("checked", true);
				}
				treeNodes.add(o.getM());
			}
		}
		else
		{// 所有
			List<BaseModel> resultData = service.query(params);
			for(BaseModel o : resultData)
			{
				treeNodes.add(o.getM());
			}
		}
		return treeNodes;
	}
}
