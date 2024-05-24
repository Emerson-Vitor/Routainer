package br.com.hycode.dev.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class RoutainerApplication {

	public static void main(String[] args) {
		SpringApplication.run(RoutainerApplication.class, args);
	}

}
