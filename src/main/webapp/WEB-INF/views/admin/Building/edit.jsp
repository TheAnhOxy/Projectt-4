
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm Tòa Nhà</title>
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
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
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
                    </div>
                </div>

                <!-- Bảng danh sách -->
                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" >
                                <di class="form-group">
                                    <label class="col-xs-3">Tên tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Quận</label>
                                    <div class="col-xs-2">
                                        <label class="name"></label>
                                            <%--<form:select class="form-control" path="district">--%>
                                            <%--<form:option value="">---Chọn Quận---</form:option>--%>
                                            <%--<form:options items="${districts} "/>--%>
                                            <%--</form:select>--%>
                                        <form:select class="form-control" path="district">
                                            <form:option value="">---Chọn Quận---</form:option>
                                            <form:options items="${districts}" />
                                        </form:select>
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Phường</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="ward" name="ward" >--%>
                                            <form:input class="form-control" path="ward" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="street" name="street" >--%>
                                            <form:input class="form-control" path="street" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3" for="ketcau">Kết cấu</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="structure" name="structure"  value="">--%>
                                        <form:input class="form-control" id="ketcau" path="structure" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3" for="numberofbasement">Số tầng hầm</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="numberofbasement" name="numberofbasement" >--%>
                                            <form:input class="form-control" id="numberofbasement" path="numberOfBasement" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="floorarea" name="floorarea" >--%>
                                            <form:input class="form-control" path="floorArea" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="direction" name="direction" >--%>
                                            <form:input class="form-control" path="direction" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="level" name="level" >--%>
                                            <form:input class="form-control" path="level" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="rentarea" name="rentarea" value="">--%>
                                        <form:input class="form-control" path="rentArea" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Giá thuê</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="rentprice" name="rentprice" value="">--%>
                                        <form:input class="form-control" path="rentPrice" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="rentpricedescription" name="rentpricedescription" value="">--%>
                                            <form:input class="form-control" path="rentPriceDiscription" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="servicefee" name="servicefee" value="">--%>
                                        <form:input class="form-control" path="servicefee" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="carfee" name="carfee" value="">--%>
                                        <form:input class="form-control" path="carfee" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Phí mô tô</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="motorbikefee" name="motorbikefee" value="">--%>
                                        <form:input class="form-control" path="motoFee" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="overtimefee" name="overtimefee" value="">--%>
                                            <form:input class="form-control" path="overtimeFee" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="number" id="electricityfee" name="electricityfee" value="">--%>
                                        <form:input class="form-control" path="electricityFee" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Đặt cọc</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="deposit" name="deposit" value="">--%>
                                        <form:input class="form-control" path="deposit" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Thanh toán</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="payment" name="payment" value="">--%>
                                            <form:input class="form-control" path="payment" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Thời hạn thuê</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="renttime" name="renttime" value="">--%>
                                            <form:input class="form-control" path="rentTime" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Thời gian trang trí</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="decorationtime" name="decorationtime" value="">--%>
                                        <form:input class="form-control" path="decorationTime" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Tên quản lý</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="managername" name="managername" value="">--%>
                                        <form:input class="form-control" path="managerName" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">SĐT quản lý</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="managerphonenumber" name="managerphonenumber" value="">--%>
                                            <form:input class="form-control" path="managerPhone" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="brokeragefee" name="brokeragefee" value="">--%>
                                            <form:input class="form-control" path="brokerageFee" />
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Loại tòa nhà</label>
                                    <div class="col-xs-9">
                                        <%--<c:forEach items="${typeCodes}" var="type">--%>
                                        <label>

                                            <c:if test="${ empty buildingEdit.id}">
                                                <form:checkboxes items="${typeCodes}" path="type" />
                                            </c:if>
                                            <c:if test="${not empty buildingEdit.id}">
                                                <form:checkboxes items="${typeCodes}" path="selectedTypes" />
                                            </c:if>
                                            <%--<input type="checkbox" name="type"  ${buildingEdit.selectedTypes.contains(type) ? 'checked' : ''} />--%>
                                                <%--${type}--%>
                                                <%--<form:checkboxes  items="${typeCodes}" path="type" />--%>

                                        </label>
                                        <%--</c:forEach>--%>
                                                <%--<form:checkboxes  items="${typeCodes}" path="type" />--%>
                                    </div>
                                </di>

                                <di class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
                                        <%--<input class="form-control" type="text" id="name" name="name" value="">--%>
                                        <form:input class="form-control" path="note" />
                                    </div>
                                </di>

                                <div class="form-group">
                                    <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                    <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                    <div class="col-sm-9">
                                        <c:if test="${not empty buildingEdit.avatar}">
                                            <c:set var="imagePath" value="/repository${buildingEdit.avatar}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.avatar}">
                                            <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                    </div>
                                </div>


                                <di class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9" style="margin: 3em 0 0;">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                            <button type="button" class="btn btn-primary " id="btnCancel">Hủy tòa nhà</button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm mới</button>
                                            <button type="button" class="btn btn-primary " id="btnCancel">Hủy tòa nhà</button>
                                        </c:if>
                                    </div>
                                </di>
                                <form:hidden path="id" id="buildingId"/>
                            </form>
                        </div><!-- /.span -->
                    </form:form>

                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<script>
    var imageBase64 = '';
    var imageName = '';

    $('#btnAddOrUpdateBuilding').click(function(){
        // take dta
        var data = {};
        var type = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function(i, v){
            if(v.name == 'type'){
                type.push(v.value);
            }else{
                data[""+ v.name+ ""] = v.value;
            }

            if (imageBase64 !== '') {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        });
        var check = [];



        // data['type'] = type.join(",");
        // data['selectedTypes'] = type;

        // để check data gửi về sv
        // if(data['name'] != "")
        // kiểm tra id
        var buildingId = $('#buildingId').val();
        if(buildingId != ""){
            if(type.length > 0){
                data['type'] = type.join(",");
                // addOrUpdateBuilding(data);
            }
            else{
                var checkedCheckboxes = $('input[type="checkbox"]:checked').map(function() {
                    return $(this).val();
                }).get();
                if (checkedCheckboxes.length > 0) {
                    data['selectedTypes'] = checkedCheckboxes;
                    addOrUpdateBuilding(data);
                } else {
                    window.location.href = "<c:url value='/admin/building-edit?id=" + buildingId + "&type=require'/>";
                }
            }
        }else {
            if (type.length > 0) {
                data['type'] = type.join(",");
                addOrUpdateBuilding(data);
            } else {
                window.location.href = "<c:url value='/admin/building-edit?type=require'/>";
            }
        }




    });



    function addOrUpdateBuilding(data){
        // handle photo

        // cal api
        $.ajax({
            // add building
            type: "POST", // HTTP method, add
            url: "${buildingAPI}", //call api
             data: JSON.stringify(data), // transfer data to Json , client
            contentType: "application/json", // client : Định dạng gửi dữ liệu gửi về
            // định dạng respond là dạng gì
            dataType: "JSON", // định dạng từ sever đẩy lên ntn, cấu trúc gì
            success: function (response) {
                console.log("success"); // respond : Backend gửi lên if success
                window.location.href = "<c:url value='/admin/building-list'/>";
            },
            error: function(response){
                console.log("error");
                console.log(response);
                alert("Đã xảy ra lỗi khi thêm/cập nhật tòa nhà");
            }
        });
    }
    $('#btnCancel').click(function(){
        window.location.href = "/admin/building-list";
    });

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });


    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

</script>
</body>
</html>
