package com.example.doan.service;

import com.example.doan.entity.SanphamHasHoadon;

import java.util.List;

public interface SanPhamHasHoaDonService {
    SanphamHasHoadon findById_SanPhamIdAndId_HoaDonMuaIdAndDeleteFalse(int idSanPham, int idHoaDon);

    List<SanphamHasHoadon> findById_HoaDonMuaIdAndDeleteFalse(int idHoaDon);

    List<SanphamHasHoadon> findById_SanPhamIdAndDeleteFalse(int idSanPham);

    Boolean save(SanphamHasHoadon sanphamHasHoadon);

    Boolean remove(SanphamHasHoadon sanphamHasHoadon);
}
