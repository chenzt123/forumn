package com.hynetwork;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


//@EnableEurekaServer
@SpringBootApplication
public class ForumApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ForumApplication.class, args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ForumApplication.class);
    }
    @Bean
    public InternalResourceViewResolver setupViewResolver(){

        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;

    }
}
