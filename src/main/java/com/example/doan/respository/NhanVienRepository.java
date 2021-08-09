package com.example.doan.respository;

import com.example.doan.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Integer>, JpaSpecificationExecutor<NhanVien> {
    NhanVien findByIdAndDeletedFalse(int id);

    NhanVien findByTaiKhoanAndMatKhauAndDeletedFalse(String taiKhoan, String matKhau);

    NhanVien findBySoDienThoaiAndDeletedFalse(String soDienThoai);

    List<NhanVien> findByDeletedFalse();

    NhanVien findByTaiKhoanAndDeletedFalse(String taiKhoan);

    List<NhanVien> findByNameLikeAndDeletedFalse(String name);
}