package com.example.doan.controller;

import com.example.doan.entity.JsonResult;
import com.example.doan.entity.ThuongHieu;
import com.example.doan.service.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/public/thuong-hieu/")
public class ThuongHieuController {
    @Autowired
    private ThuongHieuService thuongHieuService;

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByIdAndDeleteFalse(@PathVariable("id") int id) {
        try {
            return JsonResult.success(thuongHieuService.findByIdAndDeleteFalse(id));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeleteFalse() {
        try {
            return JsonResult.success(thuongHieuService.findByDeleteFalse());
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-like-name/{name}")
    public ResponseEntity<JsonResult> findByTenLikeAndDeleteFalse(@PathVariable("name") String name) {
        try {
            return JsonResult.success(thuongHieuService.findByTenLikeAndDeleteFalse(name));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save")
    public ResponseEntity<JsonResult> save(@RequestBody ThuongHieu thuongHieu) {
        try {
            boolean check = thuongHieuService.save(thuongHieu);
            if (check)
                return JsonResult.success(thuongHieu);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("remove/{id}")
    public ResponseEntity<JsonResult> remove(@PathVariable("id") int id) {
        try {
            ThuongHieu thuongHieu = thuongHieuService.findByIdAndDeleteFalse(id);
            boolean check = thuongHieuService.remove(thuongHieu);
            if (check)
               return JsonResult.success(thuongHieu);
            else return JsonResult.success(thuongHieu);
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
