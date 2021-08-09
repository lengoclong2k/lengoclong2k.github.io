$(function () {
    checkLogin();
    ajaxCallGet('thuong-hieu/find-all').then(rs => {
        console.log(rs)
        ko.applyBindings(new ViewModelThuongHieu(rs.data), document.getElementById('pageThuongHieu'));
    }).catch(err => {
        alertDanger("Tải dữ liệu thất bại")
        console.log(err)
    })
    var ViewModelThuongHieu = function (list) {
        var self = this;
        console.log(list)
        self.showModal = ko.observable(false);
        self.listThuongHieu = ko.observableArray(list);
        // self.listThuongHieu = ko.observableArray(list);
        self.name = ko.observable('');
        self.id = ko.observable('');
        self.keywordSearchTH = ko.observable('');
        self.closeSubWinDow = function () {
            $('#block-edit').modal('hide');
            self.showModal(false);
        }
        self.showDetailThuongHieu = function (id) {
            self.showModal(true);
            $('#block-edit').modal('show');
            $('#btnAddNewTH').css({"display": "none"})
            $('#btnUpdateNewTH').css({"display": "inline"})
            let item = self.listThuongHieu().filter(item => item.id == id)[0];
            self.name(item.ten);
            self.id(item.id);
        }
        self.openNewTH = function () {
            $('#block-edit').modal('show');
            $('#btnAddNewTH').css({"display": "inline"})
            $('#btnUpdateNewTH').css({"display": "none"})
            self.showModal(true);
            self.name('');
            self.id('');
        }
        self.saveNewTH = function () {
            let thuongHieu = {
                "ten": self.name(),
                "deleted": false
            }
            console.log(thuongHieu)
            ajaxPostSaveTH(thuongHieu).then(rs => {
                getlistThuongHieu().then(rs1 => {
                    self.showModal(false);
                    self.listThuongHieu(rs1);
                })
            });

        }
        self.updateTH = function () {
            let thuongHieu = {
                "id": self.id(),
                "ten": self.name(),
                "deleted": false
            }
            ajaxPostSaveTH(thuongHieu).then(rs => {
                getlistThuongHieu().then(rs1 => {
                    self.showModal(false);
                    self.listThuongHieu(rs1);
                })
            });
        }
        self.btnSearchNameTH = function (keyword) {
            if (keyword != "") {
                ajaxCallGet('thuong-hieu/find-by-like-name/' + keyword).then(rs => {
                    if (rs.data.length > 0) {
                        self.listThuongHieu(rs.data)
                    } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.")
                }).catch(er => {
                    alertDanger("Lỗi, tìm kiếm thất bại.")
                })
            } else alertDanger("Vui lòng nhập thông tin.");
        }
        $("#inputSearchTH").keyup(function (event) {
            if (event.keyCode == 13) {
                if (self.keywordSearchTH() != "") {
                    ajaxCallGet('thuong-hieu/find-by-like-name/' + self.keywordSearchTH()).then(rs => {
                        if (rs.data.length > 0) {
                            self.listThuongHieu(rs.data)
                        } else alertDanger("Không có kết quả phù hợp với tìm kiếm của bạn.")
                    }).catch(er => {
                        alertDanger("Lỗi, tìm kiếm thất bại.")
                    })
                } else alertDanger("Vui lòng nhập thông tin.");
            }
        });
    }
})

async function getlistThuongHieu() {
    let list = null
    await ajaxCallGet('thuong-hieu/find-all').then(rs => {
        list = rs.data;
    }).catch(err => {
        alertDanger("Tải dữ liệu thất bại")
        console.log(err)
    })
    return list;
}

async function ajaxPostSaveTH(thuongHieu) {
    await ajaxCallPost('thuong-hieu/save', thuongHieu).then(rs => {
        $('#block-edit').modal('hide');
    }).catch(err => {
        alertDanger('Lưu thất bại.')
        console.log(err);
    })
}