package com.example.doan.controller;

import com.example.doan.entity.JsonResult;
import com.example.doan.entity.KhachHang;
import com.example.doan.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/public/khach-hang/")
public class KhachHangController {
    @Autowired
    private KhachHangService khachHangService;

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByIdAndDeleteTrue(@PathVariable("id") int id) {
        try {
            return JsonResult.success(khachHangService.findByIdAndDeleteFalse(id));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeleteFalse() {
        try {
            return JsonResult.success(khachHangService.findByDeleteFalse());
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-so-dien-thoai/{soDienThoai}")
    public ResponseEntity<JsonResult> findBySoDienThoaiAndDeleteFalse(@PathVariable("soDienThoai") String soDienThoai) {
        try {
            return JsonResult.success(khachHangService.findBySoDienThoaiAndDeleteFalse(soDienThoai));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-email/{email}")
    public ResponseEntity<JsonResult> findByEmailAndDeleteFalse(@PathVariable("email") String email) {
        try {
            return JsonResult.success(khachHangService.findByEmailAndDeleteFalse(email));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save")
    public ResponseEntity<JsonResult> save(@RequestBody KhachHang khachHang) {
        try {
            return JsonResult.success(khachHangService.save(khachHang));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("remove/{id}")
    public ResponseEntity<JsonResult> remove(@PathVariable("id") int id) {
        try {
            KhachHang khachHang = khachHangService.findByIdAndDeleteFalse(id);
            return JsonResult.success(khachHangService.remove(khachHang));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
