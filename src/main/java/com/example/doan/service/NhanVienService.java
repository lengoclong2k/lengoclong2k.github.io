package com.example.doan.service;

import com.example.doan.entity.NhanVien;

import java.util.List;

public interface NhanVienService {
    NhanVien findByIdAndDeleteFalse(int id);
    NhanVien findByTaiKhoanAndMatKhauAndDeleteFalse(String taiKhoan, String matKhau);
    NhanVien findBySoDienThoaiAndDeleteFalse(String soDienThoai);
    List<NhanVien> findByDeleteFalse();
    List<NhanVien> findByNameLikeAndDeletedFalse(String name);
    Boolean save(NhanVien nhanVien);
    Boolean remove(NhanVien nhanVien);
}
