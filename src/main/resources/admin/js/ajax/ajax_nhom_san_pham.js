$(function () {
    checkLogin();
    ajaxCallGet('nhom-san-pham/find-all').then(rs => {
        console.log(rs)
        ko.applyBindings(new ViewModelNhomSanPham(rs.data),document.getElementById('pageNhomSanPham'));
    }).catch(err => {
        alertDanger("Tải dữ liệu thất bại")
        console.log(err)
    })
    var ViewModelNhomSanPham = function (list) {
        var self = this;
        console.log(list)
        self.showModal = ko.observable(false);
        self.listNhomSanPham = ko.observableArray(list);
        // self.listNhomSanPham = ko.observableArray(list);
        self.name = ko.observable('');
        self.id = ko.observable('');
        self.keywordSearchNSP= ko.observable('');
        self.closeSubWinDow = function () {
            $('#block-edit').modal('hide');
            self.showModal(false);
        }
        self.showDetailNhomSanPham = function (id) {
            self.showModal(true);
            $('#block-edit').modal('show');
            $('#btnAddNewNSP').css({"display": "none"})
            $('#btnUpdateNewNSP').css({"display": "inline"})
            let item = self.listNhomSanPham().filter(item => item.id == id)[0];
            self.name(item.ten);
            self.id(item.id);
        }
        self.openNewNSP = function () {
            $('#block-edit').modal('show');
            $('#btnAddNewNSP').css({"display": "inline"})
            $('#btnUpdateNewNSP').css({"display": "none"})
            self.showModal(true);
            self.name('');
            self.id('');
        }
        self.saveNewNSP = function () {
            let nhomSanPham = {
                "ten": self.name(),
                "deleted": false
            }

            ajaxPostSaveNSP(nhomSanPham).then(rs => {
                getListNhomSanPham().then(rs1 => {
                    self.showModal(false);
                    self.listNhomSanPham(rs1);
                })
            });

        }
        self.updateNSP = function () {
            let nhomSanPham = {
                "id": self.id(),
                "ten": self.name(),
                "deleted": false
            }
            ajaxPostSaveNSP(nhomSanPham).then(rs => {
                getListNhomSanPham().then(rs1 => {
                    self.showModal(false);
                    self.listNhomSanPham(rs1);
                })
            });
        }
        self.btnSearchNameNSP= function (keyword) {
            if (keyword != "") {
                ajaxCallGet('nhom-san-pham/find-by-like-name/' + keyword).then(rs => {
                    if (rs.data.length > 0) {
                        self.listNhomSanPham(rs.data)
                    } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.")
                }).catch(er => {
                    alertDanger("Lỗi, tìm kiếm thất bại.")
                })
            } else alertDanger("Vui lòng nhập thông tin.");
        }
        $("#inputSearchNSP").keyup(function (event) {
            if (event.keyCode == 13) {
                if (self.keywordSearchNSP() != "") {
                    ajaxCallGet('nhom-san-pham/find-by-like-name/' + self.keywordSearchNSP()).then(rs => {
                        if (rs.data.length > 0) {
                            self.listNhomSanPham(rs.data)
                        } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.")
                    }).catch(er => {
                        alertDanger("Lỗi, tìm kiếm thất bại.")
                    })
                } else alertDanger("Vui lòng nhập thông tin.");
            }
        });
    }
})

async function getListNhomSanPham() {
    let list = null
    await ajaxCallGet('nhom-san-pham/find-all').then(rs => {
        list = rs.data;
    }).catch(err => {
        alertDanger("Tải dữ liệu thất bại")
        console.log(err)
    })
    return list;
}

async function ajaxPostSaveNSP(nhomSanPham) {
    await ajaxCallPost("nhom-san-pham/save", nhomSanPham).then(rs => {
        $('#block-edit').modal('hide');
    }).catch(err => {
        alertDanger('Lưu thất bại.')
        console.log(err);
    })
}