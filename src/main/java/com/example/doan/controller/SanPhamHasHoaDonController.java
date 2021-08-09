package com.example.doan.controller;

import com.example.doan.entity.JsonResult;
import com.example.doan.entity.SanPham;
import com.example.doan.entity.SanphamHasHoadon;
import com.example.doan.key.SanphamHasHoadon_Key;
import com.example.doan.service.HoaDonMuaService;
import com.example.doan.service.SanPhamHasHoaDonService;
import com.example.doan.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/sanpham-has-hoadon/")
public class SanPhamHasHoaDonController {
    @Autowired
    private SanPhamHasHoaDonService sanPhamHasHoaDonService;
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private HoaDonMuaService hoaDonMuaService;

    @GetMapping("find-by-id-has/{idSanPham}/{idHoaDon}")
    public ResponseEntity<JsonResult> findById_SanPhamIdAndId_HoaDonMuaIdAndDeleteFalse(@PathVariable("idSanPham") int idSanPham,
                                                                                        @PathVariable("idHoaDon") int idHoaDon) {
        try {
            SanphamHasHoadon sanphamHasHoadon = sanPhamHasHoaDonService.findById_SanPhamIdAndId_HoaDonMuaIdAndDeleteFalse(idSanPham, idHoaDon);
            if (sanphamHasHoadon != null)
                return JsonResult.success(sanphamHasHoadon);
            else return JsonResult.badRequest("Không có kết quả");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-id-hoadon/{idHoaDon}")
    public ResponseEntity<JsonResult> findById_HoaDonMuaIdAndDeleteFalse(@PathVariable("idHoaDon") int idHoaDon) {
        try {
            List<SanphamHasHoadon> list = sanPhamHasHoaDonService.findById_HoaDonMuaIdAndDeleteFalse(idHoaDon);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có kết quả tìm kiếm");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-id-sanpham/{idSanPham}")
    public ResponseEntity<JsonResult> findById_SanPhamIdAndDeleteFalse(@PathVariable("idSanPham") int idSanPham) {
        try {
            List<SanphamHasHoadon> list = sanPhamHasHoaDonService.findById_SanPhamIdAndDeleteFalse(idSanPham);
            if (list != null)
                return JsonResult.success(list);
            else return JsonResult.badRequest("Không có kết quả tìm kiếm");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save/{idSanPham}/{idHoaDon}")
    public ResponseEntity<JsonResult> save(@PathVariable("idSanPham") int idSanPham,
                                           @PathVariable("idHoaDon") int idHoaDon,
                                           @RequestBody SanphamHasHoadon sanphamHasHoadon) {

        try {
            SanPham sanPham = sanPhamService.findByIdAndDeleteFalse(idSanPham);
            sanPham.setDaBan(sanPham.getDaBan() + 1);
            sanPham.setTonKho(sanPham.getSoLuongNhap() - sanPham.getDaBan());
            SanPham sanPham1= sanPhamService.save(sanPham);

            SanphamHasHoadon_Key sanphamHasHoadon_key = new SanphamHasHoadon_Key(idSanPham, idHoaDon);
            sanphamHasHoadon.setId(sanphamHasHoadon_key);
            sanphamHasHoadon.setSanPham(sanPham1);
            boolean check = sanPhamHasHoaDonService.save(sanphamHasHoadon);
            if (check)
                return JsonResult.success(sanphamHasHoadon);
            else return JsonResult.badRequest("Không thể lưu");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("remove/{idSanPham}/{idHoaDon}")
    public ResponseEntity<JsonResult> remove(@PathVariable("idSanPham") int idSanPham,
                                             @PathVariable("idHoaDon") int idHoaDon) {

        try {
            SanphamHasHoadon sanphamHasHoadon = sanPhamHasHoaDonService.findById_SanPhamIdAndId_HoaDonMuaIdAndDeleteFalse(idSanPham, idHoaDon);
            boolean check = sanPhamHasHoaDonService.remove(sanphamHasHoadon);
            if (check)
                return JsonResult.success(sanphamHasHoadon);
            else return JsonResult.badRequest("Không thể lưu");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
