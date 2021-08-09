package com.example.doan.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "san_pham")
public class SanPham implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ten", nullable = false)
    private String ten;

    @Column(name = "gia_ban_le", nullable = false)
    private Float giaBanLe;

    @Column(name = "gia_nhap", nullable = false)
    private Float giaNhap;

    @Column(name = "so_luong_nhap", nullable = false)
    private Integer soLuongNhap;

    @Column(name = "da_ban", nullable = false)
    private Integer daBan;
    @Column(name = "ton_kho", nullable = false)
    private Integer tonKho;

    @Column(name = "xuat_xu", nullable = false)
    private String xuatXu;

    @Column(name = "thanh_phan", nullable = false)
    private String thanhPhan;

    @Column(name = "cach_su_dung", nullable = false)
    private String cachSuDung;

    @Column(name = "khoi_luong", nullable = false)
    private Integer khoiLuong;

    @Column(name = "thong_tin_chi_tiet", nullable = false,columnDefinition = "MEDIUMTEXT")
    private String thongTinChiTiet;

    /**
     * theo phan tram
     */
    @Column(name = "phan_tram_giam_gia", nullable = false)
    private Integer phanTramGiamGia;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "thuong_hieu_id",nullable = false)
    private ThuongHieu thuongHieuId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "nhom_san_pham_id",nullable = false)
    private NhomSanPham nhomSanPhamId;

    @Column(name = "anh_san_pham", nullable = false)
    private String anhSanPham;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

}
