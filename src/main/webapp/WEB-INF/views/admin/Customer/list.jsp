
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"/>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<html>
<head>
    <title>Danh Sách Khách hàng</title>
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
                <li class="active">Quản lý khách hàng</li>
            </ul><!-- /.breadcrumb -->
        </div>



        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh sách khách hàng
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
                                <form:form  id="listForm" modelAttribute="modelSearch"  action="${customerListURL}" method="GET">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <div>
                                                        <label class="name" for="fullName">Tên khách hàng</label>
                                                            <%--<input id="name" type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                        <form:input class="form-control"  path="fullName"/>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4">
                                                    <div>
                                                        <label for="phone" class="name" >Di động</label>
                                                        <%--<input type="number" id="floorArea" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                            <form:input class="form-control" path="phone"/>
                                                    </div>
                                                </div>
                                                <div class="col-xs-4">
                                                    <div>
                                                        <label for="phone" class="name" >Email</label>
                                                            <%--<input type="number" id="floorArea" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input class="form-control" path="email"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div  class="form-group">
                                            <div class="col-xs-12">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <div class="col-xs-2">
                                                        <label class="name">Nhân Viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <%--value đổ lên từ db--%>
                                                            <form:option value="">---Chọn Nhân Viên---</form:option>
                                                            <form:options items="${staffnaps}"/>
                                                        </form:select>
                                                    </div>
                                                </security:authorize>
                                            </div>
                                        </div>

                                        <div  class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button type="button" class="btn btn-danger btn-xs " id="btnSearchCustomer">
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
                            <a href="/admin/customer-edit">
                                <security:authorize access="hasRole('MANAGER')">
                                    <button class="btn btn-white btn-info" title="Thêm khách hàng">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </security:authorize>
                            </a>

                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-white btn-danger" title="Xóa khách hàng" id="btnDeleteCustomer">
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
                                            <%--<input type="checkbox" class="ace" >--%>
                                            <%--<span class="lbl"></span>--%>
                                        <%--</label>--%>
                                    <%--</th>--%>
                                    <%--<th>Tên khách hàng</th>--%>
                                    <%--<th>Di động</th>--%>
                                    <%--<th>Email</th>--%>
                                    <%--<th>Nhu cầu</th>--%>
                                    <%--<th>Người thêm</th>--%>
                                    <%--<th>Ngày thêm</th>--%>
                                    <%--<th>Tình trạng</th>--%>
                                    <%--<th>Thao tác</th>--%>
                                <%--</tr>--%>
                                </thead>
                                <tbody>
                                <%--<c:forEach var="item" items="${customers}">--%>
                                    <%--<tr>--%>
                                        <%--<td class="center">--%>
                                            <%--<label class="pos-rel">--%>
                                                <%--<input type="checkbox" class="ace" name="checkList" value="${item.id}" id="checkbox_$(item.id)">--%>
                                                <%--<span class="lbl"></span>--%>
                                            <%--</label>--%>
                                        <%--</td>--%>
                                        <%--<td> ${item.fullName} </td>--%>
                                        <%--<td> ${item.phone} </td>--%>
                                        <%--<td> ${item.email} </td>--%>
                                        <%--<td> ${item.demand} </td>--%>
                                        <%--<td> ${item.createdBy} </td>--%>
                                        <%--<td> ${item.modifiedDate} </td>--%>
                                        <%--<td> ${item.status} </td>--%>
                                        <%--<td>--%>
                                            <%--<div class="hidden-sm hidden-xs btn-group">--%>
                                                <%--<security:authorize access="hasRole('MANAGER')">--%>
                                                    <%--<button class="btn btn-xs btn-success" title="Giao Khách hàng" onclick="assignmentCustomer(${item.id})">--%>
                                                        <%--<i class="ace-icon glyphicon glyphicon-list"></i>--%>
                                                    <%--</button>--%>
                                                <%--</security:authorize>--%>

                                                <%--<a class="btn btn-xs btn-info" title="Sửa Thông tin khách hàng" href="/admin/customer-edit-${item.id} ">--%>
                                                    <%--<i class="ace-icon fa fa-pencil bigger-120"></i>--%>
                                                <%--</a>--%>
                                                <%--<security:authorize access="hasRole('MANAGER')">--%>
                                                    <%--<button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${item.id})">--%>
                                                        <%--<i class="ace-icon fa fa-trash-o bigger-120"></i>--%>
                                                    <%--</button>--%>
                                                <%--</security:authorize>--%>
                                            <%--</div>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                <%--</c:forEach>--%>
                                    <form:form modelAttribute="customers">
                                        <display:table name="customers.listResult" cellspacing="0" cellpadding="0"
                                                       requestURI="${customerListURL}" partialList="true" sort="external"
                                                       size="${customers.totalItems}" defaultsort="2" defaultorder="ascending"
                                                       id="tableList" pagesize="${customers.maxPageItems}"
                                                       export="false"
                                                       class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                       style="margin: 3em 0 1.5em;">
                                            <display:column title="<fieldset class='form-group'>
                                                                <input type='checkbox' id='checkAll' class='check-box-element'>
                                                                </fieldset>" class="center select-cell"
                                                            headerClass="center select-cell">
                                                <fieldset id="checkHi">
                                                    <input type="checkbox" name="checkList" value="${tableList.id}"
                                                           id="checkbox_${tableList.id}" class="check-box-element"/>
                                                </fieldset>
                                            </display:column>

                                            <display:column headerClass="text-left" property="fullName" title="Tên khách hàng"/>
                                            <display:column headerClass="text-left" property="phone" title="Di động"/>
                                            <display:column headerClass="text-left" property="email" title="Email"/>
                                            <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                                            <display:column headerClass="text-left" property="createdBy" title="người tạo"/>
                                            <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                                            <%--<display:column headerClass="text-left" property="modifiedBy" title="người sửa"/>--%>
                                            <%--<display:column headerClass="text-left" property="modifiedDate" title="Ngày sửa"/>--%>
                                            <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                                            <display:column headerClass="col-actions"  title="Thao tác">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <a title="Giao khách hàng" class = "btn btn-xs btn-suscess" onclick="assignmentCustomer(${tableList.id})">
                                                        <i class="ace-icon glyphicon glyphicon-list"></i>
                                                    </a>
                                                </security:authorize>


                                                <a class="btn btn-xs btn-info" title="Sửa thông tin khách hàng" href="/admin/customer-edit-${tableList.id} ">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </a>

                                                <security:authorize access="hasRole('MANAGER')">
                                                    <a class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
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

