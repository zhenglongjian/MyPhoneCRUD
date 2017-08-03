package com.atguigu.dao;

import com.atguigu.bean.TableCellPhone;
import com.atguigu.bean.TableCellPhoneExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TableCellPhoneMapper {
    long countByExample(TableCellPhoneExample example);

    int deleteByExample(TableCellPhoneExample example);

    int deleteByPrimaryKey(Integer phoneId);

    int insert(TableCellPhone record);

    int insertSelective(TableCellPhone record);

    List<TableCellPhone> selectByExample(TableCellPhoneExample example);

    TableCellPhone selectByPrimaryKey(Integer phoneId);

    int updateByExampleSelective(@Param("record") TableCellPhone record, @Param("example") TableCellPhoneExample example);

    int updateByExample(@Param("record") TableCellPhone record, @Param("example") TableCellPhoneExample example);

    int updateByPrimaryKeySelective(TableCellPhone record);

    int updateByPrimaryKey(TableCellPhone record);
    
    int deleteMuchbyids(@Param("list")List<Integer> list);
}