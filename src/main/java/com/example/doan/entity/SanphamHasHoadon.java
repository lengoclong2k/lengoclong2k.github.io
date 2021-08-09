package com.example.doan.entity;

import com.example.doan.key.SanphamHasHoadon_Key;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "sanpham_has_hoadon")
public class SanphamHasHoadon implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private SanphamHasHoadon_Key id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @MapsId("sanPhamId") // tên của khóa ngoại trong embeddedId
    @JoinColumn(name = "san_pham_id")// khóa ngoại trong db
    private SanPham sanPham;

    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;

    @Column(name = "deleted", nullable = false)
    private Boolean deleted;

}
