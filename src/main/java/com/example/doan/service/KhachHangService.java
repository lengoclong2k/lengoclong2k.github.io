package com.example.doan.service;

import com.example.doan.entity.KhachHang;

import java.util.List;

public interface KhachHangService {
    KhachHang findByIdAndDeleteFalse(int id);
    List<KhachHang> findByDeleteFalse();
    List<KhachHang> findBySoDienThoaiAndDeleteFalse(String soDienThoai);
    KhachHang findByEmailAndDeleteFalse(String email);
    KhachHang save(KhachHang khachHang);
    KhachHang remove(KhachHang khachHang);
}
