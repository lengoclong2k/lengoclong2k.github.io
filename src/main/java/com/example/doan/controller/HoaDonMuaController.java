package com.example.doan.controller;

import com.example.doan.entity.HoaDonMua;
import com.example.doan.entity.JsonResult;
import com.example.doan.entity.KhachHang;
import com.example.doan.entity.NhanVien;
import com.example.doan.service.HoaDonMuaService;
import com.example.doan.service.KhachHangService;
import com.example.doan.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@RestController
@RequestMapping("api/v1/public/hoa-don-mua/")
public class HoaDonMuaController {
    @Autowired
    private HoaDonMuaService hoaDonMuaService;
    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private NhanVienService nhanVienService;

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByIdAndDeleteFalse(@PathVariable("id") int id) {
        try {
            return JsonResult.success(hoaDonMuaService.findByIdAndDeleteFalse(id));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-like-id/{id}")
    public ResponseEntity<JsonResult> findByIdLikeAndDeletedFalseOrderByIdDesc(@PathVariable("id") int id) {
        try {
            return JsonResult.success(hoaDonMuaService.findByIdLikeAndDeletedFalseOrderByIdDesc(id));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeleteFalse() {
        try {
            return JsonResult.success(hoaDonMuaService.findByDeleteFalse());
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-tinh-trang/{tinhTrang}")
    public ResponseEntity<JsonResult> findByTinhTrangAndDeleteFalse(@PathVariable("tinhTrang") boolean tinhTrang) {
        try {
            return JsonResult.success(hoaDonMuaService.findByTinhTrangAndDeleteFalse(tinhTrang));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-ngay-tao/{date}")
    public ResponseEntity<JsonResult> findByNgayTaoHoaDOon(@PathVariable("date") String date) {
        try {
            LocalDate localDate = LocalDate.parse(date);
            return JsonResult.success(hoaDonMuaService.findByNgayTaoAndDeletedFalse(localDate));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-ngay-tao-between/{date}/{date2}")
    public ResponseEntity<JsonResult> findByNgayTaoHoaDOon(@PathVariable("date") String date,
                                                           @PathVariable("date2") String date2) {
        try {
            LocalDate localDate = LocalDate.parse(date);
            LocalDate localDate2 = LocalDate.parse(date2);
            return JsonResult.success(hoaDonMuaService.findByNgayTaoBetweenAndDeletedFalse(localDate,localDate2));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save/{idNhanVien}/{idKhachHang}")
    public ResponseEntity<JsonResult> findByTinhTrangAndDeleteFalse(@PathVariable("idNhanVien") int idNhanVien,
                                                                    @PathVariable("idKhachHang") int idKhachHang,
                                                                    @RequestBody HoaDonMua hoaDonMua) {
        try {
//            KhachHang khachHang1 = khachHangService.findBySoDienThoaiAndDeleteFalse(khachHang.getSoDienThoai());
//            if (khachHang1 == null) {
//                khachHang1 = khachHangService.save(khachHang);
//            }
            KhachHang khachHang = khachHangService.findByIdAndDeleteFalse(idKhachHang);
            NhanVien nhanVien = nhanVienService.findByIdAndDeleteFalse(idNhanVien);
            hoaDonMua.setKhachHangId(khachHang);
            hoaDonMua.setNhanVienId(nhanVien);
            hoaDonMua.setNgayTao(LocalDate.now());
            boolean check = hoaDonMuaService.save(hoaDonMua);
            if (check)
                return JsonResult.success(hoaDonMua);
            else return JsonResult.badRequest("Luu hoa don that bai");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("remove/{idHoaDon}")
    public ResponseEntity<JsonResult> findByTinhTrangAndDeleteFalse(@PathVariable("idHoaDon") int idHoaDon) {

        try {
            HoaDonMua hoaDonMua = hoaDonMuaService.findByIdAndDeleteFalse(idHoaDon);
            boolean check = hoaDonMuaService.remove(hoaDonMua);
            if (check)
                return JsonResult.success(hoaDonMua);
            else return JsonResult.badRequest("Luu hoa don that bai");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

}
