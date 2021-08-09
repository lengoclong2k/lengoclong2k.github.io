package com.example.doan.service_impl;

import com.example.doan.entity.HoaDonMua;
import com.example.doan.respository.HoaDonMuaRepository;
import com.example.doan.service.HoaDonMuaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@Service
public class HoaDonMuaService_Impl implements HoaDonMuaService {
    @Autowired
    private HoaDonMuaRepository hoaDonMuaRepository;


    @Override
    public HoaDonMua findByIdAndDeleteFalse(int id) {
        try {
            return hoaDonMuaRepository.findByIdAndDeletedFalse(id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<HoaDonMua> findByDeleteFalse() {
        try {
            return hoaDonMuaRepository.findByDeletedFalseOrderByIdDesc();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<HoaDonMua> findByIdLikeAndDeletedFalseOrderByIdDesc(int id) {
        try {
            return hoaDonMuaRepository.findByIdLikeAndDeletedFalseOrderByIdDesc(id);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<HoaDonMua> findByTinhTrangAndDeleteFalse(boolean tinhTrang) {
        try {
            return hoaDonMuaRepository.findByTinhTrangAndDeletedFalse(tinhTrang);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<HoaDonMua> findByNgayTaoAndDeletedFalse(LocalDate date) {
        try {
            return hoaDonMuaRepository.findByNgayTaoAndDeletedFalse(date);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<HoaDonMua> findByNgayTaoBetweenAndDeletedFalse(LocalDate date1, LocalDate localDate2) {
        try {
            return hoaDonMuaRepository.findByNgayTaoBetweenAndDeletedFalse(date1,localDate2);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Boolean save(HoaDonMua hoaDonMua) {
        try {
            hoaDonMuaRepository.save(hoaDonMua);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Boolean remove(HoaDonMua hoaDonMua) {
        try {
            hoaDonMua.setDeleted(true);
            hoaDonMuaRepository.save(hoaDonMua);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
