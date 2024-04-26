
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerAPI" value="/api/customer"/>
<c:url var="customerEditURL" value="/admin/customer-edit"/>
<html>
<head>
    <title>Chỉnh sửa thông tin</title>
</head>
<body>
<div class="main-content" id="main-container">
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
                    <c:if test ="${not empty customerEdit}">
                        <li class="active" >Chỉnh sửa khách hàng</li>
                    </c:if>
                    <c:if test ="${empty customerEdit}">
                        <li class="active" >Thêm khách hàng</li>
                    </c:if>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Thông tin khách hàng
                    </h1>
                </div><!-- /.page-header -->

                <!-- Bảng danh sách -->
                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="customerEdit"  id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" id="form-edit">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="fullName">Tên Khách Hàng </label>
                                    <div class="col-sm-9 mb-3">
                                        <form:input path="fullName" Class="form-control" id ="fullName"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="phone">SỐ điện thoại </label>
                                    <div class="col-sm-9 mb-3">
                                        <form:input class="form-control" id ="phone" path="phone" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="email">Email </label>
                                    <div class="col-sm-9 mb-3">
                                        <form:input class="form-control" id ="email" path="email" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="companyName">Tên công ty </label>
                                    <div class="col-sm-9 mb-3">
                                        <form:input class="form-control" id ="companyName" path="companyName" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="demand">Nhu cầu</label>
                                    <div class="col-sm-9 mb-3">
                                        <form:input class="form-control" id ="demand" path="demand" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="status">Tình trạng</label>
                                    <div class="col-sm-3 mb-3">
                                        <form:select class="form-control" path="status">
                                            <form:option value="">---Chọn Status---</form:option>
                                            <form:options items="${statusType}" />
                                        </form:select>
                                    </div>

                                    <%--<div class="col-sm-9 mb-3">--%>
                                        <%--<form:input class="form-control" id ="status" path="status" />--%>
                                    <%--</div>--%>
                                </div>




                                <di class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"></label>
                                    <div class="col-xs-9" style="margin: 3em 0 0;">
                                        <c:if test="${not empty customerEdit.id}">
                                            <input type="button" value="Cập nhật thông tin" class="btn btn-primary"
                                                   id="btnAddOrUpdateCustomer">
                                            <input type="button" value="Hủy" class="btn btn-primary"
                                                   id="cancelBtn">
                                        </c:if>
                                        <c:if test="${empty customerEdit.id}">
                                            <input type="button" value="Thêm khách hàng" class="btn btn-primary"
                                                   id="btnAddOrUpdateCustomer">
                                            <input type="button" value="Hủy" class="btn btn-primary"
                                                   id="cancelBtn">
                                        </c:if>
                                    </div>
                                </di>
                                <form:hidden path="id" id="customerId"/>
                            </form>
                        </div><!-- /.span -->
                    </form:form>

                </div>
            </div><!-- /.page-content -->

            <c:forEach var="item" items="${transactionType}">
                <div class="col-xs-12">
                    <div class="col-sm-12">
                        <h3 class="header smaller ligher blue">${item.value}</h3>
                        <button class="btn btn-lg btn-primary" onClick="transactionType('${item.key}', ${customerEdit.id})">
                            <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
                        </button>
                    </div>
                    <c:if test="${item.key == 'CSKH'}">
                        <div class="col-xs-12">
                            <table class="table table-striped table-bordered table-hover" id="simple-table">
                                <thead>
                                <tr>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                    <th>Chi tiết giao dịch</th>

                                    <th>Ngày sửa</th>
                                    <th>Người sửa</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="it" items="${transactionsCSKH}">
                                    <tr>
                                        <td>${it.createdDate}</td>
                                        <td>${it.createdBy}</td>
                                        <td>${it.note}</td>
                                        <td>${it.modifiedDate}</td>
                                        <td>${it.modifiedBy}</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Sửa thông tin giao dịch"
                                                        onClick="UpdateTransaction(event,${it.id})" data-note="${it.note}">
                                                        <i class="ace-icon glyphicon glyphicon-list"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${item.key == 'DDX'}">

                        <div class="col-xs-12">
                            <table class="table table-striped table-bordered table-hover" id="simpleTable">
                                <thead>
                                <tr>
                                    <th>Ngày tạo</th>
                                    <th>Người tạo</th>
                                    <th>Chi tiết giao dịch</th>
                                    <th>Ngày sửa</th>
                                    <th>Người sửa</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="it" items="${transactionsDDX}">
                                    <tr>
                                        <td>${it.createdDate}</td>
                                        <td>${it.createdBy}</td>
                                        <td>${it.note}</td>
                                        <td>
                                                ${it.modifiedDate}
                                        </td>
                                        <td>
                                                ${it.modifiedBy}
                                        </td>


                                    <%--<td>${it.modifiedDate}</td>--%>
                                        <%--<td>${it.modifiedBy}</td>--%>

                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Sửa thông tin giao dịch"
                                                        onClick="UpdateTransaction(event, ${it.id})" data-note="${it.note}">
                                                        <i class="ace-icon glyphicon glyphicon-list"></i>
                                                </button>

                                            </div>
                                        </td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div><!-- /.main-content -->
    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">
            <!--Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"></button>
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>
                <div class="modal-body">
                    <%--<form:form modelAttribute="transactionsDTO"   method="GET">--%>
                        <div class="form-group has-success">
                            <label for="transactionDetails" class="col-xs-12 col-sm-3 control-label no-padding-right">
                                Chi tiết giao dịch
                            </label>
                            <div class="col-xs-12 col-sm-9">
                                <span class="block input-icon input-icon-right">
                                    <input type="text" class="width-100" id="transactionDetails" value="">
                                      <%--<form:input class="form-control" id ="transactionDetails" path="note" value=""/>--%>
                                </span>
                            </div>
                        </div>
                    <%--</form:form>--%>
                    <input type="hidden" name="customerId" id="customerId" value="">
                    <input type="hidden" name="code" id="code" value="">
                    <input type="hidden" name="id" id="id" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <%--<c:if test="${not empty transGetId.id}">--%>
                        <%--<button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Update giao dịch</button>--%>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${empty transGetId.id}">--%>
                        <%--<button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>--%>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>--%>
                    <%--</c:if>--%>
                </div>
            </div>
        </div>
    </div>
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<script>

    function transactionType(code, customerId){
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function UpdateTransaction(event,id){
        var note = $(event.currentTarget).data('note');
        $('#transactionDetails').val(note);
        $('#transactionTypeModal').modal();
        $('#id').val(id);
        // $('#transactionTypeModal').modal();
        // $('#id').val(id);
    }

    $('#btnAddOrUpdateTransaction').click(function (e){
        e.preventDefault();
        var data = {};
        data['id'] = $('#id').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['transactionDetails'] = $('#transactionDetails').val();
        // customerId + codeTransaction + TransactionDetal
        addTransaction(data);
    })

    function addTransaction(data){
        var customerId = $('#customerId').val();

        $.ajax({
            type : "POST",
            url : '${customerAPI}/transaction',
            data : JSON.stringify(data),
            // datatype : "JSON"
            contentType : "application/json",
            success: function(){
                console.log("Success");
                alert("Add Transaction Success");
                window.location.reload(true);
            },
            error : function(){
                console.log("Failed");
            }
        });
    }

    $('#btnCancel').click(function(){
        window.location.href = "/admin/customer-list";
    });



    $('#btnAddOrUpdateCustomer').click(function(){
        // take dta
            var data = {};
            var formData = $('#listForm').serializeArray();
           $.each(formData, function(i, v){
                data[""+ v.name+ ""] = v.value;
           });

            addOrUpdateCustomer(data)
     });

    function addOrUpdateCustomer(data){

        $.ajax({
            type: "POST",
            url: "${customerAPI}", //call api
            data: JSON.stringify(data), // transfer data to Json , client
            contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
            // định dạng respond là dạng gì
            dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
            success: function (response) {
                console.log("success"); // respond : Backend gửi lên if success
                window.location.href = "<c:url value='/admin/customer-list'/>";
            },
            error: function(response){
                console.log("error");
                console.log(response);
                alert("Đã xảy ra lỗi khi thêm/cập nhật khách hàng");
            }
        });
    }
    $('#cancelBtn').click(function(){
        window.location.href = "/admin/customer-list";
    });

</script>
</body>
</html>
