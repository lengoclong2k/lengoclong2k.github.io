package com.example.doan.service;

import com.example.doan.entity.NhomSanPham;

import java.util.List;

public interface NhomSanPhamService {
    NhomSanPham findByIdAndDeleteFalse(int id);
    List<NhomSanPham> findByDeleteFalse();
    List<NhomSanPham> findByTenLikeAndDeleteFalse(String name);
    Boolean save(NhomSanPham nhomSanPham);
    Boolean remove(NhomSanPham nhomSanPham);
}
