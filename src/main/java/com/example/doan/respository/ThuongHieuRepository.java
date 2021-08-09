package com.example.doan.respository;

import com.example.doan.entity.ThuongHieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, Integer>, JpaSpecificationExecutor<ThuongHieu> {
    ThuongHieu findByIdAndDeletedFalse(int id);
    List<ThuongHieu> findByDeletedFalse();
    List<ThuongHieu> findByTenLikeAndDeletedFalse(String name);
}