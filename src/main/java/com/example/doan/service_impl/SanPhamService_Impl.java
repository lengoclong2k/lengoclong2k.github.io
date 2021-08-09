package com.example.doan.service_impl;

import com.example.doan.entity.SanPham;
import com.example.doan.respository.SanPhamRepository;
import com.example.doan.service.SanPhamService;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamService_Impl implements SanPhamService {
    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Override
    public SanPham findByIdAndDeleteFalse(int id) {
        try {
            return sanPhamRepository.findByIdAndDeletedFalse(id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<SanPham> findByDeleteFalse() {
        try {
            return sanPhamRepository.findByDeletedFalse();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<SanPham> findByThanhPhan(String thanhphan) {
        try {
            return sanPhamRepository.findByThanhPhanAndDeletedFalse(thanhphan);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<SanPham> findByTenLikeAndDeletedFalse(String name) {
        try {
            return sanPhamRepository.findByTenLikeAndDeletedFalse("%" + name + "%");
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public SanPham save(SanPham sanPham) {
        try {
            return sanPhamRepository.save(sanPham);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public SanPham remove(SanPham sanPham) {
        try {
            sanPham.setDeleted(true);
            return sanPhamRepository.save(sanPham);
        } catch (Exception e) {
            return null;
        }
    }


}
