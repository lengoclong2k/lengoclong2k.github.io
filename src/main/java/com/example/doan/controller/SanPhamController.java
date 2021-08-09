package com.example.doan.controller;

import com.example.doan.entity.JsonResult;
import com.example.doan.entity.NhomSanPham;
import com.example.doan.entity.SanPham;
import com.example.doan.entity.ThuongHieu;
import com.example.doan.respository.SanPhamRepository;
import com.example.doan.service.NhomSanPhamService;
import com.example.doan.service.SanPhamService;
import com.example.doan.service.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.spring.web.json.Json;

import java.util.List;

@RestController
@RequestMapping("api/v1/public/san-pham/")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private ThuongHieuService thuongHieuService;
    @Autowired
    private NhomSanPhamService nhomSanPhamService;

    @GetMapping("find-by-id/{id}")
    public ResponseEntity<JsonResult> findByIdAndDeleteTrue(@PathVariable("id") int id) {
        try {
            return JsonResult.success(sanPhamService.findByIdAndDeleteFalse(id));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-all")
    public ResponseEntity<JsonResult> findByDeleteTrue() {
        try {
            List<SanPham> list = sanPhamService.findByDeleteFalse();
            if (list.size() > 0) {
                list.sort(((o1, o2) -> {
                    return o2.getId() - o1.getId();
                }));
            }
            return JsonResult.success(list);
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @GetMapping("find-by-like-name/{name}")
    public ResponseEntity<JsonResult> findByLikeName(@PathVariable("name") String name) {
        try {
            List<SanPham> list = sanPhamService.findByTenLikeAndDeletedFalse(name);
            if (list.size() > 0) {
                list.sort((o1, o2) -> {
                    return o2.getId() - o1.getId();
                });
            }
            return JsonResult.success(list);
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-thuong-hieu-and-nhom-sp/{idThuongHieu}/{idNhomSP}")
    public ResponseEntity<JsonResult> findThuongHieuAndNhomSP(@PathVariable("idThuongHieu") int idThuongHieu,
                                                              @PathVariable("idNhomSP") int idNhomSP) {
        try {
            List<SanPham> list = sanPhamRepository.findByThuongHieuId_IdAndNhomSanPhamId_IdAndDeletedFalse(idThuongHieu,idNhomSP);
            if (list.size() > 0) {
                list.sort((o1, o2) -> {
                    return o2.getId() - o1.getId();
                });
            }
            return JsonResult.success(list);
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
    @GetMapping("find-by-thanh-phan/{thanhPhan}")
    public ResponseEntity<JsonResult> findByThanhPhan(@PathVariable("thanhPhan") String thanhPhan) {
        try {
            return JsonResult.success(sanPhamService.findByThanhPhan(thanhPhan));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("save/{thuongHieuId}/{nhomSanPhamId}")
    public ResponseEntity<JsonResult> save(@RequestBody SanPham sanPham,
                                           @PathVariable("thuongHieuId") int idThuongHieu,
                                           @PathVariable("nhomSanPhamId") int idNhomSanPham) {
        try {
            ThuongHieu thuongHieu = thuongHieuService.findByIdAndDeleteFalse(idThuongHieu);
            NhomSanPham nhomSanPham = nhomSanPhamService.findByIdAndDeleteFalse(idNhomSanPham);
            sanPham.setTonKho(sanPham.getSoLuongNhap()-sanPham.getDaBan());
            sanPham.setThuongHieuId(thuongHieu);
            sanPham.setNhomSanPhamId(nhomSanPham);
            return JsonResult.success(sanPhamService.save(sanPham));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }

    @PostMapping("remove/{id}")
    public ResponseEntity<JsonResult> remove(@PathVariable("id") int id) {
        try {
            SanPham sanPham = sanPhamService.findByIdAndDeleteFalse(id);
            return JsonResult.success(sanPhamService.remove(sanPham));
        } catch (Exception e) {
            return JsonResult.error(e);
        }
    }
}
