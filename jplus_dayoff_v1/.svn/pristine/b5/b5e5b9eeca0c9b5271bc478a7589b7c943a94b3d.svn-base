<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<link href="/resources/assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
<link href="/resources/assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
<link href="/resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
<link href="/resources/assets/plugins/morrisjs/morris.css" rel="stylesheet">
<script src="/resources/assets/plugins/morrisjs/morris.min.js"></script>
<script src="/resources/assets/plugins/chartist-js/dist/chartist.min.js"></script>
<script src="/resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
<script src="/resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="/resources/assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/resources/assets/plugins/raphael/raphael-min.js"></script>
<script src="/resources/js/dashboard2.js"></script>

<!--접속자 통계 -->
<div class="container-fluid">
	<form id="form" name="form" method="POST">
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
		<input type="hidden" name="label" id="label" value="<c:out value='${label}'/>"/>
		<input type="hidden" name="data" id="data" value="<c:out value='${data}'/>"/>

		<div class="row">
			<div class="col-12">
		        <div class="card border">
		        	<div class="card-body">
		        		<div class="user_search">
		       				<div class="ipt_group  m-b-10">
		       					<select class="form-control custom-select" id="schGb" name="schGb" style="width: 20%;">
		       						<option value="" selected disabled hidden>- 검색구분 -</option>
		       						<option value="">1</option>
		       						<option value="">2</option>
		       					</select>
		       					<input type="text" name="schVal" class="form-control custom-select" style="width: calc(100% - 22%);" placeholder="검색어를 입력하세요" value="" onkeypress="if( event.keyCode == 13 ){fn_search();}">
		       				</div>
		       				<div class="btn_group">
		       					<span class=" "><button type="button" class="btn waves-effect waves-light btn-info m-r-10" onclick="fn_search();">검색</button></span>
		       					<span class=" "><button type="button" class="btn waves-effect waves-light btn-secondary" onclick="fn_reset();">초기화</button></span>
		       				</div>
		       				<div class="ipt_group">
		       					<select class="form-control custom-select" id="schGb" name="schGb" style="width: 20%;">
		       						<option value="" selected disabled hidden>- 조회구분 -</option>
		       						<option value="">일별 조회</option>
		       						<option value="">월별 조회</option>
		       						<option value="">연도별 조회</option>
		       					</select>
		       					<input type="date" class="form-control" style="width: calc(100% - 22%);" placeholder="dd/mm/yyyy">
		       				</div>
		       			</div>
		       		</div>
		       	</div>

				<div class="card">
		            <div class="card-body">
		                <div class="d-flex flex-wrap">
		                    <div>
		                        <h4 class="card-title">접속자 통계</h4>
		                    </div>
		                    <div class="ml-auto align-self-center">
		                        <ul class="list-inline m-b-0">
		                            <li>
		                                <h6 class="text-muted text-success"><i class="fa fa-circle font-10 m-r-10 "></i>접속자 수</h6> </li>
		                            <li>
		                                <h6 class="text-muted text-info"><i class="fa fa-circle font-10 m-r-10"></i>가입자 수</h6> </li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="campaign ct-charts" style="height:305px!important;"></div>
		            </div>
		        </div>

		       	<div class="card">
		       		<div class="card-body">
		       			<div class="table-responsive">
		       				<div class="flx board-list-top m-b-20 jc-sb ai-cnt">
		       					<div class="list-num" >검색<span id="schCount"><c:out value="${listCntInfo.SCH_COUNT}"/></span>/ 전체<span id="totalCount"><c:out value="${listCntInfo.TOTAL_CNT}"/></span></div>
		       					<div class="flx list-option">
		   							<button type="button" class="flx btn waves-effect waves-light m-r-10 btn-green" onclick="sbmit('form', '/admin/accountListExcelDownload.do');"> <i class="fa fa-file-excel-o m-r-10"></i>엑셀 다운로드</button>
		   							<select class="form-control custom-select m-r-10" name="showListCnt" onchange="fn_search();" style=" width: auto;">
		   								<option value="20" selected="">20개씩 보기</option>
		   								<option value="50">50개씩 보기</option>
		       							<option value="100">100개씩 보기</option>
		       						</select>
		       						<select class="form-control custom-select" name="filterOrder" onchange="fn_search();" style="width: auto;">
		       							<option value="createDesc" selected="">등록일 내림차순</option>
		       							<option value="createAsc">등록일 오름차순</option>
		       							<option value="updateDesc">수정일 내림차순</option>
		       							<option value="updateAsc">수정일 오름차순</option>
		       							<option value="lastLoginDesc">최종 로그인 내림차순</option>
		       							<option value="lastLoginAsc">최종 로그인 오름차순</option>
		       						</select>
		       					</div>
		       				</div>
		       				<table id="demo-foo-addrow" class="table table-hover contact-list footable-loaded footable user-table" data-page-size="7">
		       					<colgroup>
		       						<col width="5%">
		       						<col width="18%">
		       						<col width="15%">
		       						<col width="17%">
		       						<col width="15%">
		       						<col width="15%">
		       						<col width="15%">
		       					</colgroup>
		       					<thead>
		       						<tr>
		       							<th class="footable-sortable">No<span class="footable-sort-indicator"></span></th>
		       							<th class="footable-sortable">접속자 ID<span class="footable-sort-indicator"></span></th>
		       							<th class="footable-sortable">접속자 성명<span class="footable-sort-indicator"></span></th>
		       							<th class="footable-sortable">연락처<span class="footable-sort-indicator"></span></th>
		       							<th class="footable-sortable">접속일자<span class="footable-sort-indicator"></span></th>
		       							<th class="footable-sortable">가입일자<span class="footable-sort-indicator"></span></th>
		       							<th class="footable-sortable">접속IP<span class="footable-sort-indicator"></span></th>
		       						</tr>
		       					</thead>
		       					<tbody>
		       						<c:if test="${not empty resultList}">
		       							<c:forEach items="${resultList}" var="list" varStatus="status">
			       							<tr>
			       								<td class="num"><c:out value="${(paginationInfo.totalRecordCount - status.index) - ( (paginationInfo.currentPageNo - 1)  *  paginationInfo.recordCountPerPage ) }"/></td>
			       								<td class="center"><c:out value='${list.LOGIN_ID}'/></td>
			       								<td class="center"><c:out value='${list.MEMBER_NM}'/></td>
			       								<td class="center"><c:out value='${list.PHONE_NUM}'/></td>
			       								<td class="center"><c:out value='${list.LOGIN_DATE}'/></td>
			       								<td class="center"><c:out value='${list.CREATE_DATE}'/></td>
			       								<td class="center"><c:out value='${list.LOGIN_IP}'/></td>
			       							</tr>
		       							</c:forEach>
		       						</c:if>
		       						<c:if test="${empty resultList}">
		       							<tr>
		       								<td class="none" colspan="20">등록된 데이터가 없습니다.</td>
		       							</tr>
		       						</c:if>
		       						<tr>
		       					</tbody>
		       					<tfoot>
		       						<tr>
		       							<td colspan="7" class="footable-visible">
		       								<div class="text-right">
		       									<ul class="pagination">
		       										<ui:pagination paginationInfo="${paginationInfo}" type="bbsImage" jsFunction="listThread" />
		       									</ul>
		       								</div>
		       							</td>
		       						</tr>
		       					</tfoot>
		       				</table>
		       			</div>
		       		</div>
		       	</div>
			</div>
		</div>
	</form>
</div>
<%@include file="../layout/footer.jsp"%>

<script>
$(function(){
	drawChart();
});

function fn_search(){
	listThread(1);
}

function listThread(pageNo) {
	$("#pageIndex").val(pageNo);
	sbmit("form", "/cms/board/mngPostList.do");
}

function drawChart() {

	console.log($("#label").val());
	console.log($("#data").val());

	var chart = new Chartist.Line('.campaign', {
		labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
		series: [
			[0, 5000, 15000, 8000, 15000, 9000, 30000, 10000, 0, 0, 0, 0]
			// , [0, 3000, 5000, 2000, 8000, 1000, 5000, 3000, 0, 0, 0, 0]
		]}, {
		low: 0,
		high: 28000,
		showArea: true,
		fullWidth: true,
		plugins: [
			Chartist.plugins.tooltip()
		],
		axisY: {
			onlyInteger: true
			, scaleMinSpace: 40
			, offset: 20
			, labelInterpolationFnc: function (value) {
				return (value / 1000) + ' ';
			}
		},
	});
}
</script>