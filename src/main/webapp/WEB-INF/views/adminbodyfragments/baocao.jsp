<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 6/24/2021
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="admin/js/ajax/ajax_bao_cao.js"></script>
<div id="baoCao">
    <%--end sub window--%>
    <div class="row">
        <div class="col-12">
            <div class="card" style="padding: 15px">
                <div class="card-header row justify-content-around"
                     style=" margin-bottom: 15px; border-bottom: none; margin-top: 10px;">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3">
                        <h3 class="card-title">Báo cáo thống kê</h3>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-3"
                         style="display: flex;justify-content: flex-end">
                        <button class="btn btn-success">Chức năng</button>
                    </div>
                </div>
<%--                <div class="row pb-1">--%>
<%--                    <div class="input-group input-group-sm"--%>
<%--                         style="display: flex;width: 100%;justify-content: flex-start" >--%>

<%--                        <div class="input-group-append col-12">--%>
<%--                            <select data-bind="value: selectedItemTieuChi,optionsCaption: 'Chọn tiêu chí...'"--%>
<%--                                    style="margin-right: 15px; padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px">--%>
<%--                                <option value="1">Tổng lợi nhận</option>--%>
<%--                                <option value="2">Sản phẩm đã bán</option>--%>
<%--                                <option value="3">Sản phẩm tồn kho</option>--%>
<%--                            </select>--%>
<%--                            <input  style="margin-right: 15px; padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px"--%>
<%--                                    placeholder="Ngày bắt đầu (*)" data-bind="textInput: startDate" type="text" onfocus="(this.type='date')" onblur="(this.type='text')">--%>
<%--                            <input style="margin-right: 15px; padding: 5px;margin-top: 10px; margin-bottom: 5px;border: 1px solid #00000059;height: 30px"--%>
<%--                                   placeholder="Ngày kết thúc (*)" data-bind="textInput: endDate" type="text" onfocus="(this.type='date')" onblur="(this.type='text')">--%>
<%--                            <button class="btn btn-success btn-show-add-course" data-bind="click: btnLoc.bind(this)">lọc</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: auto;">
                    <table class="table table-head-fixed table-hover">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Giá bán lẻ</th>
                            <th>Giá nhập</th>
                            <th>Số lượng nhập</th>
                            <th>Đã bán</th>
                            <th>Tồn kho</th>
                            <th>Xuất xứ</th>
                            <th>Doanh thu</th>
                            <th>Lợi nhuận</th>
                        </tr>
                        </thead>
                        <tbody data-bind="foreach: listSanPham" id="tableShowAllcourse">
                        <tr data-bind="attr:{'id':'attr'+id}"
                            style="cursor: pointer">
                            <td data-bind="text: ($index() + 1)"></td>
                            <td data-bind="text: ten"></td>
                            <td data-bind="numericText: giaBanLe"></td>
                            <td data-bind="numericText: giaNhap"></td>
                            <td data-bind="text: soLuongNhap"></td>
                            <td data-bind="text: daBan"></td>
                            <td data-bind="text: tonKho"></td>
                            <td data-bind="text: xuatXu"></td>
                            <td data-bind="numericText: giaBanLe*daBan"></td>
                            <td data-bind="numericText: (giaBanLe-giaNhap)*daBan"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div>
                    <h4>Tổng lợi nhuận: <span data-bind="numericText: tongLoiNhuan"></span></h4>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>
