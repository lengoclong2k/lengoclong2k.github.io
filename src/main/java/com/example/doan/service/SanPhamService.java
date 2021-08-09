package com.example.doan.service;

import com.example.doan.entity.SanPham;

import java.util.List;

public interface SanPhamService {
    SanPham findByIdAndDeleteFalse(int id);
    List<SanPham> findByDeleteFalse();
    List<SanPham> findByThanhPhan(String thanhphan);
    SanPham save(SanPham sanPham);
    SanPham remove(SanPham sanPham);
    List<SanPham> findByTenLikeAndDeletedFalse(String name);
}
