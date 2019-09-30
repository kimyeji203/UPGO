package com.inhatc.spring;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value= {"com.inhatc.spring.comm.mapper","com.inhatc.spring.prod.mapper"})
public class UpgoApplication {

	public static void main(String[] args) {
		SpringApplication.run(UpgoApplication.class, args);
	}

}
