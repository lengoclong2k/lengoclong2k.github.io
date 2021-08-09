$(function () {

    var ViewModalLogin = function () {
        let sefl = this;
        sefl.nameDN = ko.observable('');
        sefl.passDN = ko.observable('');
        sefl.btnDangNhap = function () {
            let user = {
                "email": sefl.nameDN(),
                "pass": sefl.passDN()
            }
            console.log(user)
            ajaxCallPost("nhan-vien/login", user).then(rs => {
                console.log(rs)
                if (rs.data !== null) {
                    setItemLocalStorage("user", rs);
                    window.location.href = "admin";
                } else alertDanger("Đăng nhập thất bại vui lòng kiểm tra lại tài khoản mật khẩu")

            }).catch(err => {
                alertDanger("Có lỗi hệ thống xảy ra")
                console.log(err)
            })
        }
    }
    ko.applyBindings(new ViewModalLogin())
})