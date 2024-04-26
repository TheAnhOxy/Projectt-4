
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<html>
<head>
    <title>Danh Sách Tòa Nhà</title>
</head>
<body>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Quản lý tòa nhà</li>
                </ul><!-- /.breadcrumb -->
            </div>



            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Danh sách tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->


                <div class="row">

                    <div class="col-xs-12">
                        <div class="widget-box">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">


                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style="font-family:'Times New Roman', Times" >
                                <div class="widget-main">
                                     <%----%>
                                    <form:form  id="listForm" modelAttribute="modelSearch"  action="${buildingListURL}" method="GET">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <div>
                                                            <label class="name" for="name">Tên tòa nhà</label>
                                                            <%--<input id="name" type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                             <form:input class="form-control"  path="name"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <div>
                                                            <label for="floorArea" class="name" >Diện tích sàn</label>
                                                            <input type="number" id="floorArea" class="form-control" name="floorArea" value="${modelSearch.floorArea}">
                                                            <%--<form:input class="form-control" path="floorArea"/>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-2">
                                                        <div>
                                                            <label class="name">Quận</label>
                                                            <%--<form:select class="form-control" path="district">--%>
                                                                <%--<form:option value="">---Chọn Quận---</form:option>--%>
                                                                <%--<form:options items="${districts} "/>--%>
                                                            <%--</form:select>--%>
                                                            <form:select class="form-control" path="district">
                                                                <form:option value="">---Chọn Quận---</form:option>
                                                                <form:options items="${districts}" />
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <div>
                                                            <label class="name">Phường</label>
                                                            <%--<input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                            <form:input class="form-control" path="ward"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <div>
                                                            <label class="name">Đường</label>
                                                            <%--<input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                            <form:input class="form-control" path="street"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-4">
                                                        <label class="name">Số tầng hầm</label>
                                                        <%--<input type="text" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">--%>
                                                        <form:input class="form-control" path="numberOfBasement"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name">Hướng</label>
                                                        <%--<input type="text" class="form-control" name="direction" value="${modelSearch.direction}">--%>
                                                        <form:input class="form-control" path="direction"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label class="name" for="level">Hạng</label>
                                                        <%--<input type="number" class="form-control" name="level" value="${modelSearch.level}">--%>
                                                        <form:input class="form-control" id="level" path="level"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div  class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích từ</label>
                                                        <%--<input type="text" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">--%>
                                                        <form:input class="form-control" path="areaFrom"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Diện tích đến</label>
                                                        <%--<input type="text" class="form-control" name="areaTo" value="${modelSearch.areaTo}">--%>
                                                        <form:input class="form-control" path="areaTo"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê từ</label>
                                                        <%--<input type="number" class="form-control"  name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">--%>
                                                        <form:input class="form-control" path="rentPriceFrom"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label class="name">Giá thuê đến</label>
                                                        <%--<input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">--%>
                                                        <form:input class="form-control" path="rentPriceTo"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div  class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-5">
                                                        <label class="name">Tên quản lý</label>
                                                        <%--<input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">--%>
                                                        <form:input class="form-control" path="managerName"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label class="name">SĐT quản lý</label>
                                                        <%--<input type="text" class="form-control" name="managerPhone" value="${modelSearch.managerPhone}">--%>
                                                        <form:input class="form-control" path="managerPhone"/>
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <security:authorize access="hasRole('MANAGER')">
                                                            <div>
                                                                <label class="name">Nhân Viên</label>
                                                                <form:select class="form-control" path="staffId">
                                                                    <%--value đổ lên từ db--%>
                                                                    <form:option value="">---Chọn Nhân Viên---</form:option>
                                                                    <form:options items="${ListStaffs}"/>
                                                                </form:select>

                                                            </div>
                                                        </security:authorize>

                                                    </div>
                                                </div>
                                            </div>
                                            <div  class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6"> 
                                                        <form:checkboxes path="type" items="${typeCodes}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div  class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-danger btn-xs " id="btnSearchBuilding">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                            </svg>
                                                            Tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                            <div class="pull-right">
                                <a href="/admin/building-edit">
                                        <button class="btn btn-white btn-info" title="Thêm tòa nhà">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                            </svg>
                                        </button>
                                 </a>

                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-white btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </security:authorize>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bảng danh sách -->
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <table id="tableList" style="margin: 3em 0 0;" class="table table-striped table-bordered table-hover">
                                    <thead style="font-family: 'Times New Roman', Times, serif;">
                                        <%--<tr>--%>
                                            <%--<th class="center">--%>
                                                <%--<label class="pos-rel">--%>
                                                    <%--<input type="checkbox" class="ace">--%>
                                                    <%--<span class="lbl"></span>--%>
                                                <%--</label>--%>
                                            <%--</th>--%>
                                            <%--<th>Tên tòa nhà</th>--%>
                                            <%--<th>Địa chỉ</th>--%>
                                            <%--<th>Số tầng hầm</th>--%>
                                            <%--<th>Tên quản lý</th>--%>
                                            <%--<th>Số điện thoại quản lý</th>--%>
                                            <%--<th>Diện tích sàn</th>--%>
                                            <%--<th>Diện tích trống</th>--%>
                                            <%--<th>Diện tích thuê</th>--%>
                                            <%--<th>Giá thuê</th>--%>
                                            <%--<th>Phí dịch vụ</th>--%>
                                            <%--<th>Phí môi giới</th>--%>
                                            <%--<th>Mô tả</th>--%>
                                        <%--</tr>--%>
                                    </thead>
                                    <tbody>
                                        <%--<c:forEach var="item" items="${buildingList}">--%>
                                            <%--<tr>--%>
                                                <%--<td class="center">--%>
                                                    <%--<label class="pos-rel">--%>
                                                        <%--<input type="checkbox" class="ace" name="checkList" value="${item.id}" id="checkbox_$(item.id)">--%>
                                                        <%--<span class="lbl"></span>--%>
                                                    <%--</label>--%>
                                                <%--</td>--%>
                                                <%--<td> ${item.name} </td>--%>
                                                <%--<td> ${item.address} </td>--%>
                                                <%--<td> ${item.numberOfBasement} </td>--%>
                                                <%--<td> ${item.managerName} </td>--%>
                                                <%--<td> ${item.managerPhone} </td>--%>
                                                <%--<td> ${item.floorArea} </td>--%>
                                                <%--<td> ${item.emptyArea} </td>--%>
                                                <%--<td> ${item.rentArea} </td>--%>
                                                <%--<td> ${item.rentPrice} </td>--%>
                                                <%--<td> ${item.serviceFee} </td>--%>
                                                <%--<td> ${item.brokerageFee} </td>--%>
                                                <%--<td>--%>
                                                    <%--<div class="hidden-sm hidden-xs btn-group">--%>
                                                        <%--<button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">--%>
                                                            <%--<i class="ace-icon glyphicon glyphicon-list"></i>--%>
                                                        <%--</button>--%>

                                                        <%--<a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id} ">--%>
                                                            <%--<i class="ace-icon fa fa-pencil bigger-120"></i>--%>
                                                        <%--</a>--%>

                                                        <%--<button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">--%>
                                                            <%--<i class="ace-icon fa fa-trash-o bigger-120"></i>--%>
                                                        <%--</button>--%>
                                                    <%--</div>--%>
                                                <%--</td>--%>
                                            <%--</tr>--%>
                                        <%--</c:forEach>--%>

                                    <form:form modelAttribute="buildingList">
                                        <display:table name="buildingList.listResult" cellspacing="0" cellpadding="0"
                                                       requestURI="${buildingListURL}" partialList="true" sort="external"
                                                       size="${buildingList.totalItems}" defaultsort="2" defaultorder="ascending"
                                                       id="tableList" pagesize="${buildingList.maxPageItems}"
                                                       export="false"
                                                       class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                       style="margin: 3em 0 1.5em;">
                                            <display:column title="<fieldset class='form-group'>
                                                            <input type='checkbox' id='checkAll' class='check-box-element'>
                                                            </fieldset>" class="center select-cell"
                                                            headerClass="center select-cell">
                                                <fieldset>
                                                    <input type="checkbox" name="checkList" value="${tableList.id}"
                                                           id="checkbox_${tableList.id}" class="check-box-element"/>
                                                </fieldset>
                                            </display:column>
                                            <display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>
                                            <display:column headerClass="text-left" property="address" title="địa chỉ"/>
                                            <display:column headerClass="text-left" property="numberOfBasement" title="SỐ tầng hầm"/>
                                            <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                                            <display:column headerClass="text-left" property="managerPhone" title="SĐT Quản LÝ"/>
                                            <display:column headerClass="text-left" property="floorArea" title="Diện tích sàn"/>
                                            <display:column headerClass="text-left" property="emptyArea" title="Diện tích trống"/>
                                            <display:column headerClass="text-left" property="rentArea" title="Diện tích thuê"/>
                                            <display:column headerClass="text-left" property="brokerageFee" title="Phí môi giới"/>

                                            <display:column headerClass="col-actions"  title="Thao tác">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <a title="Giao tòa nhà" class = "btn btn-xs btn-suscess" onclick="assignmentBuilding(${tableList.id})">
                                                        <i class="ace-icon glyphicon glyphicon-list"></i>
                                                    </a>
                                                </security:authorize>


                                                <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${tableList.id} ">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </a>

                                                <security:authorize access="hasRole('MANAGER')">
                                                    <a class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
                                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                    </a>
                                                </security:authorize>

                                            </display:column>
                                        </display:table>
                                    </form:form>

                                    </tbody>
                                </table>
                            </div><!-- /.span -->
                        </div><!-- /.row -->

                        <div class="hr hr-18 dotted hr-double"></div>

                        <!--hết-->


                        <div class="hr hr-18 dotted hr-double"></div>

                        <div id="modal-table" class="modal fade" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header no-padding">
                                        <div class="table-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                <span class="white">×</span>
                                            </button>
                                            Results for "Latest Registered Domains
                                        </div>
                                    </div>

                                    <div class="modal-body no-padding">
                                        <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                                            <thead>
                                            <tr>
                                                <th>Domain</th>
                                                <th>Price</th>
                                                <th>Clicks</th>

                                                <th>
                                                    <i class="ace-icon fa fa-clock-o bigger-110"></i>
                                                    Update
                                                </th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <tr>
                                                <td>
                                                    <a href="#">ace.com</a>
                                                </td>
                                                <td>$45</td>
                                                <td>3,330</td>
                                                <td>Feb 12</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">base.com</a>
                                                </td>
                                                <td>$35</td>
                                                <td>2,595</td>
                                                <td>Feb 18</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">max.com</a>
                                                </td>
                                                <td>$60</td>
                                                <td>4,400</td>
                                                <td>Mar 11</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">best.com</a>
                                                </td>
                                                <td>$75</td>
                                                <td>6,500</td>
                                                <td>Apr 03</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">pro.com</a>
                                                </td>
                                                <td>$55</td>
                                                <td>4,250</td>
                                                <td>Jan 21</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="modal-footer no-margin-top">
                                        <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                            <i class="ace-icon fa fa-times"></i>
                                            Close
                                        </button>

                                        <ul class="pagination pull-right no-margin">
                                            <li class="prev disabled">
                                                <a href="#">
                                                    <i class="ace-icon fa fa-angle-double-left"></i>
                                                </a>
                                            </li>

                                            <li class="active">
                                                <a href="#">1</a>
                                            </li>

                                            <li>
                                                <a href="#">2</a>
                                            </li>

                                            <li>
                                                <a href="#">3</a>
                                            </li>

                                            <li class="next">
                                                <a href="#">
                                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div>

            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <%--<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">--%>
        <%--<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>--%>
    <%--</a>--%>
