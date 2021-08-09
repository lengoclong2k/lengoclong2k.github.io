package com.example.doan.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "nhan_vien")
public class NhanVien implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "tuoi", nullable = false)
    private Integer tuoi;

    @Column(name = "dia_chi", nullable = false)
    private String diaChi;

    @Column(name = "so_dien_thoai", nullable = false)
    private String soDienThoai;

    @Column(name = "tai_khoan", nullable = false)
    private String taiKhoan;

    @Column(name = "mat_khau", nullable = false,columnDefinition = "MEDIUMTEXT")
    private String matKhau;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;
    @Column(name = "admin", nullable = false)
    private Boolean admin;

}
