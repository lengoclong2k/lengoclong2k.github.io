package com.example.doan.service_impl;

import com.example.doan.entity.ThuongHieu;
import com.example.doan.respository.ThuongHieuRepository;
import com.example.doan.service.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ThuongHieuService_Impl implements ThuongHieuService {
    @Autowired
    private ThuongHieuRepository thuongHieuRepository;

    @Override
    public ThuongHieu findByIdAndDeleteFalse(int id) {
        try {
            return thuongHieuRepository.findByIdAndDeletedFalse(id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<ThuongHieu> findByDeleteFalse() {
        try {
            return thuongHieuRepository.findByDeletedFalse();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<ThuongHieu> findByTenLikeAndDeleteFalse(String name) {
        try {
            return thuongHieuRepository.findByTenLikeAndDeletedFalse("%" + name + "%");
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Boolean save(ThuongHieu thuongHieu) {
        try {
            thuongHieuRepository.save(thuongHieu);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Boolean remove(ThuongHieu thuongHieu) {
        try {
            thuongHieu.setDeleted(true);
            thuongHieuRepository.save(thuongHieu);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
