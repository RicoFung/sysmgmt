package common;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import chok.devwork.BaseController;

@Scope("prototype")
@Controller
@RequestMapping("/dict")
public class DictAction extends BaseController<Object>
{
	@RequestMapping("/getAppTreeNodes")
	public void getAppTreeNodes()
	{
		List<Object> treeNodes = Dict.getAppTreeNodes(req.getLong("appId"), null);
		printJson(treeNodes);
	}
	
	@RequestMapping("/getMenuTreeNodes")
	public void getMenuTreeNodes()
	{
		List<Object> treeNodes = Dict.getMenuTreeNodes(req.getLong("menuId"), req.getParameterValueMap(false, true));
		printJson(treeNodes);
	}
	
	@RequestMapping("/getPermitTreeNodes")
	public void getPermitTreeNodes()
	{
		List<Object> treeNodes = Dict.getPermitTreeNodes(req.getLong("permitId"), req.getParameterValueMap(false, true));
		printJson(treeNodes);
	}
	
	@RequestMapping("/getRoleTreeNodes")
	public void getRoleTreeNodes()
	{
		List<Object> treeNodes = Dict.getRoleTreeNodes(req.getLong("roleId"), req.getParameterValueMap(false, true));
		printJson(treeNodes);
	}
}
