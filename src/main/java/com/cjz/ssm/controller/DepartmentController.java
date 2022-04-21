package com.cjz.ssm.controller;

import com.cjz.ssm.bean.Department;
import com.cjz.ssm.bean.Msg;
import com.cjz.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author cjz
 * @create 2022-S{MONTH} 17$ {TIME}
 */
@Controller
public class DepartmentController {
    @Autowired
    DepartmentService service;

    @ResponseBody
    @RequestMapping("depts")
    public Msg getAllDept(){

        List<Department> departments = service.getAllDept();

        return Msg.success().add("depts",departments);
    }
}
