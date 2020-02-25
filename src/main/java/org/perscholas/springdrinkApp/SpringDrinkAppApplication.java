package org.perscholas.springdrinkApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("org.perscholas.springdrinkApp.entity")
public class SpringDrinkAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringDrinkAppApplication.class, args);
	}

}
