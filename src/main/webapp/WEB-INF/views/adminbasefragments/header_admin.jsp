<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Navbar -->
<script type="text/javascript" src="admin/js/ajax/ajax_base.js"></script>
<nav class="main-header navbar navbar-expand navbar-white navbar-light" id="pageHeader">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="admin" class="nav-link">Home</a>
        </li>
        <%--        <li class="nav-item d-none d-sm-inline-block">--%>
        <%--            <a href="#" class="nav-link">Contact</a>--%>
        <%--        </li>--%>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="cart-item has-icon">

            <div class="dropdown">
                <div class="btn btn-secondary dropdown-toggle" data-bind="click: btnClickShowDropdown.bind(this)"
                     type="button" style="background: white"
                     id="dropdownMenu2"
                     aria-haspopup="true" aria-expanded="false">
                    <a  title="Giỏ hàng" class="header-cart-link is-small"
                       style="padding: 0!important;">
                        <span class="image-icon header-cart-icon">
                            <img width="25px" class="cart-img-icon hide-for-small" alt="Giỏ hàng"
                                 src="http://thatfruit.vn/wp-content/uploads/2020/02/cart.png">
                        </span>
                        <!-- .cart-img-inner -->
                    </a>
                    <span><label id="numberCart">6</label></span>
                </div>
                <!-- ko if: showDropDownListPrd() -->
                <div class="dropdown-menu-right" id="drdowListPrd"
                     style="min-width: 700px;position: absolute;top: 50px;background: white;-webkit-box-shadow: -1px 1px 11px 3px rgba(0,0,0,0.15);
                     -moz-box-shadow: -1px 1px 11px 3px rgba(0,0,0,0.15);box-shadow: -1px 1px 11px 3px rgba(0,0,0,0.15);display: none;">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <div class="form-group">
                            <h3>Đơn hàng chờ xử lý</h3>
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
                                <tbody data-bind="foreach: listPrdHeader">
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
                                                  data-bind="click: $root.clickDecrement.bind(this,id)">-</span>
                                            <input data-bind="textInput:soLuong"
                                                   style="width: 70px; height: 25px;border:1px solid #c3c3c3;"
                                                   id=demoInput type=number min=100 max=110>
                                            <span class="btn" style="width: 25px;display: flex;height: 25px;justify-content: space-around;
                                            align-items: center;cursor: pointer; border: 1px solid #c3c3c3;"
                                                  data-bind="click: $root.clickIncrement.bind(this,id)">+</span>
                                        </div>
                                        <button title="Xóa" type="button"
                                                data-bind="click: $parent.btnDeletedHeader.bind(this,id)"
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
                                            data-bind="text: tongTienTatCaHeader()"></span>₫
                                    </td>
                                    <%--                                        <td colspan="1" style="border-right: 1px solid #0000002e"></td>--%>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="row">
                            <div class="form-group"
                                 style="display: flex;justify-content: space-around;width: 100%;margin-bottom:0!important;padding: 10px 10px 20px 10px;">
                                <a href="http://localhost:9668/admin-gio-hang">
                                    <button type="submit" class="btn btn-success"
                                            style="width: 100%;color: white;padding: 10px 20px;font-size: 1rem"> Thanh
                                        toán
                                    </button>
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
                <!--/ko -->
            </div>

        </li>
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">--%>
        <%--                <i class="fas fa-th-large"></i>--%>
        <%--            </a>--%>
        <%--        </li>--%>
    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4" style="position: fixed">
    <!-- Brand Logo -->
    <a href="admin" class="brand-link">
        <img src="https://spec.edu.vn/client/image/logo.jpg" alt="AdminLTE Logo"
             class="brand-image img-circle elevation-3"
             style="opacity: .8;">
        <span class="brand-text font-weight-light">Task Manager</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="https://spec.edu.vn/admin/plugin_admin/dist/img/avatar5.png" class="img-circle elevation-2"
                     alt="User Image">
            </div>
            <div class="info" id="idBlockSidebar">

            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item " id="menu-2">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Quản lý nhân viên
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-nhan-vien" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Danh sách nhân viên</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-4">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Quản lý sản phẩm
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-san-pham" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p> Danh sách sản phẩm</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-6">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Báo cáo, thống kê
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-bao-cao" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Báo cáo doanh thu</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-5">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Quản lý bán hàng
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-gio-hang" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Thanh toán</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="admin-hoa-don-da-thanh-toan" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Hóa đơn đã thanh toán</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="menu-3">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-building"></i>
                        <p>
                            Khác
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="admin-nhom-san-pham" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhóm sản phẩm</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="admin-thuong-hieu" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Thương hiệu</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item" onclick="logOut()">
                    <span href="dang-nhap" class="nav-link" id="btn-dang-xuat" style="cursor: pointer">
                        <i class="nav-icon fas fa-sign-out-alt"></i>
                        <p>
                            Đăng xuất
                        </p>
                    </span>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>