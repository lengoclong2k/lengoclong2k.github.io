$(function () {
    checkLogin();
    // get
    ajaxCallGet('nhan-vien/find-all').then(rs => {
        // binding dữ liệu
        ko.applyBindings(new ViewModel(rs.data),document.getElementById('pageNhanVien'));
    }).catch(ex => {
        console.log(ex);
        alertDanger("Tải dữ liệu thất bại");
    });

    var ViewModel = function (listNhanVienGlobal) {
        var self = this;
        self.showModal = ko.observable(false);
        self.listNhanVien = ko.observableArray(listNhanVienGlobal);
        self.selectedListNhanVien = ko.observable(null);
        self.itemListNhanVien = ko.observable(null);
        self.keywordSearch = ko.observable("");
        // end detail nhan vien
        self.idNV = ko.observable(null);
        self.nameNV = ko.observable("");
        self.tuoiNV = ko.observable("");
        self.diaChiNV = ko.observable("");
        self.soDienThoaiNV = ko.observable("");
        self.taiKhoanNV = ko.observable("");
        self.matKhauNV = ko.observable("");
        // validate, trường này để check xem các input đã validate chưa
        self.checkValidateForm = ko.observable(false);
        self.checkEncode = ko.observable("0");
        //get data
        self.clickDeltailNhanVien = function (id) {
            $('#block-edit').modal('show');
            $('#btnPostNhanVien').css({"display": "none"});
            $('#btnUpdateNhanVien').css({"display": "inline"});
            //detail nhan vien
            // để set element if: viewModel true đổ ra dữ liệu, nếu false sẽ mất dữ liệu
            self.showModal(true)
            // kiểm tra các phần tử trong mảng, lấy ra phần tử có id = id
            let item = self.listNhanVien().filter(e => e.id == id)[0];
            // self.itemListNhanVien(item)
            self.idNV(item.id);
            self.nameNV(item.name);
            self.tuoiNV(item.tuoi);
            self.diaChiNV(item.diaChi);
            self.soDienThoaiNV(item.soDienThoai);
            self.taiKhoanNV(item.taiKhoan);
            self.matKhauNV(item.matKhau);
            self.checkEncode
        }

        self.closeSubWinDow = function (id) {
            $('#block-edit').modal('hide');
            self.showModal(false);
        }
        self.btnAddNewNV = function () {
            $('#block-edit').modal('show');
            $('#btnPostNhanVien').css({"display": "inline"});
            $('#btnUpdateNhanVien').css({"display": "none"});
            self.showModal(true);
            self.idNV("")
            self.nameNV("");
            self.tuoiNV("");
            self.diaChiNV("");
            self.soDienThoaiNV("");
            self.taiKhoanNV("");
            self.matKhauNV("");
            self.checkEncode("0");
        }
        self.btnSaveNewNV = function () {
            // làm màu
        }
        self.btnDeletedNV = function (id) {
            ajaxCallPost("nhan-vien/remove/" + id).then(rs => {
                // cập nhật lại dữ liệu mới trong list nhân viên
                getListNhanVien().then(rs => {
                    self.listNhanVien(rs);
                })
                alertSuccess("Xóa nhân viên thành công")
            }).catch(err => {
                alertDanger('Xóa nhân viên thất bại')
            })
        }

        self.btnSearchNV = function (keywork) {
            if (keywork != "") {
                ajaxCallGet('nhan-vien/find-by-like-name/' + keywork).then(rs => {
                    if (rs.data.length > 0) {
                        self.listNhanVien(rs.data)
                    } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.");

                }).catch(er => {
                    alertDanger("Lỗi, tìm kiếm thất bại.")
                })
            } else alertDanger("Vui lòng nhập thông tin.")

        }
        $("#inputSearch").keyup(function (event) {
            if (event.keyCode == 13) {
                if (self.keywordSearch() != "") {
                    ajaxCallGet('nhan-vien/find-by-like-name/' + self.keywordSearch()).then(rs => {
                        if (rs.data.length > 0) {
                            self.listNhanVien(rs.data)
                        } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.")
                    }).catch(er => {
                        alertDanger("Lỗi, tìm kiếm thất bại.")
                    })
                } else alertDanger("Vui lòng nhập thông tin.");
            }
        });
        // validate
        $("#bootstrapForm").submit(function (event) {
            var vForm = $(this);
            if (vForm[0].checkValidity() === false) {
                event.preventDefault()
                event.stopPropagation()
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
                let nhanVien = {
                    "id": self.idNV(),
                    "admin": false,
                    "deleted": false,
                    "diaChi": self.diaChiNV(),
                    "matKhau": self.matKhauNV(),
                    "name": self.nameNV(),
                    "soDienThoai": self.soDienThoaiNV(),
                    "taiKhoan": self.taiKhoanNV(),
                    "tuoi": self.tuoiNV()
                }
                ajaxCallPost("nhan-vien/save/"+self.checkEncode(), nhanVien).then(rs => {
                    alertSuccess('Cập nhật thông tin thành công')
                    // cập nhật lại giá trí mới cho list nhân viên
                    // cập nhật lại dữ liệu mới trong list nhân viên
                    getListNhanVien().then(rs => {
                        self.listNhanVien(rs);
                    })
                    self.checkValidateForm(false);
                    $('#block-edit').modal('hide');
                    self.showModal(false);
                }).catch(err => {
                    alertDanger('Lưu thất bại')
                })
            }
        })
    }

})

async function getListNhanVien() {
    let list = null
    await ajaxCallGet('nhan-vien/find-all').then(rs => {
        list = rs.data;
    }).catch(ex => {
        console.log(ex);
        alertDanger("Tải dữ liệu thất bại");
    });
    return list;
}

