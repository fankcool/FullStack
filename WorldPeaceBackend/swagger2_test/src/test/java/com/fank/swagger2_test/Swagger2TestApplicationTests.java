package com.fank.swagger2_test;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.*;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.event.annotation.AfterTestClass;
import org.springframework.test.context.event.annotation.BeforeTestClass;

@Slf4j
@SpringBootTest
class Swagger2TestApplicationTests {

    /**
     * @BeforeAll和@AfterAll 在测试类加载的开始和结束时运行，必须为静态方法
     * @Before和@After 则在每个测试方法开始之前和结束之后运行
     * @Ignore 忽略的测试方法，只在测试类的时候生效，单独执行该测试方法无效
     */
    @Test
    void contextLoads() {
        log.error("contextLoads");
    }

    @BeforeAll
    public static void beforeClassTest() {
        log.error("beforeClassTest");
    }

    @BeforeEach
    public void beforeEach() {
        log.error("beforeEach");
    }

    @Test
    public void test() {
        log.error("test test test");
    }

    @AfterEach
    public void afterEach() {
        log.error("afterEach");
    }

    @AfterAll
    public static void afterTestClass() {
        log.error("afterTestClass");
    }
}
