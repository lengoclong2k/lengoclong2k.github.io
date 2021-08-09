<%--
  Created by IntelliJ IDEA.
  User: HieuPC
  Date: 2/26/2021
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="admin/js/ajax/ajax_login.js"></script>
<div class="container" style="height: 100%">

    <div class="block-sign row"
         style="margin: auto;display: flex;justify-content: space-around;align-items: center;height: 100%;">
        <div class="modal-content col-lg-4 col-md-6 col-sm-10 col-xl-4 col-11" style="min-width: 200px;">
            <ul class="nav nav-tabs head-block-sign" role="tablist">
                <li class="nav-item" style="flex: 1">
                    <a class="nav-link active" id="sign-in-tab" data-toggle="tab" href="#sign-in-div" role="tab">Đăng
                        nhập</a>
                </li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active show in" id="sign-in-div" role="tabpanel">
                    <div class="card-body">
                        <div class="form-group">
                            <input data-bind="textInput: nameDN" style="font-size: 1rem" type="email" class="form-control border-ip-none-tlb"
                                   id="emailLog"
                                   placeholder="Nhập email" title="email">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập email. </p>
                            </label>
                        </div>
                        <div class="form-group">
                            <input data-bind="textInput: passDN" style="font-size: 1rem" type="password" class="form-control border-ip-none-tlb"
                                   id="passwordLog"
                                   placeholder="Nhập mật khẩu">
                            <label class="d-none">
                                <p style="color: red;font-size: 0.7rem">Bạn chưa nhập mật khẩu. </p>
                            </label>
                        </div>
                        <div class="form-check">
                            <input style="position: unset" type="checkbox" class="form-check-input" id="exampleCheck">
                            <label style="font-size: 1rem" class="form-check-label" ><font
                                    style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Lưu mật khẩu</font></font></label>
                        </div>
                    </div>
                    <div class="card-footer " style="display: flex;background: none;">
                        <button class="btn btn-success" style="margin: auto;min-width: 100%" data-bind="click: btnDangNhap.bind(this)" >Đăng nhập</button>
                    </div>
                </div>


            </div>
        </div>
        <%--        <div class="card card-primary col-lg-8 col-md-6 col-sm-10 col-xl-6 col-11" style="min-width: 250px;">--%>
        <%--            <div class="card-header">--%>
        <%--                <h3 class="card-title" style="display: flex;justify-content: space-between"><span>Đăng ký</span></h3>--%>
        <%--            </div>--%>
        <%--            <!-- /.card-header -->--%>
        <%--            <!-- form start -->--%>

        <%--        </div>--%>
    </div>
</div>