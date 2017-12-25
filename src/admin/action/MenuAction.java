package admin.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.entity.Menu;
import admin.service.AppService;
import admin.service.MenuService;
import chok.devwork.BaseController;
import chok.util.CollectionUtil;

@Scope("prototype")
@Controller
@RequestMapping("/admin/menu")
public class MenuAction extends BaseController<Menu>
{
	@Autowired
	private MenuService service;
	@Autowired
	private AppService appService;
	
	@RequestMapping("/add")
	public String add() 
	{
		put("queryParams", req.getParameterValueMap(false, true));
		return "/admin/menu/add.jsp";
	}
	@RequestMapping("/add2")
	public void add2(Menu po) 
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
		put("po", service.get(req.getLong("id")));
		put("queryParams", req.getParameterValueMap(false, true));
		return "/admin/menu/upd.jsp";
	}
	@RequestMapping("/upd2")
	public void upd2(Menu po) 
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
		put("po", service.get(req.getLong("id")));
		put("queryParams", req.getParameterValueMap(false, true));
		return "/admin/menu/get.jsp";
	}

	@RequestMapping("/query")
	public String query() 
	{
		put("queryParams",req.getParameterValueMap(false, true));
		put("appList", appService.query(null));
		return "/admin/menu/query.jsp";
	}
	
	@RequestMapping("/query2")
	public void query2()
	{
		Map<String, Object> m = req.getParameterValueMap(false, true);
		result.put("total", service.getCount(m));
		result.put("rows", service.query(m));
		printJson(result.getData());
	}
}