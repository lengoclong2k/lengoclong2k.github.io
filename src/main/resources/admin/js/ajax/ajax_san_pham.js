$(async function () {
    checkLogin();
    var listSanPham, listNhomSanPham = [], listThuongHieu = [];
    var optionOfList = function (valueT, dataT) {
        this.valueT = valueT;
        this.dataT = dataT;
    }
    // get
    await ajaxCallGet('san-pham/find-all').then(rs => {
        listSanPham = rs.data;
    }).catch(ex => {
        console.log(ex);
        alertDanger("Tải dữ liệu thất bại");
    });
    await ajaxCallGet('nhom-san-pham/find-all').then(rs => {
        rs.data.map(item => {
            listNhomSanPham.push(new optionOfList(item.id, item.ten));
        })
    }).catch(ex => {
        console.log(ex);
        alertDanger("Tải dữ liệu thất bại");
    });
    await ajaxCallGet('thuong-hieu/find-all').then(rs => {
        rs.data.map(item => {
            listThuongHieu.push(new optionOfList(item.id, item.ten));
        })
    }).catch(ex => {
        console.log(ex);
        alertDanger("Tải dữ liệu thất bại");
    });

    var ViewModelSP = function (listSanPhamGlobal, listNhomSanPhamGlobal, listThuongHieuGlobal) {

        var self = this;
        self.diaChiEmail = ko.observable();
        self.hoVaTen = ko.observable();
        self.diaChi = ko.observable;
        self.soDienThoai = ko.observable();
        self.ghiChu = ko.observable();

        self.showModal = ko.observable(false);
        // call các list cần cho view modal
        self.listSanPham = ko.observableArray(listSanPhamGlobal);
        self.listPhanTramGiamGia = ko.observableArray(['0', '10', '20', '30', '40', '50', '60', '70', '80', '90'])
        self.listNhomSanPhamModel = ko.observableArray(listNhomSanPhamGlobal);
        self.listThuongHieuModel = ko.observableArray(listThuongHieuGlobal);
        // call selected của option
        self.selectedCurrentGiamGia = ko.observable();
        self.selectedCurrentNhomSanPham = ko.observable();
        self.selectedCurrentThuongHieu = ko.observable();
        // select loc
        self.selectLocSP = ko.observable();
        self.selectLocThuongHieu = ko.observable();
        // add css cho từng select
        $('#selectGiamGia').css({"width": "100%", "padding": "6px", "border": "1px solid #00000040"})
        $('#selectThuongHieu').css({"width": "100%", "padding": "6px", "border": "1px solid #00000040"})
        $('#selectNhomSanPham').css({"width": "100%", "padding": "6px", "border": "1px solid #00000040"})
        // từ hóa tìm kiếm
        self.keywordSearch = ko.observable("");
        // chi tiết sản phẩm
        self.id = ko.observable();
        self.ten = ko.observable();
        self.giaBanLe = ko.observable();
        self.giaNhap = ko.observable();
        self.soLuongNhap = ko.observable();
        self.daBan = ko.observable();
        self.tonKho = ko.observable();
        self.xuatXu = ko.observable();
        self.thanhPhan = ko.observable();
        self.cachSuDung = ko.observable();
        self.khoiLuong = ko.observable();
        self.thongTinChiTiet = ko.observable();
        self.phanTramGiamGia = ko.observable();
        self.thuongHieuId = ko.observable();
        self.nhomSanPhamId = ko.observable();
        self.anhSanPham = ko.observable();
        // validate, trường này để check xem các input đã validate chưa
        self.checkValidateForm = ko.observable(false);

        //get data
        self.clickDeltailSP = function (id) {
            $('#block-edit').modal('show');
            $('#btnPostSP').css({"display": "none"});
            $('#btnUpdateSP').css({"display": "inline"});
            // để set element if: viewModel true đổ ra dữ liệu, nếu false sẽ mất dữ liệu
            self.showModal(true)

            // kiểm tra các phần tử trong mảng, lấy ra phần tử có id = id
            let item = self.listSanPham().filter(e => e.id == id)[0];
            self.id(item.id);
            self.ten(item.ten);
            self.giaBanLe(item.giaBanLe);
            self.giaNhap(item.giaNhap);
            self.soLuongNhap(item.soLuongNhap);
            self.daBan(item.daBan);
            self.tonKho(item.tonKho);
            self.xuatXu(item.xuatXu);
            self.thanhPhan(item.thanhPhan);
            self.cachSuDung(item.cachSuDung);
            self.khoiLuong(item.khoiLuong);
            self.thongTinChiTiet(item.thongTinChiTiet);
            self.anhSanPham(item.anhSanPham);
            // gán data cho option để slect
            self.selectedCurrentGiamGia(item.phanTramGiamGia);
            self.selectedCurrentThuongHieu(item.thuongHieuId.id);
            self.selectedCurrentNhomSanPham(item.nhomSanPhamId.id);

        }
        // lọc sản phẩm
        self.btnFilter = function (selectLocThuongHieu,selectLocSP){
            console.log(selectLocThuongHieu)
            ajaxCallGet("san-pham/find-by-thuong-hieu-and-nhom-sp/"+selectLocThuongHieu+"/"+selectLocSP).then(rs=>{
                if (rs.data.length>0){
                    self.listSanPham(rs.data)
                }else {
                    alertInfo("Không có dữ liệu.")
                }
            })

        }
        // bắt sự kiện thay đổi giá trị của selet, sau đó gán giá trị2
        self.selectedCurrentGiamGia.subscribe(function (valueOption) {
            self.selectedCurrentGiamGia(valueOption);
        });
        self.selectedCurrentThuongHieu.subscribe(function (valueOption) {
            self.selectedCurrentThuongHieu(valueOption);
        });
        self.selectedCurrentNhomSanPham.subscribe(function (valueOption) {
            self.selectedCurrentNhomSanPham(valueOption);
        });
        self.closeSubWinDow = function (id) {
            $('#block-edit').modal('hide');
            self.showModal(false);
        }
        self.btnAddNewSP = function () {
            $('#block-edit').modal('show');
            $('#btnPostSP').css({"display": "inline"});
            $('#btnUpdateSP').css({"display": "none"});
            self.showModal(true);
            // gán tất cả giá trị về mặc định
            // để view cửa sổ nhỏ nhập thông tin sản phẩm mới
            self.id(null);
            self.ten("");
            self.giaBanLe("");
            self.giaNhap("");
            self.soLuongNhap("");
            self.daBan("");
            self.xuatXu("");
            self.thanhPhan("");
            self.cachSuDung("");
            self.khoiLuong("");
            self.thongTinChiTiet("");
            self.phanTramGiamGia("");
            self.thuongHieuId("");
            self.nhomSanPhamId("");
            self.anhSanPham("");
            // gán data cho option để slect
            self.selectedCurrentGiamGia(undefined);
            self.selectedCurrentThuongHieu(undefined);
            self.selectedCurrentNhomSanPham(undefined);
        }
        self.btnSaveNewSP = function () {
            // cái funci này để làm màu cho submit form thôi, nó sẽ chạy cả func này với func .submit() ở dưới
            // không có cái này cũng k validate đc (bắt buộc có)
        }
        self.btnDeletedSP = function (id) {
            let idNv = getItemLocalStorage("user").admin;
            if (idNv){
                let result = confirm('Bạn có chắc chắn muốn xóa?', setTimeout(1000));
                if (result) {
                    ajaxCallPost("san-pham/remove/" + id).then(rs => {
                        // cập nhật lại dữ liệu mới trong list nhân viên
                        getListSanPham().then(rs => {
                            self.listSanPham(rs);
                        })
                        alertSuccess("Xóa sản phẩm thành công")
                    }).catch(err => {
                        alertDanger('Xóa sản phẩm thất bại')
                    })
                }
            }else {
                alertInfo("Chỉ người quản lý mới có thể sử dụng chức năng này")
            }

        }
        self.btnSearchSP = function (keywork) {
            if (keywork != "") {
                ajaxCallGet('san-pham/find-by-like-name/' + keywork).then(rs => {
                    if (rs.data.length > 0) {
                        self.listSanPham(rs.data)
                    } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.");

                }).catch(er => {
                    alertDanger("Lỗi, tìm kiếm thất bại.")
                })
            } else alertDanger("Vui lòng nhập thông tin.")

        }
        $("#inputSearch").keyup(function (event) {
            if (event.keyCode == 13) {
                if (self.keywordSearch() != "") {
                    ajaxCallGet('san-pham/find-by-like-name/' + self.keywordSearch()).then(rs => {
                        if (rs.data.length > 0) {
                            self.listSanPham(rs.data)
                        } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.")
                    }).catch(er => {
                        alertDanger("Lỗi, tìm kiếm thất bại.")
                    })
                } else alertDanger("Vui lòng nhập thông tin.");
            }
        });
        self.btnAddToCart = function (idSanPham, soLuong, giaTien, tenSanPham) {
            let prd = new product(idSanPham, 1, giaTien, tenSanPham);
            let listOld = getItemLocalStorage("listIdProduct");
            let listNew = [];
            if (listOld !== null) {
                let listOldNew = listOld.filter(item => item.id !== idSanPham);
                let itemCheck = listOld.filter(item => item.id == idSanPham)[0];
                console.log(itemCheck)
                if (itemCheck == undefined) {
                    listNew.push(prd);
                    alertSuccess("Thêm thành công")
                } else {
                    if (itemCheck.soLuong < self.listSanPham().filter(item=> item.id == idSanPham)[0].soLuongNhap){
                        itemCheck.soLuong += 1;
                        console.log(itemCheck)
                        listNew.push(itemCheck);
                        listOld = listOldNew;
                        alertSuccess("Thêm thành công")
                    }else {
                        alertDanger("Số lượng sản phẩm đã hết.")
                    }
                }
                listNew = listNew.concat(listOld);
            } else {
                listNew.push(prd)
                alertSuccess("Thêm thành công")
            }
            setItemLocalStorage("listIdProduct", listNew)
            viewNumberCart()
        }
        // validate
        $("#bootstrapForm").bind().submit(function (event) {
            var vForm = $(this);
            if (vForm[0].checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
                self.checkValidateForm(false);
            } else {
                // validate form xong xem chạy vào đây
                // thay đổi trạng thái của check
                let result = confirm('Bạn có chắc chắn muốn lưu?', setTimeout(1000));
                if (result)
                    self.checkValidateForm(true);
                else self.checkValidateForm(false);
            }
            // Add bootstrap 4 was-validated classes to trigger validation messages
            vForm.addClass('was-validated');
        })
        // kiểm tra, sau khi các trường đã đc validate thì giá trị của check sẽ thay đổi thành true
        // bắt sự kiện thay đổi giá trị lưu luôn đối tượng
        self.checkValidateForm.subscribe(function (valueCheck) {
            if (valueCheck) {
                let sanPham = {
                    "id": self.id(),
                    "anhSanPham": self.anhSanPham(),
                    "cachSuDung": self.cachSuDung(),
                    "daBan": self.daBan(),
                    "deleted": false,
                    "giaBanLe": self.giaBanLe(),
                    "giaNhap": self.giaNhap(),
                    "khoiLuong": self.khoiLuong(),
                    "phanTramGiamGia": self.selectedCurrentGiamGia(),
                    "soLuongNhap": self.soLuongNhap(),
                    "ten": self.ten(),
                    "thanhPhan": self.thanhPhan(),
                    "thongTinChiTiet": self.thongTinChiTiet(),
                    "xuatXu": self.xuatXu()
                }
                ajaxCallPost("san-pham/save/" + self.selectedCurrentThuongHieu() + "/" + self.selectedCurrentNhomSanPham(), sanPham).then(rs => {
                    // cập nhật lại dữ liệu mới trong list nhân viên
                    getListSanPham().then(rs => {
                        self.listSanPham(rs);
                    })
                    alertSuccess('Lưu thành công');
                    self.checkValidateForm(false);
                    $('#block-edit').modal('hide');
                    self.showModal(false);

                }).catch(err => {
                    alertDanger('Lưu thất bại, vui lòng kiểm tra lại các trường dữ liệu.')
                })
            }
        })
    }
        ko.applyBindings(new ViewModelSP(listSanPham, listNhomSanPham, listThuongHieu),document.getElementById('pageSanPham'));

})

async function getListSanPham() {
    let list = null
    await ajaxCallGet('san-pham/find-all').then(rs => {
        list = rs.data;
    }).catch(ex => {
        console.log(ex);
        alertDanger("Tải dữ liệu thất bại");
    });
    return list;
}

async function findProductById(id) {
    let product = null;
    await ajaxCallGet('san-pham/find-by-id/' + id).then(rs => {
        console.log(rs)
        product = rs;
    })
    return product;
}

function product(id, soLuong, giaTien, tenSanPham) {
    this.id = id;
    this.soLuong = soLuong;
    this.giaTien = giaTien;
    this.tenSanPham = tenSanPham;
}