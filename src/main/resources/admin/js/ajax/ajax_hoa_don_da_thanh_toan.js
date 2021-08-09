$(async function () {
    checkLogin();
    let listHoaDonGlobal = [];
    let idKhachHang
    let khachHangGlobal = null;
    await ajaxCallGet('hoa-don-mua/find-all').then(rs => {
        console.log(rs)
        listHoaDonGlobal = rs.data;
    })


    let ViewModelHoaDonDaThanhToan = function (listHoaDon) {
        let self = this;
        self.listHoaDon = ko.observableArray();
        self.showModal = ko.observable(false);
        self.keywordSearch = ko.observable();
        self.itemHoaDon = ko.observable();
        self.khachHang = ko.observable();
        self.listSanPham = ko.observableArray();
        self.showTable = ko.observable(true);
        self.tongHoaDon = ko.observable(0);
        self.startDate = ko.observable();
        self.endDate = ko.observable();
        let idNv = getItemLocalStorage("user").data.admin;
        console.log(idNv)
        if (!idNv) {
            alertInfo("Chỉ người quản lý mới có thể sử dụng chức năng này")
            self.listHoaDon("")
        } else {
            self.listHoaDon(listHoaDon)
            self.tinhTong = function () {
                self.tongHoaDon(0)
                self.listHoaDon().map(item => {
                    let tong = self.tongHoaDon() + item.tongTien
                    self.tongHoaDon(tong)
                })
            }
            self.tinhTong();
            self.closeSubWinDow = function (id) {
                $('#block-edit').modal('hide');
                self.showModal(false);
            }
            self.btnLoc = function () {
                ajaxCallGet("hoa-don-mua/find-by-ngay-tao-between/" + self.startDate() + "/" + self.endDate()).then(rs => {
                    console.log(rs)
                    if (rs.data.length > 0) {
                        self.showTable(true);
                        self.listHoaDon(rs.data)
                        self.tinhTong();
                    } else {
                        self.showTable(false);
                        alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.");
                    }
                })
            }
            self.clickDeltailHoaDon = function (id) {
                $('#block-edit').modal('show');
                self.showModal(true);
                self.itemHoaDon(listHoaDon.filter(item => item.id == id)[0]);
                ajaxCallGet('khach-hang/find-by-id/' + self.itemHoaDon().khachHangId.id).then(rs => {
                    console.log(rs)
                    self.khachHang(rs.data);
                })
                ajaxCallGet('sanpham-has-hoadon/find-by-id-hoadon/' + self.itemHoaDon().id).then(rs => {
                    console.log(rs)
                    self.listSanPham(rs.data);
                })
            }

            self.btnSaveNew = function () {
                // làm màu
            }
            self.btnDeleted = function (id) {
                ajaxCallPost('hoa-don-mua/remove/' + id).then(rs => {
                    alertSuccess('Xóa sản thành công')
                    ajaxCallGet('hoa-don-mua/find-all').then(rs => {
                        self.listHoaDon(rs.data);
                        self.tinhTong();
                    })
                })
            }
            self.btnSearch = function (keywork) {
                if (keywork != "") {
                    ajaxCallGet('hoa-don-mua/find-by-like-id/' + keywork).then(rs => {
                        if (rs.data.length > 0) {
                            self.showTable(true);
                            self.listHoaDon(rs.data)
                            self.tinhTong();
                        } else {
                            self.showTable(false);
                            alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.");
                        }
                    }).catch(er => {
                        self.showTable(false);
                        console.log(er)
                        alertDanger("Lỗi, tìm kiếm thất bại.")
                    })
                } else alertDanger("Vui lòng nhập thông tin.")
            }
            $("#inputSearch").keyup(function (event) {
                if (event.keyCode == 13) {
                    if (self.keywordSearch() != "") {
                        ajaxCallGet('hoa-don-mua/find-by-like-id/' + self.keywordSearch()).then(rs => {
                            if (rs.data.length > 0) {
                                self.showTable(true);
                                self.listHoaDon(rs.data)
                                self.tinhTong();
                            } else {
                                self.showTable(false);
                                alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.");
                            }
                        }).catch(er => {
                            self.showTable(false);
                            alertDanger("Lỗi, tìm kiếm thất bại.")
                        })
                    } else alertDanger("Vui lòng nhập thông tin.");
                }
            });

        }



    }

    if (listHoaDonGlobal.length > 0) {
        ko.applyBindings(new ViewModelHoaDonDaThanhToan(listHoaDonGlobal), document.getElementById('pageDanhSachHoaDonMua'));
    } else {
        alertDanger("Chưa có hóa đơn nào đã được thanh toán");
    }
    console.log(idNv)


})