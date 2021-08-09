package com.example.doan.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

@Data
@Entity
@Table(name = "hoa_don_mua")
public class HoaDonMua implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ngay_tao", nullable = false)
    private LocalDate ngayTao;


    @Column(name = "tong_tien", nullable = false)
    private Double tongTien;

    @Column(name = "phi_van_chuyen", nullable = false)
    private Float phiVanChuyen;

    @Column(name = "ghi_chu", nullable = false)
    private String ghiChu;

    @Column(name = "tinh_trang", nullable = false)
    private Boolean tinhTrang;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "nhan_vien_id",nullable = false)
    private NhanVien nhanVienId;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "khach_hang_id",nullable = false)
    private KhachHang khachHangId;
}

