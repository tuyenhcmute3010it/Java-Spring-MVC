package vn.hoidanit.laptopshop;

import org.springframework.context.ApplicationContext;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// include >< exclude
@SpringBootApplication
public class LaptopshopApplication {

	public static void main(String[] args) {
		ApplicationContext mimicute = SpringApplication.run(LaptopshopApplication.class, args);
		// for(String s: mimicute.getBeanDefinitionNames())
		// {
		// System.out.println(s);
		// }
	}

}
