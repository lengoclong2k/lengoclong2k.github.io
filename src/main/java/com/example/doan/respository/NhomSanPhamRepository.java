package com.example.doan.respository;

import com.example.doan.entity.NhomSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhomSanPhamRepository extends JpaRepository<NhomSanPham, Integer>, JpaSpecificationExecutor<NhomSanPham> {
    NhomSanPham findByIdAndDeletedFalse(int id);

    List<NhomSanPham> findByDeletedFalse();

    List<NhomSanPham> findByTenLikeAndDeletedFalse(String name);

}