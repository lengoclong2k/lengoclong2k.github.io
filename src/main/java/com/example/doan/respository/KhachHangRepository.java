package com.example.doan.respository;

import com.example.doan.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Integer>, JpaSpecificationExecutor<KhachHang> {
    KhachHang findByIdAndDeletedFalse(int id);
    List<KhachHang> findByDeletedFalse();
    List<KhachHang> findBySoDienThoaiLikeAndDeletedFalse(String soDienThoai);
    KhachHang findByEmailAndDeletedFalse(String email);
}