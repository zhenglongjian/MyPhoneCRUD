package com.atguigu.handler;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.TableCellPhone;
import com.atguigu.service.PhoneService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.jdi.VoidType;

@Controller
public class PhoneController {

    @Autowired
    private PhoneService phoneService;

    @RequestMapping("/getAllPhone")
    public String getAllPhone(Model model,
            @RequestParam(value = "page",defaultValue="1", required = false) Integer page) {
        System.out.println("hehe");
       
        //一定要放在上面
        PageHelper.startPage(page,5);
        Collection<TableCellPhone> allPhone = phoneService.getAllPhone();
      //开始分页，一页有五条数据
        List<TableCellPhone> list = (List<TableCellPhone>) allPhone;
        //代表中间只显示5个页码
        PageInfo<TableCellPhone> info = new PageInfo<>(list,5);
        model.addAttribute("info", info);
        return "phone";
    }

    @RequestMapping("/addphone")
    public String addPhone(TableCellPhone tableCellPhone) {
        System.out.println(tableCellPhone);
        System.out.println("jieshodaole ");
        phoneService.addPhone(tableCellPhone);
        return "redirect:getAllPhone";
        // return "forward:getAllPhone";
    }

    @RequestMapping("/deletePhone")
    public String deletePhone(@RequestParam("id") Integer id) {
        System.out.println("jieshodaole ");
        phoneService.deletePhone(id);
        return "redirect:getAllPhone";
    }

    @RequestMapping("/updatephone")
    public String updatePhone(TableCellPhone tableCellPhone) {
        System.out.println("jieshodaolexiugai ");
        phoneService.updatePhone(tableCellPhone);
        return "redirect:getAllPhone";
    }

    @ResponseBody
    @RequestMapping("/getPhonebyid")
    public TableCellPhone getPhonebyid(@RequestParam("id") Integer id) {
        TableCellPhone cellPhoneByid = phoneService.getCellPhoneByid(id);
        return cellPhoneByid;
    }
    
    @RequestMapping("/searchPhoneBycondition")
    public String searchPhoneBycondition(Model model,@RequestParam(value = "page", defaultValue = "1", required = false) Integer page,@RequestParam(value="condition",required=false)String condition) {
        System.out.println("hehe");
        PageHelper.startPage(page, 5);
        Collection<TableCellPhone> allPhone = phoneService.getAllPhoneByCondition(condition);
        List<TableCellPhone> list = (List<TableCellPhone>) allPhone;
        PageInfo<TableCellPhone> info = new PageInfo<>(list,5);
        model.addAttribute("info", info);
        model.addAttribute("tag", "tag");
        model.addAttribute("condition", condition);
        return "phone";
    }
    
    /**
     *魔王说也可以写成多合一的方法，判断逗号的个数
     * @Description (TODO这里用一句话描述这个方法的作用)
     * @param ids
     * @return
     */
    @RequestMapping("/deletemuch")
    public String deletemuch(@RequestParam("ids")String ids){
        String[] split = ids.split(",");
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < split.length; i++) {
           list.add(Integer.valueOf(split[i]));
        }
        phoneService.deleteMuchByids(list);
        return "redirect:getAllPhone";
    }
    
}
