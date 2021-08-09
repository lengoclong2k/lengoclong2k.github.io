package com.example.doan.service_impl;

import com.example.doan.entity.SanphamHasHoadon;
import com.example.doan.respository.SanphamHasHoadonRepository;
import com.example.doan.service.SanPhamHasHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SanPhamHasHoaDonService_Impl implements SanPhamHasHoaDonService {
    @Autowired
    private SanphamHasHoadonRepository sanphamHasHoadonRepository;

    @Override
    public SanphamHasHoadon findById_SanPhamIdAndId_HoaDonMuaIdAndDeleteFalse(int idSanPham, int idHoaDon) {
        try {
            return sanphamHasHoadonRepository.findById_SanPhamIdAndId_HoaDonMuaIdAndDeletedFalse(idSanPham, idHoaDon);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<SanphamHasHoadon> findById_HoaDonMuaIdAndDeleteFalse(int idHoaDon) {
        try {
            return sanphamHasHoadonRepository.findById_HoaDonMuaIdAndDeletedFalse(idHoaDon);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<SanphamHasHoadon> findById_SanPhamIdAndDeleteFalse(int idSanPham) {
        try {
            return sanphamHasHoadonRepository.findById_SanPhamIdAndDeletedFalse(idSanPham);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Boolean save(SanphamHasHoadon sanphamHasHoadon) {

        try {
           sanphamHasHoadonRepository.save(sanphamHasHoadon);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Boolean remove(SanphamHasHoadon sanphamHasHoadon) {
        try {
            sanphamHasHoadon.setDeleted(true);
            sanphamHasHoadonRepository.save(sanphamHasHoadon);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
