<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param name="isDashboardSide" value="active" />
	<jsp:param name="isDashboardList" value="active" />
</jsp:include>
<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
	    <div class="page-title">
	        <div class="row">
	            <div class="col-12 col-md-6 order-md-1 order-last">
	                <h3>프로필</h3>
	            </div>
	        </div>
	    </div>
	<section id="basic-horizontal-layouts">
        <div class="row match-height" style="margin-left: -62px;">
            <div class="col-md-6 col-12" style="margin-left: 50px">
                <div class="card">
                    <div class="card-header">
                        <p class="card-title">프로필</p>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-horizontal" action="${path}/emp/profileModify.do" method="get">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>이름</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="first-name" class="form-control" name="fname" readonly
                                                value="${sessionScope.emp.name}">   
                                        </div>
                                        <div class="col-md-4">
                                            <label>부서</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="email-id" class="form-control" name="email-id" readonly
                                                value="${emp.deptName}">
                                        </div>
                                        <div class="col-md-4">
                                            <label>직급</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="email-id" class="form-control" name="email-id" readonly
                                                value="${emp.posName}">
                                        </div>
                                        <div class="col-md-4">
                                            <label>이메일</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="email-id" class="form-control" name="email-id" readonly
                                                value="${emp.empEmail}">
                                        </div>
                                        <div class="col-md-4">
                                            <label>번호</label>
                                        </div>
                                        <div class="col-md-8 form-group">
                                            <input type="text" id="email-id" class="form-control" name="email-id" readonly
                                                value="${emp.phone}">
                                        </div>
                                                                            
                                        <div class="col-sm-12 d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">수정</button>
                                            
                                        </div>

                                        
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> 
 </div> 
<script src="${path}/resources/vendors/jquery-datatables/jquery.dataTables.min.js"></script>
<script src="${path}/resources/vendors/jquery-datatables/custom.jquery.dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/vendors/fontawesome/all.min.js"></script>    
<script>
// Jquery Datatable
let jquery_datatable = $("#table1").DataTable({
	"searching" : false,
	"lengthChange" : false,
	"info" : false,
});
</script>      
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 