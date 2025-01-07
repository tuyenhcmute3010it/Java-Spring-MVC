package vn.hoidanit.laptopshop;

import org.springframework.context.ApplicationContext;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// @SpringBootApplication
// include >< exclude
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class LaptopshopApplication {

	public static void main(String[] args) {

		ApplicationContext mimicute = SpringApplication.run(LaptopshopApplication.class, args);
		// for(String s: mimicute.getBeanDefinitionNames())
		// {
		// System.out.println(s);
		// }
	}

}
