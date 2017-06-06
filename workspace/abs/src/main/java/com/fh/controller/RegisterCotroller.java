package com.fh.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.base.BaseController;
import com.fh.service.system.SyUserService;
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
			pd = this.getPageData();
			Random ra=new Random();
			pd.put("USER_ID",this.get32UUID() );//插入id
			pd.put("DATECODE", ra.nextInt(10));//激活码
			try {
				syuserService.save(pd);
				/* 成功 */
				map.put("success", "1");

			} catch (Exception e) {
				e.printStackTrace();
				map.put("success", "0");
			}

			return map;

		}
}
