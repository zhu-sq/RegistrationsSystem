package com.javen.testmybatis;


import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

//这个必须使用junit4.9以上才有
@RunWith(SpringJUnit4ClassRunner.class)
//单元测试的时候真实的开启一个web服务
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:spring-mvc.xml","classpath:spring-mybatis.xml"})
public class ShiftTest extends AbstractJUnit4SpringContextTests {
}
