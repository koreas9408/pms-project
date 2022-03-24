<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="isDashboardSide" value="active" />
	<jsp:param name="isDashboardList" value="active" />
</jsp:include>

<div id="main-content" style="padding-top: 0">
	<div class="page-heading">
		<div class="page-title">
			<div class="row">
				<div class="col-12 col-md-6 order-md-1 order-last">
					<h3>개인 대시보드</h3>
				</div>
			</div>
		</div>

		<!-- Basic Tables start -->
		<section class="section">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; padding-bottom: 0;">
					<p class="fw-bold">참여 프로젝트</p>
					<a href="${path}/myTask/list.do">더보기</a>
				</div>
				<div class="card-body">
					<table class="table" id="myProjectList">
						<thead>
							<tr>
								<th>프로젝트 코드</th>
								<th>프로젝트</th>
								<th>부서</th>
								<th>PM</th>
								<th>상태</th>
								<th>시작일</th>
								<th>완료일</th>
							</tr>
						</thead>
						<tbody>
                   			<c:forEach var="project" items="${MyProjectList}">
								<tr>
		                            <td><a href="${path}/project/detail.do?projectId=${project.projectId}">${project.projectId}</a></td>
		                            <td>${project.title}</td>
		                            <td>${project.pmDeptName}</td>
		                            <td>${project.pmName}</td>
		                            <c:choose>
		                            	 <c:when test = "${project.status eq '시작전'}">
		                           			<td><span class="badge bg-secondary">${project.status}</span></td>
		                            	 </c:when>
		                            	 <c:when test = "${project.status eq '정상진행'}">
		                            	 	<td><span class="badge bg-success">${project.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${project.status eq '지연진행'}">
		                            	 	<td><span class="badge bg-danger">${project.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${project.status eq '완료'}">
		                            	 	<td><span class="badge bg-primary">${project.status}</span></td>
		                           		 </c:when>
		                            	 <c:when test = "${project.status eq '중단'}">
		                            	 	<td><span class="badge bg-warning">${project.status}</span></td>
		                           		 </c:when>
		                            </c:choose>
		                            <td><fmt:formatDate value="${project.startAt}" pattern="yyyy-MM-dd"/></td>
		                            <td><fmt:formatDate value="${project.endAt}" pattern="yyyy-MM-dd"/></td>
                      			</tr>
                    		</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- Basic Tables end -->
		
		<section id="basic-horizontal-layouts">
			<div class="row match-height">
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-header">
							<p class="fw-bold">작업 진행상태</p>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal">
									<div class="form-body">
										<div class="row"></div>
										<div style="height: 300px">
											<canvas id="myTaskStatusChart"></canvas>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-header" style="display: flex; justify-content: space-between;">
							<p class="fw-bold">리스크 현황</p>
							<select class="form-select" id="riskChart" style="width: 150px;">
								<option value="1">상태별</option>
								<option value="2">유형별</option>
							</select>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal">
									<div class="form-body">
										<div class="row"></div>
										<div id="chart1" style="height: 300px">
											<canvas id="MyRiskStatusChart1"></canvas>
										</div>
										<div id="chart2" style="display: none; height: 300px">
											<canvas id="MyRiskStatusChart2"></canvas>
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
	// 참여 프로젝트
	$("#myProjectList").DataTable({
		"searching": false,
		"info": false,
		"lengthChange": false, 
		"paging": false,
		"columnDefs": [
		    {"className": "dt-center", "targets": "_all"}
		],
		"order": [5, 'desc'],
		"language": {
	        "zeroRecords": "참여중인 프로젝트가 없습니다."
	    }
	});
	
	// 작업 진행상태
	let myTaskStatusList = [];
	let myTaskCountList = [];
	
	<c:forEach var="task" items="${MyTaskStatusChart}" >		
		myTaskStatusList.push('${task.status}');
		myTaskCountList.push(${task.count});
	</c:forEach>

	const mtsc = document.getElementById('myTaskStatusChart');
	const myTaskStatusChart = new Chart(mtsc, {
		type : 'doughnut',
		data : {
			labels : myTaskStatusList,
			datasets : [ {
				data : myTaskCountList,
				backgroundColor : [
					'rgba(170, 170, 170, 0.5)', // 시작전(회색)
					'rgba(75, 192, 192, 0.5)', // 정상진행(연두색)
					'rgba(255, 99, 132, 0.5)', // 지연진행(분홍색)
					'rgba(54, 162, 235, 0.5)' // 완료(하늘색)
				],
				hoverOffset : 4
			} ],
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			plugins : {
				legend : {
					position : 'bottom'
				}
			}
		}
	});

	// 리스크 현황 (select / option)
	$(document).ready(function(){
		$("#chart2").hide()
		
		$("#riskChart").change(function(){
		    if($(this).val() == 1) {
		    	$("#chart1").show()
		    	$("#chart2").hide()
		    	
		    } else if ($(this).val() == 2) {
		    	$("#chart1").hide()
		    	$("#chart2").show() 
			}   
		});
	});
	
	// 리스크 현황: 상태별
	var myRiskStatusList1 = [];
	var myRiskCountList1 = [];
	
	<c:forEach var="risk" items="${MyRiskStatusChart1}" >		
		myRiskStatusList1.push('${risk.status}');
		myRiskCountList1.push(${risk.count});
	</c:forEach>

	const mrsc1 = document.getElementById('MyRiskStatusChart1');
	const MyRiskStatusChart1 = new Chart(mrsc1, {
		type : 'doughnut',
		data : {
			labels : myRiskStatusList1,
			datasets : [ {
				data : myRiskCountList1,
				backgroundColor : [
					'rgba(170, 170, 170, 0.5)', // 오픈(회색)
					'rgba(75, 192, 192, 0.5)', // 진행(초록색)
					'rgba(153, 102, 255, 0.5)', // 취소(보라색)
					'rgba(255, 206, 86, 0.5)', // 홀드(노랑색)
					'rgba(54, 162, 235, 0.5)' // 조치완료(파랑색)
				],
				hoverOffset : 4
			} ],
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			plugins : {
				legend : {
					position : 'bottom'
				}
			}
		}
	});
	
	// 리스크 현황: 유형별
	var myRiskStatusList2 = [];
	var myRiskCountList2 = [];
	
	<c:forEach var="risk" items="${MyRiskStatusChart2}" >		
		myRiskStatusList2.push('${risk.status}');
		myRiskCountList2.push(${risk.count});
	</c:forEach>

	const mrsc2 = document.getElementById('MyRiskStatusChart2');
	const MyRiskStatusChart2 = new Chart(mrsc2, {
		type : 'doughnut',
		data : {
			labels : myRiskStatusList2,
			datasets : [ {
				data : myRiskCountList2,
				backgroundColor : [
					'rgba(54, 162, 235, 0.5)', // 고객변심(파랑색)
					'rgba(255, 99, 132, 0.5)', // 지연진행(분홍색)
					'rgba(153, 102, 255, 0.5)', // 품질문제(보라색)
					'rgba(255, 206, 86, 0.5)', // 기타사유(노랑색)
				],
				hoverOffset : 4
			} ],
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			plugins : {
				legend : {
					position : 'bottom'
				}
			}
		}
	});	
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>