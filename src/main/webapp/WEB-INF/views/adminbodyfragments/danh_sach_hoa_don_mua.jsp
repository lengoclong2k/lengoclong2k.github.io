<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 5/10/2021
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="admin/js/ajax/ajax_hoa_don_da_thanh_toan.js"></script>
<%-- sub window--%>
<div id="pageDanhSachHoaDonMua">
    <div class="block-edit modal fade" id="block-edit" role="dialog"
         style="position: fixed;z-index: 10000;width: 100%;height: 100%; left: 0;top: 0; background: #00000045;">
        <div class="edit-course"
             style="display: flex;align-items: center; width: 100%;height: 97%;margin-bottom: 10px;margin-top: 10px">
            <div class="admin-course container"
                 style="margin-bottom: 10px;overflow-y: auto;max-height: 100%;padding: 0;margin-top: 10px"
                 id="admin-course">
                <div class="card" style="padding: 15px">
                    <%--        Start--%>
                    <div class="col-12">
                        <div class="nav-tabs-custom">

                            <div class="tab-content">
                                <div class="tab-pane active" id="activity">
                                    <form class="card card-default col-12" style="margin-bottom: 0px;" novalidate=""
                                          data-bind="submit: btnSaveNew" method="post" id="bootstrapForm">
                                        <!-- Post -->
                                        <div class="card-header">
                                            <h2 class="card-title font-weight-bold"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">Chi tiết hóa đơn</font></font></h2>

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
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <div class="row" data-bind="if: showModal() ">
                                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6"
                                                     data-bind="with: khachHang">
                                                    <div class="form-group">
                                                        <h3>Thông Tin Thanh Toán</h3>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Địa chỉ email
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="input1" data-bind="textInput: email" type="text"
                                                               class="form-control"
                                                               pattern="^[a-z][a-z0-9_\.]{3,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
                                                               placeholder="Nhập email tài khoản" required="">
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Họ và tên
                                                            khách
                                                            hàng
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="tuoi" data-bind="textInput: tenKhacHang" type="text"
                                                               class="form-control" placeholder="Nhập tuổi" required="">
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Địa chỉ
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="diaChi" data-bind="textInput: diaChi" type="text"
                                                               class="form-control" placeholder="Nhập địa chỉ"
                                                               required="">
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Số điện thoại
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="soDienThoai" data-bind="textInput: soDienThoai"
                                                               type="text" class="form-control"
                                                               pattern="^\+?(?:0|84)(?:\d){9}$"
                                                               placeholder="Nhập số điện thoại" required="">
                                                        <div class="invalid-feedback">Làm ơn nhập đúng định dạng . Đây
                                                            là
                                                            bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group" data-bind="with: $parent.itemHoaDon">
                                                        <label class="h4 form-control-label" for="input1">Thông tin bổ
                                                            xung
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <textarea data-bind="textInput: ghiChu" name="order_comments"
                                                                  class="form-control"
                                                                  style="height: 100px;width: 100%;font-size: 0.9rem"
                                                                  id="order_comments" placeholder="" rows="2"
                                                                  cols="5"></textarea>
                                                    </div>

                                                </div>
                                                <!-- /.col -->
                                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                    <div class="form-group">
                                                        <h3>Đơn hàng của bạn</h3>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table table-hover"
                                                               style="font-size: 1.1rem; border: 1px solid #0000002e">
                                                            <thead style="background: #AAAAAA">
                                                            <tr>
                                                                <th scope="col"
                                                                    style="font-weight: 500;color: white;padding: 15px 20px;border-right: 1px solid #0000002e">
                                                                    SẢN PHẨM
                                                                </th>
                                                                <th style="color: white;padding: 10px 20px;display: flex;justify-content: space-around;border-bottom:none;font-weight: 500">
                                                                    TẠM TÍNH
                                                                </th>
                                                            </tr>
                                                            </thead>
                                                            <tbody data-bind="foreach: listSanPham">

                                                            <tr data-bind="attr:{'id':'attr'+id}" id="attr6">
                                                                <th scope="row"
                                                                    style="border-top: none;border-right: 1px solid #0000002e">
                                                                    <span data-bind="text: sanPham.ten">rdcmmmm</span>
                                                                    <span> x </span>
                                                                    <span data-bind=",text: soLuong">1</span>
                                                                </th>
                                                                <td style="border-top: none;display: flex;justify-content: flex-end">
                                                                    <span data-bind="text: soLuong*sanPham.giaBanLe">1234</span>₫
                                                                </td>
                                                            </tr>

                                                            </tbody>
                                                            <tfoot>
                                                            <tr data-bind="with: itemHoaDon">
                                                                <th scope="row"
                                                                    style="border-right: 1px solid #0000002e">
                                                                    Tổng tiền
                                                                </th>
                                                                <td style="display: flex;justify-content: flex-end;font-weight: 600;">
                                                                    <span data-bind="text: tongTien">2.468</span>₫
                                                                </td>
                                                            </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.row -->

                                        </div>

                                    </form>
                                    <!-- /.post -->
                                </div>
                                <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div>

                        <!-- /.nav-tabs-custom -->
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
                        <h3 class="card-title">Danh Sách Hóa Đơn Đã Thanh Toán</h3>
                    </div>
                    <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                        <div class="input-group input-group-sm" style="display: flex">
                            <input id="inputSearch" style="width: auto" type="number" name="table_search"
                                   class="form-control float-right"
                                   placeholder="Nhập mã hóa đơn"
                                   data-bind="value : keywordSearch, valueUpdate: 'afterkeydown'">

                            <div class="input-group-append">
                                <button id="btnSearch" data-bind="click: btnSearch.bind(this,keywordSearch())"
                                        class="btn btn-default"><i
                                        class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pb-1">
                    <div class="input-group-append col-12">
                        <input style="margin-right: 15px" placeholder="Ngày bắt đầu (*)" data-bind="textInput: startDate"
                               type="text" onfocus="(this.type='date')" onblur="(this.type='text')">
                        <input style="margin-right: 15px" placeholder="Ngày kết thúc (*)" data-bind="textInput: endDate"
                               type="text" onfocus="(this.type='date')" onblur="(this.type='text')">
                        <button class="btn btn-success btn-show-add-course" data-bind="click: btnLoc.bind(this)">lọc</button>
                    </div>
                </div>

                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: auto;">
                    <table class="table table-head-fixed table-hover">
                        <thead>
                        <tr>
                            <th>Mã hóa đơn</th>
                            <th>Tên khách hàng</th>
                            <th>Ngày tạo</th>
                            <th>Tổng tiền</th>
                            <th>Tình trạng</th>
                            <th>Công cụ</th>
                        </tr>
                        </thead>
                        <!-- ko if: showTable() -->
                        <tbody data-bind="foreach: listHoaDon" id="tableShowAllcourse">
                        <tr data-bind="attr:{'id':'attr'+id}"
                            style="cursor: pointer">
                            <td data-bind="text: id"></td>
                            <td data-bind="text: khachHangId.tenKhacHang"></td>
                            <td data-bind="text: ngayTao[2] +'-'+ngayTao[1] +'-'+ngayTao[0] "></td>
                            <td data-bind="numericText: tongTien"></td>
                            <td>Đã thanh toán</td>
                            <td>
                                <div class="mailbox-controls">
                                    <!-- Check all button -->
                                    <div class="btn-group">
                                        <button title="xem" data-bind="click: $parent.clickDeltailHoaDon.bind(this,id)"
                                                type="button"
                                                class="btn btn-default btn-sm btn-show-add-course">
                                            <i class="fas fa-wrench"></i>
                                        </button>
                                        <button title="Xóa" type="button"
                                                data-bind="click: $parent.btnDeleted.bind(this,id)"
                                                class="btn btn-default btn-sm">
                                            <i class="far fa-trash-alt"></i>
                                        </button>

                                    </div>
                                    <!-- /.btn-group -->
                                </div>
                            </td>
                        </tr>
                        </tbody>
                        <!--/ko -->
                        <tfoot data-bind="ifnot: showTable()">
                        <tr>
                            <td><span>Không có kết quả tìm kiếm</span></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.card-body -->
                <div class="row">
                    <h4>Tổng tiền: <span data-bind="numericText: tongHoaDon"></span></h4>
                </div>
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>
