<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 5/10/2021
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="admin/js/ajax/ajax_san_pham.js"></script>
<div id="pageSanPham">
    <%-- sub window--%>
    <div class="block-edit modal fade" id="block-edit" role="dialog"
         style="position: fixed;z-index: 10000;width: 100%;height: 100%; left: 0;top: 0; background: #00000045;">
        <div class="edit-course"
             style="display: flex;align-items: center; width: 100%;height: 97%;margin-bottom: 10px;margin-top: 10px">
            <div class="admin-course container"
                 style="margin-bottom: 10px;overflow-y: auto;max-height: 100%;padding: 0;margin-top: 10px"
                 id="admin-course">
                <div class="card" style="padding: 15px">
                    <div class="tab-content">
                        <div class="tab-pane active" id="activity">
                            <!-- Post -->
                            <form class="card card-default col-12" style="margin-bottom: 0px;" novalidate=""
                                  data-bind="submit: btnSaveNewSP" method="post" id="bootstrapForm">
                                <div class="card-header">
                                    <h2 class="card-title font-weight-bold"><font
                                            style="vertical-align: inherit;"><font
                                            style="vertical-align: inherit;">Sản phẩm</font></font></h2>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool"
                                                data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" data-bind="click: function(){closeSubWinDow()}"
                                                class="btn btn-tool btn-hide-add-course" title="Đóng">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body" style="display: block;">
                                    <div data-bind="if: showModal()">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Tên sản phẩm
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="value: ten" id="input1" name="ten" type="text"
                                                           class="form-control"
                                                           placeholder="Nhập tên sản phẩm" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Giá
                                                        nhập<abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: giaNhap" id=""
                                                           name="giaBanLe" type="number"
                                                           class="form-control" placeholder="Nhập giá" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Giá bán
                                                        lẻ
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput:  giaBanLe" id="giaNhap"
                                                           name="giaNhap" type="number"
                                                           class="form-control" placeholder="Nhập giá bán lẻ" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Số lượng nhập
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: soLuongNhap" id="soLuongNhap"
                                                           type="number" class="form-control"
                                                           placeholder="Nhập số lượng" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Đã bán
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: daBan"
                                                           type="number" class="form-control"
                                                           placeholder="Nhập số lượng đã bán" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Xuất xứ
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: xuatXu" type="text"
                                                           class="form-control" placeholder="Nhập xuất xứ " required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Thành phần
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: thanhPhan" type="text"
                                                           class="form-control" placeholder="Nhập thành phần" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Cách sử dụng
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: cachSuDung" type="text"
                                                           class="form-control"
                                                           placeholder="Nhập cách sử dụng" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Khối lượng tịnh
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: khoiLuong" type="number"
                                                           class="form-control"
                                                           placeholder="Nhập khối lượng tịnh" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Thông tin chitiết
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: thongTinChiTiet"
                                                           type="text" class="form-control"
                                                           placeholder="Nhập thông tin chi tiết" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Ảnh sản phẩm
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <input data-bind="textInput: anhSanPham" type="text"
                                                           class="form-control"
                                                           placeholder="Nhập ảnh sản phẩm" required>
                                                    <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Giảm giá
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <select id="selectGiamGia"
                                                            data-bind="options: listPhanTramGiamGia,value: selectedCurrentGiamGia">
                                                    </select>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Thương hiệu
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <select id="selectThuongHieu"
                                                            data-bind="options: listThuongHieuModel,optionsText: 'dataT',optionsValue:'valueT',value: selectedCurrentThuongHieu">
                                                    </select>
                                                </div>
                                                <div class="form-group" style="margin-bottom: 0px">
                                                    <label class="h4 form-control-label" for="input1">Nhóm sản phẩm
                                                        <abbr class="text-danger" title="This is required">*</abbr>
                                                    </label>
                                                    <select id="selectNhomSanPham"
                                                            data-bind="options: listNhomSanPhamModel,optionsText: 'dataT',optionsValue:'valueT',value: selectedCurrentNhomSanPham">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group"
                                         style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">

                                        <button type="submit" class="btn btn-success"> Lưu lại</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%--        end--%>
                </div>
            </div>
        </div>
    </div>
    <%--end sub window--%>
    <div class="row">
        <div class="col-12">
            <div class="card" style="padding: 15px">
                <div class="card-header row justify-content-around"
                     style=" margin-bottom: 15px; border-bottom: none; margin-top: 10px;">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                        <h3 class="card-title">Danh Sách Sản Phẩm</h3>
                    </div>
                    <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                        <div class="input-group input-group-sm" style="display: flex">
                            <input id="inputSearch" style="width: auto" type="text" name="table_search"
                                   class="form-control float-right"
                                   placeholder="Nhập tên sản phẩm"
                                   data-bind="value : keywordSearch, valueUpdate: 'afterkeydown'">

                            <div class="input-group-append">
                                <button id="btnSearch" data-bind="click: $root.btnSearchSP.bind(this,keywordSearch())"
                                        class="btn btn-default"><i
                                        class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pb-1">
                    <div class="input-group-append col-6">
                        <button class="btn btn-success btn-show-add-course" data-bind="click: btnAddNewSP.bind(this)">
                            <i class="fas fa-plus"></i> Thêm mới
                        </button>
                        <select data-bind="options: listThuongHieuModel,optionsText: 'dataT',optionsValue:'valueT',value: selectLocThuongHieu,optionsCaption: 'Chọn thương hiệu...'"
                                style=" margin-right: 10px;padding: 5px;margin-top: 10px;margin-left: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px">
                        </select>
                        <select data-bind="options: listNhomSanPhamModel,optionsText: 'dataT',optionsValue:'valueT',value: selectLocSP,optionsCaption: 'Chọn nhóm sản phầm...'"
                                style="margin-right: 10px; padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px">
                        </select>
                        <button data-bind="click: btnFilter.bind(this,selectLocThuongHieu(),selectLocSP())"
                                class="btn btn-success"
                                style="margin-right: 10px; padding: 5px;margin-top: 10px;margin-bottom: 5px;border: 1px solid #00000059;height: 30px">
                            Lọc
                        </button>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px!important;">
                    <!--ko foreach:  listSanPham()-->
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <div>
                                <img data-bind="attr:{src: anhSanPham}" class="bd-placeholder-img card-img-top"
                                     style="width: 100%; height: 250px" src="" alt="">
                            </div>
                            <div class="card-body">
                                <p class="card-text" data-bind="text: thanhPhan">This is a wider card with supporting
                                    text below as a natural lead-in to additional content. This content is a little bit
                                    longer.</p>
                                <p>Thương hiệu: <span data-bind="text: thuongHieuId.ten"></span></p>
                                <h3 data-bind="text: ten"></h3>

                                <div class="row flex-wrap">
                                    <div class="col-6">
                                        <span style="font-weight: bold">Số lượng nhập:</span>
                                        <span data-bind="text: soLuongNhap"></span>
                                    </div>
                                    <div class="col-6">

                                        <span style="font-weight: bold">Tồn kho:</span>
                                        <span data-bind="text: tonKho"></span>
                                    </div>
                                    <div class="col-6">

                                        <span style="font-weight: bold">Xuất xứ: </span>

                                        <span data-bind="text: xuatXu"></span>
                                    </div>
                                    <div class="col-6">

                                        <span style="font-weight: bold">Thành phần:</span>

                                        <span data-bind="text: thanhPhan"></span>
                                    </div>
                                    <div class="col-6">

                                        <span style="font-weight: bold">Khối lượng:</span>

                                        <span data-bind="text: khoiLuong"></span>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center"
                                     style="font-size: 20px;margin-top: 10px">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary"
                                                title="xem" data-bind="click: $parent.clickDeltailSP.bind(this,id)"><i
                                                class="fas fa-wrench"></i></button>
                                        <button type="button" class="btn btn-sm btn-outline-secondary"
                                                title="Xóa" data-bind="click: $parent.btnDeletedSP.bind(this,id)"><i
                                                class="far fa-trash-alt"></i></button>
                                        <button type="button" class="btn btn-sm btn-outline-secondary"
                                                title="Thêm vào giỏ hàng"
                                                data-bind="click: $parent.btnAddToCart.bind(this,id,1,giaBanLe,ten)"><i
                                                class="fas fa-cart-arrow-down"></i></button>
                                    </div>
                                    <small class="text-muted" data-bind="numericText: giaBanLe">9 mins</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /ko -->
                </div>
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>

