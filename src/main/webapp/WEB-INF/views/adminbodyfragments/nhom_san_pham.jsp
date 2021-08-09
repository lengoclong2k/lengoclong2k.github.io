<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 5/10/2021
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="admin/js/ajax/ajax_nhom_san_pham.js"></script>
<div id="pageNhomSanPham">
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
                            <div class="card-header row"
                                 style="border-bottom: 1px solid #ddd;padding-top: 10px;padding-left: 0px;padding-right: 0px">
                                <ul class="nav nav-tabs col-12 col-sm-12 col-md-10 col-lg-10 col-xl-10"
                                    style="border-bottom: none!important">
                                    <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">Bài
                                        viết</a></li>
                                </ul>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane active" id="activity">
                                    <!-- Post -->
                                    <div class="card card-default col-12" style="margin-bottom: 0px;">
                                        <div class="card-header">
                                            <h2 class="card-title font-weight-bold"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">Danh Sách Nhóm sản phẩm</font></font></h2>

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
                                                     data-bind="if:showModal()">
                                                    <div class="form-group">
                                                        <label><font style="vertical-align: inherit;"><font
                                                                style="vertical-align: inherit;">Tên thương
                                                            hiệu</font></font></label>
                                                        <input data-bind="textInput: name" type="text"
                                                               class="form-control" placeholder="Nhập tên thương hiệu">
                                                    </div>


                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.row -->

                                        </div>
                                    </div>
                                    <!-- /.post -->
                                </div>
                                <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <div class="row">
                            <div class="form-group"
                                 style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">
                                <%--                                                <button id="btnCheckInput"--%>
                                <%--                                                        class="btn btn-success">Lưu bài viết--%>
                                <%--                                                </button>--%>

                                <button id="btnAddNewNSP" data-bind="click: saveNewNSP.bind(this)" style="display: none"
                                        class="btn btn-success">Thêm mới
                                </button>
                                <button id="btnUpdateNewNSP" data-bind="click: updateNSP.bind(this)" class="btn btn-success " style="display: none" >Lưu Lại
                                </button>
                            </div>
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
                        <h3 class="card-title">Chi tiết nhóm sản phẩm</h3>
                    </div>
                    <div class="card-tools col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 mb-2 " style="margin-right: 0px">
                        <div class="input-group input-group-sm" style="display: flex">
                            <input id="inputSearchNSP" data-bind="value : keywordSearchNSP, valueUpdate: 'afterkeydown'" style="width: auto" type="text" name="table_search"
                                   class="form-control float-right"
                                   placeholder="Search">

                            <div class="input-group-append">
                                <button  data-bind="click: btnSearchNameNSP.bind(this,keywordSearchNSP())" class="btn btn-default"><i
                                        class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pb-1">
                    <div class="input-group-append col-12">
                        <button class="btn btn-success btn-show-add-course" data-bind="click: openNewNSP.bind(this)">
                            <i class="fas fa-plus"></i> Thêm mới
                        </button>
                    </div>
                </div>

                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: auto;">
                    <table class="table table-head-fixed table-hover">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Công cụ</th>
                        </tr>
                        </thead>
                        <tbody data-bind="foreach: listNhomSanPham" id="tableShowAllcourse">
                        <tr data-bind="attr:{'id':'attr'+id}"
                            style="cursor: pointer">
                            <td data-bind="text: ($index() + 1)"></td>
                            <td data-bind="text: ten"></td>
                            <td>
                                <div class="mailbox-controls">
                                    <!-- Check all button -->
                                    <div class="btn-group">
                                        <button title="xem" data-bind="click: $parent.showDetailNhomSanPham.bind(this,id)"
                                                type="button"
                                                class="btn btn-default btn-sm btn-show-add-course">
                                            <i class="fas fa-wrench"></i>
                                        </button>

                                        <button title="Xóa" type="button"
                                                data-bind=""
                                                class="btn btn-default btn-sm">
                                            <i class="far fa-trash-alt"></i>
                                        </button>

                                    </div>
                                    <!-- /.btn-group -->
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>


