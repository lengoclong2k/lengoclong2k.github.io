<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 5/10/2021
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="admin/js/ajax/ajax_gio_hang.js"></script>

<div class="row" id="pageGioHang">
    <div class="col-12">
        <div class="card" style="padding: 15px">
            <form class="card card-default col-12" style="margin-bottom: 0px;" novalidate=""
                  data-bind="submit: btnSaveNew" method="post" id="bootstrapForm">
                <!-- Post -->

                <div class="card-header">
                    <h2 class="card-title font-weight-bold"><font
                            style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">Thanh toán</font></font></h2>

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
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6"
                             data-bind="if: showModal()">
                            <div class="form-group">
                                <h3>Thông Tin Thanh Toán</h3>
                            </div>
                            <div class="form-group">
                                <label class="h4 form-control-label" for="input1">Số điện thoại
                                    <abbr class="text-danger" title="This is required">*</abbr>
                                </label>
                                <input id="soDienThoai" data-bind="textInput: soDienThoai"
                                       type="text" class="form-control"
                                       pattern="^\+?(?:0|84)(?:\d){9}$"
                                       placeholder="Nhập số điện thoại" required>
                                <div class="invalid-feedback">Làm ơn nhập đúng định dạng . Đây là
                                    bắt buộc
                                </div>
                                <!-- ko if: showInforUser() -->
                                <div>
                                    <span  style="cursor: pointer; color:blue;margin: 5px" data-bind="text: resultFindSDT,click: clickGetUserOld.bind(this)"></span>
                                </div>
                                <!-- /ko -->

                            </div>
                            <div class="form-group">
                                <label class="h4 form-control-label" for="input1">Họ và tên khách hàng
                                    <abbr class="text-danger" title="This is required">*</abbr>
                                </label>
                                <input id="tuoi" data-bind="textInput: hoVaTen" type="text"
                                       class="form-control"
                                       placeholder="Nhập họ tên" required>
                                <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                            </div>
                            <div class="form-group">
                                <label class="h4 form-control-label" for="input1">Địa chỉ
                                    <abbr class="text-danger" title="This is required">*</abbr>
                                </label>
                                <input id="diaChi" data-bind="textInput: diaChi" type="text"
                                       class="form-control"
                                       placeholder="Nhập địa chỉ" required>
                                <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                            </div>

                            <div class="form-group">
                                <label class="h4 form-control-label" for="input1">Địa chỉ email
                                    <abbr class="text-danger" title="This is required">*</abbr>
                                </label>
                                <input id="input1" data-bind="textInput: diaChiEmail"
                                       type="text" class="form-control"
                                       pattern="^[a-z][a-z0-9_\.]{3,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
                                       placeholder="Nhập email tài khoản">
                                <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc</div>
                            </div>
                            <div class="form-group">
                                <label class="h4 form-control-label" for="input1">Thông tin bổ xung
                                    <abbr class="text-danger" title="This is required">*</abbr>
                                </label>
                                <textarea data-bind="textInput: ghiChu" name="order_comments"
                                          class="form-control" style="height: 100px;width: 100%;font-size: 0.9rem"
                                          id="order_comments" placeholder="" rows="2" cols="5"></textarea>
                            </div>

                        </div>
                        <!-- /.col -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                            <div class="form-group">
                                <h3>Đơn hàng</h3>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover" style="font-size: 1.1rem; border: 1px solid #0000002e">
                                    <thead style="background: #AAAAAA">
                                    <tr>
                                        <th colspan="3"
                                            style="font-weight: 500;color: white;padding: 15px 20px;border-right: 1px solid #0000002e">
                                            SẢN PHẨM
                                        </th>
                                        <th colspan="2"
                                            style="color: white;padding: 15px 20px;border-bottom:none;font-weight: 500;border-right: 1px solid #0000002e">
                                            TẠM TÍNH
                                        </th>
                                        <th colspan="1"
                                            style="color: white;padding: 15px 20px;border-bottom:none;font-weight: 500;border-right: 1px solid #0000002e">
                                            CHỨC NĂNG
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody data-bind="foreach: listPrd">
                                    <tr data-bind="attr:{'id':'attr'+id}">
                                        <td colspan="3" style="border-top: none;border-right: 1px solid #0000002e">
                                            <span data-bind="text: tenSanPham"></span>
                                        </td>
                                        <td colspan="2" style="border-top: none;border-right: 1px solid #0000002e"><span
                                                data-bind="text: soLuong*giaTien"></span>₫
                                        </td>
                                        <td colspan="1" style="border-top: none;border-right: 1px solid #0000002e">
                                            <div style="display: inline-flex">
                                            <span class="btn" style="width: 25px;display: flex;height: 25px;justify-content: space-around;
                                            align-items: center;cursor: pointer; border: 1px solid #c3c3c3;"
                                                  data-bind="click: $root.clickDecrementPageCart.bind(this,id)">-</span>
                                                <input data-bind="textInput:soLuong"
                                                       style="width: 70px; height: 25px;border:1px solid #c3c3c3;text-align: center"
                                                       type="number" max="1000" min="0" disabled>
                                                <span class="btn" style="width: 25px;display: flex;height: 25px;justify-content: space-around;
                                            align-items: center;cursor: pointer; border: 1px solid #c3c3c3;"
                                                      data-bind="click: $root.clickIncrementPageCart.bind(this,id)">+</span>
                                            </div>
                                            <button title="Xóa" type="button"
                                                    data-bind="click: $parent.btnDeletedPageCart.bind(this,id)"
                                                    class="btn btn-default btn-sm">
                                                <i class="far fa-trash-alt"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th colspan="3" style="border-right: 1px solid #0000002e">Tổng tiền</th>
                                        <td colspan="3" style="font-weight: 600;border-right: 1px solid #0000002e"><span
                                                data-bind="text: tongTienTatCa()"></span>₫
                                        </td>
                                        <%--                                        <td colspan="1" style="border-right: 1px solid #0000002e"></td>--%>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="row">
                                <div>
                                    <span style="color: red; font-size: 0.8rem">Chỉ chấp nhận thanh toán tiền mặt. Nhân viên nhận đủ trước khi ấn "Thanh toán"</span>
                                </div>
                                <div class="form-group"
                                     style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">

                                    <button id="submitHoaDon" type="submit" class="btn btn-success"
                                            style="width: 100%;color: white;padding: 10px 20px;font-size: 1rem"> Thanh
                                        toán
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                </div>
            </form>
        </div>
        <!-- /.card -->
    </div>
</div>

