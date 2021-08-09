package com.example.doan.security;

import com.example.doan.entity.NhanVien;
import com.example.doan.respository.NhanVienRepository;
import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@Order(1)
public class JWTAuthorizationFilter implements Filter {

    private NhanVienRepository nhanVienRepository;

    private JWTService jwtService;

    public JWTAuthorizationFilter(NhanVienRepository nhanVienRepository, JWTService jwtService) {
        this.nhanVienRepository = nhanVienRepository;
        this.jwtService = jwtService;
    }

    //  read token và cấp quyền
    private NhanVien getAuthentication(HttpServletRequest request) {
        String token = request.getParameter("token");
        if (token != null) {
            String taiKhoan = jwtService.decode(token);
            if (taiKhoan != null) {
                NhanVien nhanVien = nhanVienRepository.findByTaiKhoanAndDeletedFalse(taiKhoan);
                if (nhanVien != null) {
                    System.out.println("User Principal: " + nhanVien.getTaiKhoan());
                    return nhanVien;
                }
            }
        }
        return null;
    }
    private boolean checkCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        try {
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("Authorization")) {
                        String email =  jwtService.decode(cookie.getValue());
                        NhanVien nhanVien= nhanVienRepository.findByTaiKhoanAndDeletedFalse(email);
                        if (nhanVien != null){
                            return true;
                        }
                    }
                }
            }
        } catch (Exception ex) {
            return false;
        }
        return false;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        try {
            if (request.getRequestURI().contains("/api/")) {
                if (request.getRequestURI().contains("/api/v1/public")) {
                    filterChain.doFilter(request, response);
                } else {
                    NhanVien appUser = getAuthentication(request);
                    if (appUser != null) {
                        if (request.getRequestURI().contains("/admin/") && !appUser.getAdmin()) {
                            response.setStatus(401);
                            return;
                        }
                        request.setAttribute("user", appUser);
                        filterChain.doFilter(request, response);
                    } else
                        response.setStatus(401);
                }
            } else if (request.getRequestURI().contains("/admin-")) {
                if (checkCookie(request)) {
                    filterChain.doFilter(request, response);
                } else {
                    filterChain.doFilter(request, response);
//                    response.sendRedirect("login");
                }
            } else {
                filterChain.doFilter(request, response);
            }
        } catch (Exception e) {
            response.setStatus(401);
        }
    }
}
