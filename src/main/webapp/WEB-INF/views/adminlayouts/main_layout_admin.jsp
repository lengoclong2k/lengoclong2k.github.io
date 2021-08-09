<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--<script src="ajax/ajax_main.js"></script>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tiles:insertAttribute name="header_admin"/>
<main class="content-wrapper" style="height: auto;padding-top: 7.5px;padding-bottom: 7.5px">
    <tiles:insertAttribute name="body_admin"/>
</main>
<tiles:insertAttribute name="footer_admin"/>
