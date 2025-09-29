package com.cognizant.healthCare.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan("com")
public class PharmaPaymentApplication {
	public static void main(String[] args) {
		SpringApplication.run(PharmaPaymentApplication.class, args);
	}
}
