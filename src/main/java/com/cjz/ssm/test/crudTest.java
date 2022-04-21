package com.cjz.ssm.test;

import com.cjz.ssm.bean.Employee;
import com.cjz.ssm.mapper.DepartmentMapper;
import com.cjz.ssm.mapper.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author cjz
 * @create 2022-S{MONTH} 15$ {TIME}
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})

public class crudTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    SqlSession sqlSession;

//    @Autowired
//    SqlSessionFactoryBean sqlSessionFactory;
    @Test
    public void fun1() {
//        ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//        EmployeeMapper employeeMapper = applicationContext.getBean(EmployeeMapper.class);
//        Employee emp = new Employee(null, "564132", "m", "123456@qq.com", 1);
//        int m = employeeMapper.insert(emp);
//        System.out.println(m);

        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uuid = UUID.randomUUID().toString().substring(0, 4) + i;
            Employee employee = new Employee(null, uuid, "m", uuid + "123456@qq.com", 2);
            mapper.insert(employee);
        }


    }
}
