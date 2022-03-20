<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

 
 <div id="main-content">

                <div class="page-heading">
                    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">리스크 등록</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                                <div class="row">
       
                                  	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">리스크 제목</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="Rname" maxlength="120" value="@@@ 발생했습니다." style="background-color:white;">
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">유형</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rType" maxlength="120" value="고객 변심" style="background-color:white;">
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">프로젝트명</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rProject" maxlength="120" value="CPMS 프로젝트" style="background-color:white;">
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">작업</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rTask" maxlength="120" value="환불 처리" style="background-color:white;">
                                        </div>
                                    </div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly style="background-color:white;"></textarea>
                                        </div>
                                	</div>                          
                                	<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">조치자</label>
                                            <input type="text" readonly id="first-name-vertical" class="form-control" name="rActivator" maxlength="120" value="홍길동" style="background-color:white;">
                                        </div>
                                    </div>
                                	<div class="col-md-6 col-12">
                                    	<div class="form-group">
                                            <label for="basicSelect">조치 희망일</label>
                                          	<input type="date" id="first-name-vertical" class="form-control mt-2" name="end_at" readonly style="background-color:white;">
                                        </div>
                                	</div>
                                	<div class="col-12">
                                    	<div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="form-label">조치내용</label>
                            				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly style="background-color:white;"></textarea>
                                        </div>
                                	</div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="first-name-vertical" class="form-label">파일</label>
                                            <input type="file" id="first-name-vertical" class="form-control" placeholder="산출물 제목을 입력하세요." name="pname" maxlength="120" readonly style="background-color:white;">
                                        </div>
                                    </div>
                                    
                                    <div class="col-12 d-flex justify-content-end">
                                    
                                        <button type="button" class="btn btn-primary me-1 mb-1" onclick="location='modify.do'">수정</button>
                                        <button type="button" class="btn btn-danger me-1 mb-1">삭제</button>
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
                                    </div>
                                </div>                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                </div>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>