<div class="modal fade" id="assignmentCustomerModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
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
                <input type="hidden" id="customerId" name="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassignmentCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<script>


    function assignmentCustomer(customerId){

        $('#assignmentCustomerModal').modal();
        loadStaff(customerId);
        $('#customerId').val(customerId); // đưa vào value, c
    }
    // load staff
    function loadStaff(customerId){
        $.ajax({

            type: "GET", // HTTP method, add
            url: "${customerAPI}/" + customerId + '/staffs', //call api
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
                <%--console.log(response);--%>
            }
        });

    }
    $('#btnassignmentCustomer').click(function(e){
        e.preventDefault();
        var data = {}; // cấu trúc JSON
        // lấy 1 customerId
        data['customerId'] = $('#customerId').val();

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
            type: "POST", // HTTP method, add
            url: "${customerAPI}/" +  'assigment' , //call api
            data: JSON.stringify(data), // transfer data to Json , client
            contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
            // định dạng respond là dạng gì
            dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
            success: function (response) {
                console.log("success");
                window.location.href = "<c:url value="/admin/customer-list"/>";
            },
            error: function(response){
                window.location.href = "<c:url value="/admin/customer-list?message=success"/>";
                console.log(response);
            }
        });
    }

    $('#btnSearchCustomer').click(function(e){
        e.preventDefault();
        // submit leen params
        $('#listForm').submit();
    });
    // xóa 1 customer
    function deleteCustomer(id){
        var customer = [id];
        deleteCustomers(customer);
    }

    $('#btnDeleteCustomer').click(function(e){
        e.preventDefault();
        var customerIds = $('#checkHi input[type="checkbox"]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteCustomers(customerIds);
    });


    function deleteCustomers(data){
        $.ajax({
            type: "POST", // HTTP method, add
            url: "${customerAPI}/delete/" + data, //call api
            // data: JSON.stringify(data), // transfer data to Json , client
            // contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
            // // định dạng respond là dạng gì
            // dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
            success: function (response) {
                // console.log("success"); // response : Backend gửi lên if success
                window.location.href = "<c:url value="/admin/customer-list?message=success"/>";
                console.log(response);
            },
            error: function(response){
                // console.log("error");
                window.location.href = "<c:url value="/admin/customer-list?message=error"/>";
                console.log(response);
            }
        });
    }

</script>

</body>

</html>
