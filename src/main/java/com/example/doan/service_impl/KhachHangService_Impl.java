package com.example.doan.service_impl;

import com.example.doan.entity.KhachHang;
import com.example.doan.respository.KhachHangRepository;
import com.example.doan.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangService_Impl implements KhachHangService {
    @Autowired
    private KhachHangRepository khachHangRepository;

    @Override
    public KhachHang findByIdAndDeleteFalse(int id) {
        try {
            return khachHangRepository.findByIdAndDeletedFalse(id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<KhachHang> findByDeleteFalse() {
        try {
            return khachHangRepository.findByDeletedFalse();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<KhachHang> findBySoDienThoaiAndDeleteFalse(String soDienThoai) {
        try {
            return khachHangRepository.findBySoDienThoaiLikeAndDeletedFalse("%"+soDienThoai+"%");
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public KhachHang findByEmailAndDeleteFalse(String email) {
        try {
            return khachHangRepository.findByEmailAndDeletedFalse(email);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public KhachHang save(KhachHang khachHang) {
        try {
            return khachHangRepository.save(khachHang);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public KhachHang remove(KhachHang khachHang) {
        try {
            khachHang.setDeleted(true);
            return khachHangRepository.save(khachHang);
        } catch (Exception e) {
            return null;
        }
    }
}
