package com.fh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;







import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.base.BaseController;
import com.fh.service.system.SyUserService;
import com.fh.util.MD5;
import com.fh.util.PageData;

@Controller
@RequestMapping(value = "register")
public class RegisterCotroller extends BaseController {
	
		@Resource(name = "syuserService")
		private SyUserService syuserService;
		/**
		 * 新增
		 */
		@RequestMapping(value = "/save")
		@ResponseBody
		public Map<String, Object> save() throws Exception {
			logBefore(logger, "新增user");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			PageData pd2 = new PageData();
			pd = this.getPageData();
			pd2 = this.getPageData();
			pd = syuserService.findByEmail(pd);//根据邮箱查找
			MD5 md=new MD5();
			Random ra=new Random();
			if (pd!=null&&pd.size()>0) {//验证用户是否存在
				map.put("d", 1);
			}else{
				try {
					pd2.put("USER_ID",this.get32UUID() );//插入id
					pd2.put("DATECODE", ra.nextInt(9000)+1000);//激活码
					pd2.put("PASSWORD",md.md5(pd2.getString("PASSWORD")));//使用md5对密码加密
					syuserService.save(pd2);
					/* 成功 */
					map.put("success", "1");
					map.put("d", 0);

				} catch (Exception e) {
					e.printStackTrace();
					map.put("success", "0");
				}
			}
			return map;

		}
}
