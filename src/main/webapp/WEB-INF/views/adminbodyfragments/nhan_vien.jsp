<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 5/10/2021
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="admin/js/ajax/ajax_nhan_vien.js"></script>
<div id="pageNhanVien">
    <%-- sub window--%>
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
                                          data-bind="submit: btnSaveNewNV" method="post" id="bootstrapForm">
                                        <!-- Post -->

                                        <div class="card-header">
                                            <h2 class="card-title font-weight-bold"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">Chi tiết nhân viên</font></font>
                                            </h2>

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
                                                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12"
                                                     data-bind="if: showModal()">
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Tên nhân viên
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="input1" data-bind="textInput: nameNV" type="text"
                                                               class="form-control"
                                                               placeholder="Nhập tên nhân viên" required>
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Tuổi
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="tuoi" data-bind="textInput: tuoiNV" type="number"
                                                               class="form-control"
                                                               placeholder="Nhập tuổi" required>
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">

                                                        <label class="h4 form-control-label" for="input1">Địa chỉ
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="diaChi" data-bind="textInput: diaChiNV" type="text"
                                                               class="form-control"
                                                               placeholder="Nhập địa chỉ" required>
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Số điện thoại
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="soDienThoai" data-bind="textInput: soDienThoaiNV"
                                                               type="text" class="form-control"
                                                               pattern="^\+?(?:0|84)(?:\d){9}$"
                                                               placeholder="Nhập số điện thoại" required>
                                                        <div class="invalid-feedback">Làm ơn nhập đúng định dạng . Đây
                                                            là
                                                            bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Tên tài khoản
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="taiKhoan" data-bind="textInput: taiKhoanNV"
                                                               type="text" class="form-control"
                                                               pattern="^[a-z][a-z0-9_\.]{3,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
                                                               placeholder="Nhập email tài khoản" required>
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="h4 form-control-label" for="input1">Mật khẩu
                                                            <abbr class="text-danger" title="This is required">*</abbr>
                                                        </label>
                                                        <input id="matKhau" data-bind="textInput: matKhauNV" type="text"
                                                               class="form-control"
                                                               placeholder="Nhập mật khẩu " required>
                                                        <div class="invalid-feedback">Làm ơn nhập . Đây là bắt buộc
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.row -->
                                            <div class="row">
                                                <div class="form-group"
                                                     style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">
                                                    <button type="submit" class="btn btn-success"> Lưu lại</button>
                                                    </button>
                                                </div>
                                            </div>
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
                        <h3 class="card-title">Danh Sách Nhân Viên</h3>
                    </div>
                    <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                        <div class="input-group input-group-sm" style="display: flex">
                            <input id="inputSearch" style="width: auto" type="text" name="table_search"
                                   class="form-control float-right"
                                   placeholder="Nhập tên nhân viên"
                                   data-bind="value : keywordSearch, valueUpdate: 'afterkeydown'">

                            <div class="input-group-append">
                                <button id="btnSearch" data-bind="click: btnSearchNV.bind(this,keywordSearch())"
                                        class="btn btn-default"><i
                                        class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pb-1">
                    <div class="input-group-append col-12">
                        <button class="btn btn-success btn-show-add-course" data-bind="click: btnAddNewNV.bind(this)">
                            <i class="fas fa-plus"></i> Thêm mới
                        </button>
                    </div>
                </div>
                <div style="margin-top: 20px!important;">
                    <!-- ko foreach: listNhanVien() -->
                    <div class="col-md-3">
                        <!-- Profile Image -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img class="profile-user-img img-fluid img-circle"
                                         src="https://spec.edu.vn/admin/plugin_admin/dist/img/avatar5.png"
                                         alt="User profile picture">
                                </div>
                                <h3 class="profile-username text-center" data-bind="text: name"></h3>

                                <%--                                <p class="text-muted text-center">Trưởng phòng</p>--%>

                                <ul class="list-group list-group-unbordered mb-3" style="color: black">
                                    <li class="list-group-item">
                                        <b>Tuổi</b> <a class="float-right" data-bind="text: tuoi"></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Địa chỉ</b> <a class="float-right" data-bind="text: diaChi"></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Số điện thoại</b> <a class="float-right" data-bind="text: soDienThoai"></a>
                                    </li>
                                    <li class="list-group-item" style="display: flex;justify-content: space-between;align-items: center">
                                        <b>Chức năng</b>
                                        <div class="mailbox-controls">
                                            <!-- Check all button -->
                                            <div class="btn-group">
                                                <button title="xem"
                                                        data-bind="click: $parent.clickDeltailNhanVien.bind(this,id)"
                                                        type="button"
                                                        class="btn btn-default btn-sm btn-show-add-course">
                                                    <i class="fas fa-wrench"></i>
                                                </button>

                                                <button title="Xóa" type="button"
                                                        data-bind="click: $parent.btnDeletedNV.bind(this,id)"
                                                        class="btn btn-default btn-sm">
                                                    <i class="far fa-trash-alt"></i>
                                                </button>

                                            </div>
                                            <!-- /.btn-group -->
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!-- /ko -->
                </div>

            </div>
            <!-- /.card -->
        </div>
    </div>
</div>


