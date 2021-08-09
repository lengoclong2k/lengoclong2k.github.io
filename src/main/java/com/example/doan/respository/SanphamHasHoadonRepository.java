package com.example.doan.respository;

import com.example.doan.entity.SanphamHasHoadon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanphamHasHoadonRepository extends JpaRepository<SanphamHasHoadon, Integer>, JpaSpecificationExecutor<SanphamHasHoadon> {
    SanphamHasHoadon findById_SanPhamIdAndId_HoaDonMuaIdAndDeletedFalse(int idSanPham, int idHoaDon);
    List<SanphamHasHoadon> findById_HoaDonMuaIdAndDeletedFalse(int idHoaDon);
    List<SanphamHasHoadon> findById_SanPhamIdAndDeletedFalse(int idSanPham);

}