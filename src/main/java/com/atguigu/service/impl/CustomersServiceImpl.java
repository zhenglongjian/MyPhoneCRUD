package com.atguigu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.Customers;
import com.atguigu.bean.CustomersExample;
import com.atguigu.bean.CustomersExample.Criteria;
import com.atguigu.dao.CustomersMapper;
import com.atguigu.service.CustomersService;

@Service
public class CustomersServiceImpl implements CustomersService {
    
    @Autowired
    CustomersMapper customersMapper;
    
    @Override
    public List<Customers> getCustomers() {
        List<Customers> list = customersMapper.selectByExample(null);
        
        return list;
    }

}
