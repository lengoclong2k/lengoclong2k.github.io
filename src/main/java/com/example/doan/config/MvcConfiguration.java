package com.example.doan.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.example.doan")
public class MvcConfiguration implements WebMvcConfigurer {
//    @Bean
//    public WebMvcConfigurer corsConfigurer() {
//        return new WebMvcConfigurerAdapter() {
//            @Override
//            public void addCorsMappings(CorsRegistry registry) {
//                registry.addMapping("/api/**")
//                        .allowedOrigins("*")
//                        .allowedMethods("PUT", "DELETE", "GET", "POST")
//                        .allowedHeaders("*")
//                        .exposedHeaders("Content-Type","Authorization")
//                        .allowCredentials(false)
//                        .maxAge(3600);
//            }
//        };
//    }
    @Bean(name = "viewResolver")
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedMethods("*").allowedOrigins("*");
            }
        };
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new ApiLogger()).addPathPatterns("/api/**");
    }

    //cau hinh file xml
    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions("/WEB-INF/tiles.xml");
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }

    @Override // phan giai view
    public void configureViewResolvers(ViewResolverRegistry registry) {
        TilesViewResolver viewResolver = new TilesViewResolver();
        registry.viewResolver(viewResolver);
    }

    @Override // cau hinh duong dan tinh
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/admin/**")
                .addResourceLocations("classpath:/admin/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/admin/js/");
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/admin/css/");
        registry.addResourceHandler("/ajax/**")
                .addResourceLocations("classpath:/admin/js/ajax");
        registry.addResourceHandler("/libs_js/**")
                .addResourceLocations("classpath:/admin/js/libs_js");
        registry.addResourceHandler("/image/**")
                .addResourceLocations("classpath:/admin/image/");
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");

    }
}
