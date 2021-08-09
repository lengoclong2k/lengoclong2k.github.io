package com.example.doan.respository;

import com.example.doan.entity.HoaDonMua;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface HoaDonMuaRepository extends JpaRepository<HoaDonMua, Integer>, JpaSpecificationExecutor<HoaDonMua> {
    HoaDonMua findByIdAndDeletedFalse(int id);
    List<HoaDonMua> findByIdLikeAndDeletedFalseOrderByIdDesc(int id);
    List<HoaDonMua> findByDeletedFalseOrderByIdDesc();
    List<HoaDonMua> findByTinhTrangAndDeletedFalse(boolean tinhTrang);
    List<HoaDonMua> findByNgayTaoAndDeletedFalse(LocalDate date);
    List<HoaDonMua> findByNgayTaoBetweenAndDeletedFalse(LocalDate date1,LocalDate localDate2);

}