package com.example.doan.service;

import com.example.doan.entity.HoaDonMua;

import java.time.LocalDate;
import java.util.List;

public interface HoaDonMuaService {
    HoaDonMua findByIdAndDeleteFalse(int id);
    List<HoaDonMua> findByDeleteFalse();
    List<HoaDonMua> findByIdLikeAndDeletedFalseOrderByIdDesc(int id);
    List<HoaDonMua> findByTinhTrangAndDeleteFalse(boolean tinhTrang);
    List<HoaDonMua> findByNgayTaoAndDeletedFalse(LocalDate date);
    List<HoaDonMua> findByNgayTaoBetweenAndDeletedFalse(LocalDate date1,LocalDate localDate2);
    Boolean save(HoaDonMua hoaDonMua);
    Boolean remove(HoaDonMua hoaDonMua);
}
