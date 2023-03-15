<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
	<form id="form" name="form" method="POST">
		<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${pageIndex}'/>"/>
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
		<input type="hidden" name="isModify" id="isModify"/>
		<input type="hidden" name="memberId" id="memberId"/>

        <div class="row">
        	<div class="col-12">
				<div class="card border">
					<div class="card-body">
						<!-- <h4 class="card-title">회원 검색</h4> -->
							<div class="user_search">
								<div class="ipt_group">
									<select class="form-control custom-select" id="schGb" name="schGb" style="width: 20%;">
										<option value="schMemberId" <c:if test="${schGb eq 'schMemberId'}">selected</c:if>>회원 ID</option>
										<option value="schMemberNm" <c:if test="${schGb eq 'schMemberNm'}">selected</c:if>>회원 성명</option>
									</select>
									<input type="text" name="schVal" class="resetVal form-control custom-select" style="width: calc(100% - 22%);" placeholder="검색어를 입력하세요" value="<c:out value='${schVal}'/>" onkeypress="if( event.keyCode == 13 ){fn_search();}">
								</div>
								<div class="btn_group">
									<span class=" "><button type="button" class="btn waves-effect waves-light btn-info m-r-10" onclick="fn_search();">검색</button></span>
									<span class=" "><button type="button" class="btn waves-effect waves-light btn-secondary" onclick="fn_reset();">초기화</button></span>
								</div>
							</div>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<div class="flx board-list-top m-b-20 jc-sb ai-cnt">
								<div class="list-num" >검색<span id="schCount"><c:out value="${listCntInfo.SCH_COUNT}"/></span>/ 전체<span id="totalCount"><c:out value="${listCntInfo.TOTAL_CNT}"/></span></div>
							</div>
							<table id="demo-foo-addrow" class="table table-hover contact-list footable-loaded footable user-table" data-page-size="7">
								<colgroup>
									<col width="5%">
				                    <col width="10%">
				                    <col width="10%">
				                    <col width="15%">
				                    <col width="20%">
				                    <col width="10%">
				                    <col width="10%">
								</colgroup>
								<thead>
									<tr class="center">
										<th class="footable-sortable">No<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">사용자ID<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">사용자<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">연락처<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">이메일<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">가입일<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">승인여부<span class="footable-sort-indicator"></span></th>
									</tr>
								</thead>
								<tbody>
        							<c:if test="${not empty resultList}">
        									<c:forEach items="${resultList}" var="list" varStatus="status">
        										<tr>
	        										<td class="num"><c:out value="${(paginationInfo.totalRecordCount - status.index) - ( (paginationInfo.currentPageNo - 1)  *  paginationInfo.recordCountPerPage ) }"/></td>
	        										<td class="left"><a href="javascript:fn_detail('Y', '<c:out value='${list.MEMBER_ID}'/>');"><c:out value="${list.MEMBER_ID}"/></a></td>
	        										<td class="center"><c:out value="${list.MEMBER_NM}"/></td>
	        										<td class="center"><c:out value="${list.PHONE_NUM}"/></td>
	        										<td class="center"><c:out value="${list.EMAIL}"/></td>
	        										<td class="center"><c:out value="${list.FMT_CREATE_DATE}"/></td>
	        										<td class="state">
	        											<span class="<c:if test="${list.JOIN_STATUS_NM eq '승인'}">complete</c:if>"><c:out value="${list.JOIN_STATUS_NM}"/></span>
	        										</td>
        										</tr>
        									</c:forEach>
        							</c:if>
									<c:if test="${empty resultList}">
										<tr>
											<td class="none no-data" colspan="20" style="">등록된 회원이 없습니다.</td>
										</tr>
									</c:if>
        						</tbody>
								<tfoot>
									<tr>
										<td colspan="7" class="footable-visible">
											<div class="text-right">
												<ul class="pagination">
       												<ui:pagination paginationInfo="${paginationInfo}" type="bbsImage" jsFunction="listThread"/>
       											</ul>
											</div>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<div class="right registAuthArea">
					<button id="write" class="btn btn-success" onclick="fn_detail('N');" type="button"><spring:message code="cmn.regist" text="등록"/></button>
				</div>
			</div>
		</div>
	</form>
</div>


<script type="text/javascript">

	function fn_detail(isModify, memberId) {
		$("#isModify").val(isModify);
		if (isModify == 'Y') $("#memberId").val(memberId);
		sbmit("form", "/cms/member/mngMemberWrite.do");
	}

	function fn_search() {
		listThread(1);
	}
	function listThread(pageNo) {
		$("#pageIndex").val(pageNo);
		sbmit("form", "/cms/member/mngMemberList.do");
	}
</script>

<%@include file="../layout/footer.jsp"%>