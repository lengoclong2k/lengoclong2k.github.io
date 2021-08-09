package com.example.doan.security;

import com.example.doan.respository.NhanVienRepository;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

import javax.annotation.Resource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Resource
    private NhanVienRepository nhanVienRepository;

    @Resource
    private JWTService jwtService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable();
        //stateless
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }

    @Bean
    public FilterRegistrationBean<JWTAuthorizationFilter> loggingFilter() {
        FilterRegistrationBean<JWTAuthorizationFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new JWTAuthorizationFilter(nhanVienRepository,jwtService));
//        registrationBean.addUrlPatterns("/api/user/*", "/api/admin/*");
//        registrationBean.addUrlPatterns("/api/v1/public/*");
        return registrationBean;
    }

}