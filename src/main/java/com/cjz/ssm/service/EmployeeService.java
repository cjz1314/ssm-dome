package com.cjz.ssm.service;

import com.cjz.ssm.bean.Employee;
import com.cjz.ssm.bean.EmployeeExample;
import com.cjz.ssm.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cjz
 * @create 2022-S{MONTH} 16$ {TIME}
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper mapper;

    //单个删除
    public void deleteOne(int id) {
        mapper.deleteByPrimaryKey(id);
    }

    //批量删除
    public void deleteAll(List<Integer> list) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(list);
        mapper.deleteByExample(example);
    }

    //返回一是修改成功
    public int update(Employee employee) {
        if (nameExisted(employee.getEmpName())) {
            return 0;
        } else {
            mapper.updateByPrimaryKey(employee);
            return 1;
        }

    }

    public List<Employee> getAllEmployee() {
        return mapper.selectByExampleWithDept(null);
    }

    public int save(Employee e) {
        if (nameExisted(e.getEmpName()) == false) {
            mapper.insert(e);
            return 1;
        }
        return 0;

    }

    /**
     * 名字是否已经存在，存在的话就返回true不可用，不存在返回false可用
     *
     * @return
     */
    public boolean nameExisted(String name) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(name);
        long count = mapper.countByExample(example);
        return count == 1;
    }


}
