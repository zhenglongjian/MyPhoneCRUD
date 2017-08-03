package com.atguigu.service;

import java.util.List;

import org.hibernate.validator.internal.util.privilegedactions.GetClassLoader;

import com.atguigu.bean.TableCellPhone;


public interface PhoneService  {
    
   public List<TableCellPhone> getAllPhone();
   
   public void addPhone(TableCellPhone tableCellPhone);
   
   public void updatePhone(TableCellPhone tableCellPhone);
   
   public void deletePhone(Integer id);
   
   public TableCellPhone getCellPhoneByid(Integer id);
   
   
   public List<TableCellPhone> getAllPhoneByCondition(String condition);
   
   public void deleteMuchByids(List<Integer> list);
}
