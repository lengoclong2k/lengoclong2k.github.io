$(function () {
    checkLogin();
    let listProduct = getItemLocalStorage("listIdProduct");

    var ViewModelGioHang = function (listProduct) {
        let self = this;
        self.showModal = ko.observable(true);
        self.showInforUser = ko.observable(false);
        self.userOld = ko.observable(false);
        self.resultFindSDT = ko.observable();
        self.checkSubmit = ko.observable(false);
        self.hoVaTen = ko.observable();
        self.diaChiEmail = ko.observable();
        self.diaChi = ko.observable();
        self.soDienThoai = ko.observable();
        self.ghiChu = ko.observable();
        self.idProdct = ko.observable();
        self.nameProduct = ko.observable();
        self.giaTien = ko.observable();
        self.soLuong = ko.observable();
        self.tongTienMoiSP = ko.observable();
        self.tongTienTatCa = ko.observable();
        self.listPrd = ko.observableArray(listProduct);
        // tính tổng tiền
        let tong = 0;
        listProduct.map(item => {

            tong += item.soLuong * item.giaTien;
        })

        tong = formatNumber(tong, ".", ".");

        self.tongTienTatCa(tong);

        self.closeSubWinDow = function (id) {
            $('#block-edit').modal('hide');
            self.showModal(false);
        }
        self.btnSaveNew = function () {
            // làm màu
        }
        // validate
        $("#bootstrapForm").bind().submit(function (event) {
            var vForm = $(this);
            if (vForm[0].checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();

            } else {
                // validate form xong xem chạy vào đây
                // thay đổi trạng thái của check
                let result = confirm('Bạn có chắc chắn muốn lưu?', setTimeout(1000));
                if (result)
                    self.checkSubmit(true);
                else self.checkSubmit(false);
            }
            // Add bootstrap 4 was-validated classes to trigger validation messages
            vForm.addClass('was-validated');
        })
        self.checkSubmit.subscribe(function (value) {
            if (value) {
                let khachHang = {
                    "deleted": false,
                    "diaChi": self.diaChi(),
                    "email": self.diaChiEmail(),
                    "soDienThoai": self.soDienThoai(),
                    "tenKhacHang": self.hoVaTen()
                }
                let hoaDonMua = {
                    "deleted": false,
                    "ghiChu": self.ghiChu() == null ? " " : self.ghiChu(),
                    "phiVanChuyen": 0,
                    "tinhTrang": true,
                    "tongTien": parseFloat(self.tongTienTatCa().replaceAll(".", ""))
                }

                ajaxCallPost("khach-hang/save", khachHang).then(rs => {
                    console.log(rs)
                    ajaxCallPost("hoa-don-mua/save/" + getItemLocalStorage("user").data.id + "/" + rs.data.id, hoaDonMua).then(rs1 => {
                        console.log(rs1)
                        let listIdProduct = getItemLocalStorage("listIdProduct");
                        listIdProduct.map(item => {
                            let sanPhamHasHoaDon = {
                                "deleted": false,
                                "soLuong": item.soLuong
                            }
                            ajaxCallPost("sanpham-has-hoadon/save/" + item.id + "/" + rs1.data.id, sanPhamHasHoaDon).then(rs2 => {
                                console.log(rs2)
                                localStorage.removeItem("listIdProduct");
                            }).catch(err => {
                                console.log(err)
                            })
                        })
                        alertSuccess("Thanh toán thành công.");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    })
                })
            }
        });
        self.btnDeletedPageCart = function (id) {
            let listInforProduct = [];
            listInforProduct = getItemLocalStorage('listIdProduct');
            if (listInforProduct != undefined && listInforProduct.length > 0) {
                listInforProduct = listInforProduct.filter(item => item.id != id);
                localStorage.removeItem('listIdProduct');
                setItemLocalStorage('listIdProduct', listInforProduct);
                self.listPrd(getItemLocalStorage('listIdProduct'));
                // set lại tiền
                let tong1 = 0;
                self.listPrd().map(item => {
                    console.log(item)
                    tong1 += item.soLuong * item.giaTien;
                })

                tong1 = formatNumber(tong1, ".", ".");
                self.tongTienTatCa(tong1);
            }
        }
        self.clickIncrementPageCart = function (id) {
            let listPrdLocal;
            let tong1 = 0;
            listPrdLocal = getItemLocalStorage('listIdProduct');
            if (listPrdLocal != undefined && listPrdLocal != null && listPrdLocal.length > 0) {
                listPrdLocal.map(item => {
                    if (item.id == id) {
                        item.soLuong += 1;
                    }
                    tong1 += item.soLuong * item.giaTien;
                })
            }
            tong1 = formatNumber(tong1, ".", ".");
            self.tongTienTatCa(tong1);
            self.listPrd(listPrdLocal);
            localStorage.removeItem('listIdProduct');
            setItemLocalStorage('listIdProduct', listPrdLocal);
        }
        self.clickDecrementPageCart = function (id) {
            let listPrdLocal;
            let tong1 = 0;
            listPrdLocal = getItemLocalStorage('listIdProduct');
            if (listPrdLocal != undefined && listPrdLocal != null && listPrdLocal.length > 0) {
                listPrdLocal.map(item => {
                    if (item.id == id) {
                        if (item.soLuong > 0) {
                            item.soLuong -= 1;

                        }
                    }
                    tong1 += item.soLuong * item.giaTien;
                })
            }
            tong1 = formatNumber(tong1, ".", ".");
            self.tongTienTatCa(tong1);
            self.listPrd(listPrdLocal);
            localStorage.removeItem('listIdProduct');
            setItemLocalStorage('listIdProduct', listPrdLocal);
        }
        $("#soDienThoai").keydown(function () {
            console.log( $("#soDienThoai").val())
            ajaxCallGet("khach-hang/find-by-so-dien-thoai/" + $("#soDienThoai").val()).then(rs => {
                console.log(rs)
                if (rs.data != null) {
                    self.userOld(rs.data[0])
                    self.resultFindSDT(rs.data[0].tenKhacHang);
                    self.showInforUser(true);
                } else {
                    self.resultFindSDT("")
                    self.showInforUser(false);
                }

            }).catch(err => {
                self.resultFindSDT("")
                self.showInforUser(false);
            })
        })
        self.clickGetUserOld = function () {
            self.hoVaTen(self.userOld().tenKhacHang);
            self.diaChiEmail(self.userOld().email);
            self.diaChi(self.userOld().diaChi);
        }
    }
    if (listProduct !== null) {
        $("#submitHoaDon").prop("disabled", false);
        ko.applyBindings(new ViewModelGioHang(listProduct), document.getElementById('pageGioHang'));
    } else {
        alertDanger("Không có sản phẩm nào trong giỏ hàng, thêm sản phẩm trước khi thanh toán");
        $("#submitHoaDon").prop("disabled", true);
    }
})
