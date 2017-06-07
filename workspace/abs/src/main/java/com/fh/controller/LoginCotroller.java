package com.fh.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fh.base.BaseController;
import com.fh.service.system.SyUserService;
import com.fh.service.system.menu.MenuService;
import com.fh.service.system.role.RoleService;
import com.fh.service.system.user.UserService;

@Controller
@RequestMapping("/login")
public class LoginCotroller extends BaseController {
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="roleService")
	private RoleService roleService;
	@Resource(name="syuserService")
	private SyUserService syuserService;
	
	
}
