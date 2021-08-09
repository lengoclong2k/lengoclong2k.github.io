package com.example.doan.key;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanphamHasHoadon_Key implements Serializable {
    private static final long serialVersionUID = 1L;

    private int sanPhamId;
    private int hoaDonMuaId;
}
