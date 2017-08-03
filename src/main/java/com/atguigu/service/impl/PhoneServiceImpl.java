package com.atguigu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.TableCellPhone;
import com.atguigu.bean.TableCellPhoneExample;
import com.atguigu.bean.TableCellPhoneExample.Criteria;
import com.atguigu.dao.MyStringUtils;
import com.atguigu.dao.TableCellPhoneMapper;
import com.atguigu.service.PhoneService;
import com.github.pagehelper.util.StringUtil;

@Service
public class PhoneServiceImpl implements PhoneService {

    @Autowired
    private TableCellPhoneMapper tableCellPhoneMapper;
    
    @Override
    public List<TableCellPhone> getAllPhone() {
        List<TableCellPhone> selectByExample = tableCellPhoneMapper.selectByExample(null);
        return selectByExample;
    }

    @Override
    public void addPhone(TableCellPhone tableCellPhone) {
        // TODO Auto-generated method stub
        
        int insert = tableCellPhoneMapper.insert(tableCellPhone);
        
        
    }

    @Override
    public void updatePhone(TableCellPhone tableCellPhone) {
        // TODO Auto-generated method stub
        tableCellPhoneMapper.updateByPrimaryKeySelective(tableCellPhone);
        
        //tableCellPhoneMapper.u
       // int updateByPrimaryKey = tableCellPhoneMapper.updateByPrimaryKey(tableCellPhone);
    }

    @Override
    public void deletePhone(Integer id) {
        // TODO Auto-generated method stub
        int deleteByPrimaryKey = tableCellPhoneMapper.deleteByPrimaryKey(id);
    }

    @Override
    public TableCellPhone getCellPhoneByid(Integer id) {
        TableCellPhone selectByPrimaryKey = tableCellPhoneMapper.selectByPrimaryKey(id);
        return selectByPrimaryKey;
       
    }

    @Override
    public List<TableCellPhone> getAllPhoneByCondition(String condition) {
        // TODO Auto-generated method stub
        TableCellPhoneExample example = new TableCellPhoneExample();
        if("".equals(condition)){
            example = null;
        }else{
            Criteria createCriteria = example.createCriteria();
            Criteria createCriteria1 = example.createCriteria();
            Criteria createCriteria2= example.createCriteria();
            Criteria createCriteria3 = example.createCriteria();
            if(MyStringUtils.isInteger(condition)){
                createCriteria.andPhoneIdEqualTo(Integer.valueOf(condition));
            }
            if(MyStringUtils.isDouble(condition)){
                createCriteria2.andPhonePriceBetween(Double.valueOf(condition)-500, Double.valueOf(condition)+500);
            }
            createCriteria1.andPhoneColorLike("%"+condition+"%");
            createCriteria3.andPhoneNameLike("%"+condition+"%");
            example.or(createCriteria1);
            example.or(createCriteria2);
            example.or(createCriteria3);
        }
        List<TableCellPhone> selectByExample = tableCellPhoneMapper.selectByExample(example);
        return selectByExample;
    }

    @Override
    public void deleteMuchByids(List<Integer> list) {
        // TODO Auto-generated method stub
        tableCellPhoneMapper.deleteMuchbyids(list);
        
    }
    
    

    
    
}
