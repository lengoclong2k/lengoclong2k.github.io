package com.example.doan.respository;

import com.example.doan.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer>, JpaSpecificationExecutor<SanPham> {
    SanPham findByIdAndDeletedFalse(int id);

    @Query("SELECT sp from SanPham sp where  sp.tonKho>0 and sp.deleted= false order by sp.id desc ")
    List<SanPham> findByDeletedFalse();

    List<SanPham> findByThanhPhanAndDeletedFalse(String thanhphan);

    List<SanPham> findByTenLikeAndDeletedFalse(String name);

    List<SanPham> findByThuongHieuId_IdAndNhomSanPhamId_IdAndDeletedFalse(int idThuongHieu, int idNhomSP);
}