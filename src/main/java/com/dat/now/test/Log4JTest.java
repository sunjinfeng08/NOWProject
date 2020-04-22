package com.dat.now.test;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Log4JTest {
	@Test
	public void test() {
		Logger log = LoggerFactory.getLogger(Log4JTest.class);
		log.warn("this is message {}", 1);
		Exception ex = new Exception("this is a  message.");
		log.error("a new exeception", ex);
		log.trace("trace message.");
		log.info("info message.");
		for (int i = 0; i < 900; i++)
			log.info("debug message:{}={}", "line", i);
	}
}
