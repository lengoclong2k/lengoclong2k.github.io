$(function () {
    let ViewModelBaoCao = function () {
        let self = this;
        self.selectedItemTieuChi = ko.observable();
        self.listSanPham = ko.observableArray();
        self.tongLoiNhuan = ko.observable()
        let idNv = getItemLocalStorage("user").data.admin;
        if (idNv){
            ajaxCallGet("san-pham/find-all").then(rs => {
                console.log(rs)
                self.listSanPham(rs.data);
                let tongLoiNhuan =0
                self.listSanPham().map(item=>{
                    tongLoiNhuan+= (item.giaBanLe - item.giaNhap )*item.daBan;
                })
                self.tongLoiNhuan(tongLoiNhuan)
            })
        }else {
            alertInfo("Chỉ người quản lý mới có thể sử dụng chức năng này")
        }



    }
    ko.applyBindings(new ViewModelBaoCao(),document.getElementById("baoCao"))
})