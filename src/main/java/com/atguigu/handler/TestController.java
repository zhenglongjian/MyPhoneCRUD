package com.atguigu.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.Customers;
import com.atguigu.service.CustomersService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class TestController {
    
    @Autowired
    CustomersService customersService;
    
    @RequestMapping("helloworld")
    public String index() {
        System.out.println("gogogo");
        return "success";
    }
    @ResponseBody
    @RequestMapping("list")
    public List<Customers> list(@RequestParam(value="pn",defaultValue="1")Integer pn) {
        PageHelper.startPage(pn, 4);
        List<Customers> list = customersService.getCustomers();
        PageInfo<Customers> info = new PageInfo<>(list,4);
        
        return list;
    }
    
}
