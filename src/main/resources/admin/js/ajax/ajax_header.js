$(function () {
    var ViewModelHeader = function () {
        let self = this;
        self.listPrdHeader = ko.observableArray();
        self.tongTienTatCaHeader = ko.observable();
        self.showDropDownListPrd = ko.observable(false);
        self.listPrdHeader(getItemLocalStorage('listIdProduct'));

        let tong = 0;
        if (self.listPrdHeader() != null) {
            self.listPrdHeader().map(item => {
                tong += item.soLuong * item.giaTien;
            })
            tong = formatNumber(tong, ".", ".");
        }
        self.tongTienTatCaHeader(tong);

        self.btnDeletedHeader = function (id) {
            let listInforProduct = [];
            listInforProduct = getItemLocalStorage('listIdProduct');
            if (listInforProduct != undefined && listInforProduct.length > 0) {
                listInforProduct = listInforProduct.filter(item => item.id != id);
                localStorage.removeItem('listIdProduct');
                setItemLocalStorage('listIdProduct', listInforProduct);
                self.listPrdHeader(getItemLocalStorage('listIdProduct'));
                // set lại tiền
                let tong1 = 0;
                self.listPrdHeader().map(item => {
                    tong1 += item.soLuong * item.giaTien;
                })

                tong1 = formatNumber(tong1, ".", ".");
                self.tongTienTatCaHeader(tong1);
            }
        }
        self.clickIncrement = function (id) {
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
            self.tongTienTatCaHeader(tong1);
            self.listPrdHeader(listPrdLocal);
            localStorage.removeItem('listIdProduct');
            setItemLocalStorage('listIdProduct', listPrdLocal);
        }
        self.clickDecrement = function (id) {
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
            self.tongTienTatCaHeader(tong1);
            self.listPrdHeader(listPrdLocal);
            localStorage.removeItem('listIdProduct');
            setItemLocalStorage('listIdProduct', listPrdLocal);
        }
        self.btnClickShowDropdown = function () {
            if (self.showDropDownListPrd()) {
                self.showDropDownListPrd(false);
                $('#drdowListPrd').css({"display": "none"});
            } else {
                self.showDropDownListPrd(true);
                $('#drdowListPrd').css({"display": "inline"});
            }

        }
    }
    let arrUri = window.location.href.split('/');
    let uri = arrUri[arrUri.length - 1];
    if (uri != "admin-gio-hang") {
        ko.applyBindings(new ViewModelHeader(), document.getElementById('pageHeader'));
    }

})