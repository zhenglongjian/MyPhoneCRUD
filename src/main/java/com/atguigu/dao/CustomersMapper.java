package com.atguigu.dao;

import com.atguigu.bean.Customers;
import com.atguigu.bean.CustomersExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomersMapper {
    long countByExample(CustomersExample example);

    int deleteByExample(CustomersExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Customers record);

    int insertSelective(Customers record);

    List<Customers> selectByExampleWithBLOBs(CustomersExample example);

    List<Customers> selectByExample(CustomersExample example);

    Customers selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Customers record, @Param("example") CustomersExample example);

    int updateByExampleWithBLOBs(@Param("record") Customers record, @Param("example") CustomersExample example);

    int updateByExample(@Param("record") Customers record, @Param("example") CustomersExample example);

    int updateByPrimaryKeySelective(Customers record);

    int updateByPrimaryKeyWithBLOBs(Customers record);

    int updateByPrimaryKey(Customers record);
}