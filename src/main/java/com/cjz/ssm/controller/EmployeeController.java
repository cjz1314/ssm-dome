package com.cjz.ssm.controller;

import com.cjz.ssm.bean.Employee;
import com.cjz.ssm.bean.Msg;
import com.cjz.ssm.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author cjz
 * @create 2022-S{MONTH} 16$ {TIME}
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;


    @ResponseBody
    @RequestMapping(value = "emp/{empId}", method = RequestMethod.DELETE)
    public Msg delete(@PathVariable("empId") String empId) {
        String[] ids = empId.split("-");
        ArrayList<Integer> list = new ArrayList<>();
        for (String str : ids) {
           
            list.add(Integer.parseInt(str));
        }
        employeeService.deleteAll(list);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "emp/{empId}", method = RequestMethod.PUT)
    public Msg update(@Valid Employee employee, BindingResult result) {
        System.out.println(employee);
        if (result.hasErrors()) { //如果不符合正则表达式
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名：" + fieldError.getField());
                System.out.println("错误信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.error().add("errorFields", map);

        } else {//符合正则表达式后，判断是否已经存在
            if (employeeService.update(employee) == 1) {
                System.out.println("修改成功");
                return Msg.success();
            } else {
                Msg msg = Msg.error();
                msg.setMsg("该用户已存在");
                System.out.println("修改失败");
                return msg;
            }
        }
    }

    /**
     * 保存用户
     */
    @ResponseBody
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public Msg save(@Valid Employee employee, BindingResult result) {

        if (result.hasErrors()) { //如果不符合正则表达式
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名：" + fieldError.getField());
                System.out.println("错误信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.error().add("errorFields", map);

        } else {//符合正则表达式后，判断是否已经存在
            if (employeeService.save(employee) == 1) {
                return Msg.success();
            } else {
                Msg msg = Msg.error();
                msg.setMsg("该用户已存在");
                return msg;
            }
        }


    }


    /**
     * @param pageNum 要访问的页数，默认值设为1（当访问首页自动发送请求时不加参数）
     * @param model
     * @return
     */
//    @RequestMapping("/emps")
//    public String employeeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
//
//        //分页插件的使用，在查询前开启分页功能
//        PageHelper.startPage(pageNum, 6);
//        List<Employee> allEmployee = employeeService.getAllEmployee();
//        //查询后获取分页的数据
//        PageInfo<Employee> pageInfo = new PageInfo<Employee>(allEmployee, 5);
//        model.addAttribute("pageInfo", pageInfo);
//
//        return "list";
//    }

    /**
     * 获取分页数据
     *
     * @param pageNum
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg employeeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        //分页插件的使用，在查询前开启分页功能
        PageHelper.startPage(pageNum, 6);
        List<Employee> allEmployee = employeeService.getAllEmployee();
        //查询后获取分页的数据
        PageInfo pageInfo = new PageInfo(allEmployee, 5);
//        return pageInfo;
        return Msg.success().add("pageInfo", pageInfo);
    }
}
