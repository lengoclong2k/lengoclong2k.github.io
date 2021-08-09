package com.example.doan.service_impl;

import com.example.doan.entity.NhanVien;
import com.example.doan.respository.NhanVienRepository;
import com.example.doan.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhanVienService_Impl implements NhanVienService {
    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Override
    public NhanVien findByIdAndDeleteFalse(int id) {
        try {
            return nhanVienRepository.findByIdAndDeletedFalse(id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public NhanVien findByTaiKhoanAndMatKhauAndDeleteFalse(String taiKhoan, String matKhau) {
        try {
            return nhanVienRepository.findByTaiKhoanAndMatKhauAndDeletedFalse(taiKhoan, matKhau);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public NhanVien findBySoDienThoaiAndDeleteFalse(String soDienThoai) {
        try {
            return nhanVienRepository.findBySoDienThoaiAndDeletedFalse(soDienThoai);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<NhanVien> findByDeleteFalse() {
        try {
            return nhanVienRepository.findByDeletedFalse();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<NhanVien> findByNameLikeAndDeletedFalse(String name) {
        try {
            return nhanVienRepository.findByNameLikeAndDeletedFalse("%" + name + "%");
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Boolean save(NhanVien nhanVien) {
        try {
            nhanVienRepository.save(nhanVien);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Boolean remove(NhanVien nhanVien) {
        try {
            nhanVien.setDeleted(true);
            nhanVienRepository.save(nhanVien);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
