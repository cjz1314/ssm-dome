package com.cjz.ssm.service;

import com.cjz.ssm.bean.Department;
import com.cjz.ssm.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cjz
 * @create 2022-S{MONTH} 17$ {TIME}
 */
@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper mapper;

    public List<Department> getAllDept() {
        return mapper.selectByExample(null);
    }
}
