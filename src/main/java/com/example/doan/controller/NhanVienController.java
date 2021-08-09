package com.example.doan.controller;

import com.example.doan.entity.AppUser;
import com.example.doan.entity.JsonResult;
import com.example.doan.entity.NhanVien;
import com.example.doan.service.NhanVienService;
import com.example.doan.utils.EncodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/nhan-vien/")
public class NhanVienController {
    @Autowired
    private NhanVienService nhanVienService;

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByIdAndDeleteFalse(@PathVariable("id") int id) {
        try {
            return JsonResult.success(nhanVienService.findByIdAndDeleteFalse(id));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-like-name/{name}")
    public ResponseEntity<JsonResult> findByNameLikeAndDeletedFalse(@PathVariable("name") String name) {
        try {
            return JsonResult.success(nhanVienService.findByNameLikeAndDeletedFalse(name));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-tk-mk/{taiKhoan}/{matKhau}")
    public ResponseEntity<JsonResult> findByTaiKhoanAndMatKhauAndDeleteFalse(@PathVariable("taiKhoan") String taiKhoan, @PathVariable("matKhau") String matKhau) {
        try {
            return JsonResult.success(nhanVienService.findByTaiKhoanAndMatKhauAndDeleteFalse(taiKhoan, matKhau));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-phone/{phoneNumber}")
    public ResponseEntity<JsonResult> findBySoDienThoaiAndDeleteFalse(@PathVariable("phoneNumber") String soDienThoai) {
        try {
            return JsonResult.success(nhanVienService.findBySoDienThoaiAndDeleteFalse(soDienThoai));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeleteFalse() {
        try {
            return JsonResult.success(nhanVienService.findByDeleteFalse());
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("remove/{idNhanVien}")
    public ResponseEntity<JsonResult> remove(@PathVariable("idNhanVien") int idNhanVien) {
        try {
            NhanVien nhanVien = nhanVienService.findByIdAndDeleteFalse(idNhanVien);
            nhanVien.setDeleted(true);
            boolean check = nhanVienService.remove(nhanVien);
            if (check)
                return JsonResult.success(nhanVien);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("login")
    public ResponseEntity<JsonResult> login(@RequestBody AppUser appUser) {
        try {
            System.out.println(appUser);
            NhanVien nhanVien = nhanVienService.findByTaiKhoanAndMatKhauAndDeleteFalse(appUser.getEmail(), EncodeUtil.getSHA256(appUser.getPass()));
            if (nhanVien != null)
                return JsonResult.success(nhanVien);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("sign")
    public ResponseEntity<JsonResult> sign(@RequestBody NhanVien nhanVien) {
        try {
            String newPass = EncodeUtil.getSHA256(nhanVien.getMatKhau());
            nhanVien.setMatKhau(newPass);
            boolean check = nhanVienService.save(nhanVien);
            if (check)
                return JsonResult.success(nhanVien);
            else return JsonResult.badRequest("Đăng ký thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save/{validate}")
    public ResponseEntity<JsonResult> save(@RequestBody NhanVien nhanVien,
                                           @PathVariable("validate") String validate) {
        try {
            if (validate.equals("0")){
                nhanVien.setMatKhau(EncodeUtil.getSHA256(nhanVien.getMatKhau()));
            }
            boolean check = nhanVienService.save(nhanVien);
            System.out.println(nhanVien);
            if (check)
                return JsonResult.success(nhanVien);
            else return JsonResult.badRequest("Lưu thất bại");
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
