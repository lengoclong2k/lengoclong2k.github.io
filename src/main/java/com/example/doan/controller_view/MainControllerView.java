package com.example.doan.controller_view;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainControllerView {
    @RequestMapping(value = {"admin", "admin-home", ""}, method = RequestMethod.GET)
    public String home(Model model) {
        return "admin-trang-chu";
    }

    @RequestMapping(value = {"admin-nhan-vien"}, method = RequestMethod.GET)
    public String nhanVien(Model model) {
        return "admin-nhan-vien";
    }

    @RequestMapping(value = {"admin-nhom-san-pham"}, method = RequestMethod.GET)
    public String nhomSanPham(Model model) {
        return "admin-nhom-san-pham";
    }

    @RequestMapping(value = {"admin-san-pham"}, method = RequestMethod.GET)
    public String sanPham(Model model) {
        return "admin-san-pham";
    }

    @RequestMapping(value = {"admin-thuong-hieu"}, method = RequestMethod.GET)
    public String thuongHieu(Model model) {
        return "admin-thuong-hieu";
    }

    @RequestMapping(value = {"admin-login"}, method = RequestMethod.GET)
    public String login(Model model) {
        return "admin-login";
    }

    @RequestMapping(value = {"admin-gio-hang"}, method = RequestMethod.GET)
    public String gioHang(Model model) {
        return "admin-gio-hang";
    }

    @RequestMapping(value = {"admin-hoa-don-da-thanh-toan"}, method = RequestMethod.GET)
    public String hoaDonDaThanhToan(Model model) {
        return "admin-hoa-don-da-thanh-toan";
    }

    @RequestMapping(value = {"admin-bao-cao"}, method = RequestMethod.GET)
    public String baoCao(Model model) {
        return "admin-bao-cao";
    }
}
