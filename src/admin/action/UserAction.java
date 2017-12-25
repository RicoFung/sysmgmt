package admin.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.entity.Role;
import admin.entity.User;
import admin.service.RoleService;
import admin.service.UserService;
import chok.devwork.BaseController;
import chok.util.CollectionUtil;
import chok.util.EncryptionUtil;

@Scope("prototype")
@Controller
@RequestMapping("/admin/user")
public class UserAction extends BaseController<User>
{
	@Autowired
	private UserService service;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/add")
	public String add() 
	{
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/user/add.jsp";
	}
	@RequestMapping("/add2")
	public void add2(User po) 
	{
		try
		{
			service.add(po);
			print("1");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}
	
	@RequestMapping("/del")
	public void del() 
	{
		try
		{
			service.del(CollectionUtil.toLongArray(req.getLongArray("id[]", 0l)));
			result.setSuccess(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		printJson(result);
	}
	
	@RequestMapping("/upd")
	public String upd() 
	{
		put("po",service.get(req.getLong("id")));
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/user/upd.jsp";
	}
	@RequestMapping("/upd2")
	public void upd2(User po) 
	{
		try
		{
			service.upd(po);
			print("1");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			print("0:" + e.getMessage());
		}
	}

	@RequestMapping("/get")
	public String get() 
	{
		put("po",service.get(req.getLong("id")));
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/user/get.jsp";
	}
	
	@RequestMapping("/getMyInfo")
	public String getMyInfo() 
	{
		put("po",service.get(req.getLong("id")));
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/user/getMyInfo.jsp";
	}

	@RequestMapping("/query")
	public String query() 
	{
		put("queryParams",req.getParameterValueMap(false, true));
		return "/admin/user/query.jsp";
	}
	
	@RequestMapping("/query2")
	public void query2()
	{
		Map m = req.getParameterValueMap(false, true);
		result.put("total",service.getCount(m));
		result.put("rows",service.query(m));
		printJson(result.getData());
	}
	
	@RequestMapping("/getRoleTreeNodesByUserId")
	public void getRoleTreeNodesByUserId()
	{
		List<Role> userRoleData = roleService.queryByUserId(req.getLong("tc_user_id"));
		List<Role> roleData = roleService.query(null);
		List<Object> treeNodes = new ArrayList<Object>();
		
		for(int i=0; i<roleData.size(); i++)
		{
			Role o = roleData.get(i);
			for(int j=0; j<userRoleData.size(); j++)
			{
				Role o1 = userRoleData.get(j);
				if(o.getLong("id") == o1.getLong("id"))
				{
					o.set("checked", true);
				}
			}
			treeNodes.add(o.getM());
		}
		printJson(treeNodes);
	}
}