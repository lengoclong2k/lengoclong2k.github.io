package com.example.doan.service_impl;

import com.example.doan.entity.NhomSanPham;
import com.example.doan.respository.NhomSanPhamRepository;
import com.example.doan.service.NhomSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhomSanPhamService_Impl implements NhomSanPhamService {
    @Autowired
    private NhomSanPhamRepository nhomSanPhamRepository;

    @Override
    public NhomSanPham findByIdAndDeleteFalse(int id) {
        try {
            return nhomSanPhamRepository.findByIdAndDeletedFalse(id);
        } catch (Exception ee) {
            return null;
        }
    }

    @Override
    public List<NhomSanPham> findByDeleteFalse() {
        try {
            return nhomSanPhamRepository.findByDeletedFalse();
        } catch (Exception ee) {
            return null;
        }
    }

    @Override
    public List<NhomSanPham> findByTenLikeAndDeleteFalse(String name) {
        try {
            return nhomSanPhamRepository.findByTenLikeAndDeletedFalse("%"+name+"%");
        } catch (Exception ee) {
            return null;
        }
    }

    @Override
    public Boolean save(NhomSanPham nhomSanPham) {
        try {
            nhomSanPhamRepository.save(nhomSanPham);
            return true;
        } catch (Exception ee) {
            return null;
        }
    }

    @Override
    public Boolean remove(NhomSanPham nhomSanPham) {
        try {
            nhomSanPham.setDeleted(true);
            nhomSanPhamRepository.save(nhomSanPham);
            return true;
        } catch (Exception ee) {
            return null;
        }
    }
}