<%--</div><!-- /.main-container -->--%>

<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table   class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Tên Nhân Viên</th>
                    </tr>
                    </thead>

                    <tbody class="center">

                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

    <script>
        function assignmentBuilding(buildingId){
            // khi nhan nut giao toa nha : dau tien co ID cua toa nha . Lấy ID đó đưa vào hideden (vao value )
            $('#assignmentBuildingModal').modal();
            loadStaff(buildingId);
            $('#buildingId').val(buildingId); // đưa vào value, cho value = tòa nhà đang đưuọc giao
        }
        // load staff
        function loadStaff(buildingId){
            $.ajax({
                // add building
                type: "GET", // HTTP method, add
                url: "${buildingAPI}/" + buildingId + '/staffs', //call api
                // data: JSON.stringify(data), // transfer data to Json , client
                // contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
                // định dạng respond là dạng gì
                dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
                success: function (response) {
                    var row = '';
                    $.each(response.data, function (index, item) {
                        row += '<tr>';
                        row += ' <td class="text-center"><input type="checkbox"   value=' + item.staffId + ' id="checkbox_' +  item.staffId + '" class = "check-box-element "'    + item.checked + '/></td>';
                        row += '<td class="text-center" >' + item.fullName + '</td>';
                        row += '</tr>';
                    });
                    $('#staffList tbody').html(row);
                    console.info("success"); // respond : Backend gửi lên if success
                },
                error: function(response){
                    console.log("error");
                    <%--window.location.href = "<c:url value="/admin/building-list?message=error"/>";--%>
                    <%--console.log(response);--%>
                }
            });

        }
        $('#btnassignmentBuilding').click(function(e){
            e.preventDefault();
            var data = {}; // cấu trúc JSON
            // lấy 1 buildingID
            data['buildingId'] = $('#buildingId').val();
            var staffs = $('#staffList').find('tbody input[type="checkbox"]:checked').map(function(){
                return $(this).val();
            }).get();
            // Danh sách nhân viên ( who was checked )
            data['staffs'] = staffs;
            if( data['staffs']  != " "){
                assigment(data);
            }
            console.log("OK");
        });

        function assigment(data){

            $.ajax({
                // add building
                type: "POST", // HTTP method, add
                url: "${buildingAPI}/" +  'assigment' , //call api
                 data: JSON.stringify(data), // transfer data to Json , client
                contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
                // định dạng respond là dạng gì
                dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
                success: function (response) {
                    console.log("success");
                    window.location.href = "<c:url value="/admin/building-list"/>";
                },
                error: function(response){
                    window.location.href = "<c:url value="/admin/building-list?message=success"/>";
                    console.log(response);
                }
            });
        }

        $('#btnSearchBuilding').click(function(e){
            e.preventDefault();
            // submit leen params
            $('#listForm').submit();
        });
        // xoas 1 tòa nhà
        function deleteBuilding(id){
            var building = [id];
            deleteBuildings(building);
        }
        // xóa nhiều tòa nhà
        $('#btnDeleteBuilding').click(function(e){
            e.preventDefault();
            var buildingIds = $('#tableList').find('tbody input[type="checkbox"]:checked').map(function(){
                return $(this).val();
            }).get();
            deleteBuildings(buildingIds);
        });


        function deleteBuildings(data){
            $.ajax({
                // add building
                type: "DELETE", // HTTP method, add
                url: "${buildingAPI}/delete/" + data, //call api
                // data: JSON.stringify(data), // transfer data to Json , client
                // contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
                // // định dạng respond là dạng gì
                // dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
                success: function (response) {
                    // console.log("success"); // response : Backend gửi lên if success
                    window.location.href = "<c:url value="/admin/building-list?message=success"/>";
                    console.log(response);
                },
                error: function(response){
                    // console.log("error");
                    window.location.href = "<c:url value="/admin/building-list?message=error"/>";
                    console.log(response);
                }
            });
        }
    </script>
</body>
</html>
