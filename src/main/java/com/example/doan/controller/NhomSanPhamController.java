package com.example.doan.controller;

import com.example.doan.entity.JsonResult;
import com.example.doan.entity.NhanVien;
import com.example.doan.entity.NhomSanPham;
import com.example.doan.service.NhomSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/public/nhom-san-pham/")
public class NhomSanPhamController {
    @Autowired
    private NhomSanPhamService nhomSanPhamService;

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByIdAndDeleteFalse(@PathVariable("id") int id) {
        try {
            return JsonResult.success(nhomSanPhamService.findByIdAndDeleteFalse(id));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeleteFalse() {
        try {
            return JsonResult.success(nhomSanPhamService.findByDeleteFalse());
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-like-name/{name}")
    public ResponseEntity<JsonResult> findByTenLikeAndDeleteFalse(@PathVariable("name") String name) {
        try {
            return JsonResult.success(nhomSanPhamService.findByTenLikeAndDeleteFalse(name));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save")
    public ResponseEntity<JsonResult> save(@RequestBody NhomSanPham nhomSanPham) {
        try {
            boolean check = nhomSanPhamService.save(nhomSanPham);
            if (check)
                return JsonResult.success(nhomSanPham);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("remove/{id}")
    public ResponseEntity<JsonResult> renive(@PathVariable("id") int id) {
        try {
            NhomSanPham nhomSanPham = nhomSanPhamService.findByIdAndDeleteFalse(id);
            boolean check = nhomSanPhamService.remove(nhomSanPham);
            if (check)
                return JsonResult.success(nhomSanPham);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
