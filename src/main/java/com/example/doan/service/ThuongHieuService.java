package com.example.doan.service;

import com.example.doan.entity.ThuongHieu;

import java.util.List;

public interface ThuongHieuService {
    ThuongHieu findByIdAndDeleteFalse(int id);
    List<ThuongHieu> findByDeleteFalse();
    List<ThuongHieu> findByTenLikeAndDeleteFalse(String name);
    Boolean save(ThuongHieu thuongHieu);
    Boolean remove(ThuongHieu thuongHieu);
}
