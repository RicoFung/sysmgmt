package common;

import admin.service.AppService;
import admin.service.MenuService;
import admin.service.PermitService;
import admin.service.RoleService;
import chok.devwork.BeanFactory;

public class Factory
{
	public static AppService getAppService(){return (AppService) BeanFactory.getBean("appService");}
	public static MenuService getMenuService(){return (MenuService) BeanFactory.getBean("menuService");}
	public static PermitService getPermitService(){return (PermitService) BeanFactory.getBean("permitService");}
	public static RoleService getRoleService(){return (RoleService) BeanFactory.getBean("roleService");}
}
