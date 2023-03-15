<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
	<form id="form" name="form" method="POST">
		<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${pageIndex}'/>" />
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>" />
		<input type="hidden" name="isModify" id="isModify"/>
		<input type="hidden" name="inqrySeq" id="inqrySeq"/>
		<input type="hidden" name="parentGb" id="parentGb" value="INQRY"/>

		<div class="row">
			<div class="col-12">
				<div class="card border">
					<div class="card-body">
						<div class="user_search">
							<div class="radio_group flx m-b-5">
								<p class="radio-tit">문의 카테고리</p>
								<select class="resetVal form-control custom-select" id="schCategory" name="schCategory" style="width: 20%;">
			                		<option value="" <c:if test="${empty schCategory}">selected</c:if>>-전체-</option>
			                		<c:forEach items="${inqryCategoryList}" var="list" varStatus="status">
			                			<option value="<c:out value='${list.SUB_CD}'/>" <c:if test="${schCategory eq list.SUB_CD}">selected</c:if>><c:out value='${list.SUB_CD_NM}'/></option>
			                		</c:forEach>
			                	</select>
							</div>
							<div class="radio_group flx  m-b-5">
								<p class="radio-tit">답변여부</p>
								<input type="radio" id="schAnswerYn_all" name="schAnswerYn" class="custom" value="" onchange="fn_search();" <c:if test="${empty schAnswerYn}">checked</c:if>>
								<label for="schAnswerYn_all"> 전체</label>
								<input type="radio" id="schAnswerYn_Y" name="schAnswerYn" class="custom" value="Y" onchange="fn_search();" <c:if test="${schAnswerYn eq 'Y'}">checked</c:if>>
								<label for="schAnswerYn_Y"> 답변완료</label>
								<input type="radio" id="schAnswerYn_N" name="schAnswerYn" class="custom" value="N" onchange="fn_search();" <c:if test="${schAnswerYn eq 'N'}">checked</c:if>>
								<label for="schAnswerYn_N"> 미답변</label>
							</div>
							<div class="ipt_group">
								<select class="resetVal form-control custom-select" id="schGb" name="schGb" style="width: 20%;">
									<option value="schInqryTitle" <c:if test="${schGb eq 'schInqryTitle'}">selected</c:if>>제목</option>
									<option value="schCreateBy" <c:if test="${schGb eq 'schCreateBy'}">selected</c:if>>아이디</option>
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
						<h4 class="card-title"></h4>
						<div class="table-responsive">
       						<div class="flx board-list-top m-b-20 jc-sb ai-cnt">
       							<div class="list-num" >검색<span id="schCount"><c:out value='${listCntInfo.SCH_COUNT}'/></span>/ 전체<span id="totalCount"><c:out value='${listCntInfo.TOTAL_CNT}'/></span></div>
       						</div>
							<table id="demo-foo-addrow" class="table table-hover contact-list footable-loaded footable user-table" data-page-size="10">
       							<colgroup>
       								<col width="5%">
				                    <col width="*">
				                    <col width="*">
				                    <col width="10%">
				                    <col width="8%">
				                    <col width="10%">
				                    <col width="8%">
				                    <col width="8%">
       							</colgroup>
								<thead>
									<tr class="center">
										<th class="footable-sortable">No<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">문의 카테고리<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">문의 제목<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">등록자<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">등록일<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">최종수정자<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">최종수정일<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">답변여부<span class="footable-sort-indicator"></span></th>
									</tr>
								</thead>
								<tbody>
					               	<c:if test="${not empty resultList}">
					               		<c:forEach items="${resultList}" var="list" varStatus="status">
					               			<tr>
						                        <td class="num"><c:out value="${(paginationInfo.totalRecordCount - status.index) - ( (paginationInfo.currentPageNo - 1)  *  paginationInfo.recordCountPerPage ) }"/></td>
						                        <td class="center"><c:out value='${list.INQRY_CATEGORY_NM}'/></td>
						                        <td class="left"><a href="javascript:fn_detail('Y', '<c:out value='${list.INQRY_SEQ}'/>');"><c:out value="${list.INQRY_TITLE}"/></a></td>
						                        <td class="center"><c:out value='${list.CREATE_BY}'/></td>
						                        <td class="center"><c:out value='${list.CREATE_DATE}'/></td>
						                        <td class="center"><c:out value='${list.LAST_UPDATE_BY}'/></td>
						                        <td class="center"><c:out value='${list.LAST_UPDATE_DATE}'/></td>
						                        <td class="state">
						                            <span class="<c:if test="${list.ANSWER_YN eq 'Y'}">complete</c:if>"><c:out value="${list.ANSWER_YN eq 'Y' ? '답변완료' : '미답변'}"/></span>
						                        </td>
						                    </tr>
					               		</c:forEach>
					               	</c:if>
					               	<c:if test="${empty resultList}">
					               		<tr>
					                       <td class="none no-data" colspan="20" style="">등록된 고객문의가 없습니다.</td>
					                   </tr>
					               	</c:if>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="7">
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
				<div class="right registAuthArea">
					<button id="write" class="btn btn-success " onclick="fn_detail('N');" type="button"><spring:message code="cmn.regist" text="등록"/></button>
				</div>
			</div>
		</div>
	</form>
</div>


<script type="text/javascript">

$(function(){
	$("[name=schAnswerYn]").on('change', function(){
    	listThread(1);
    });
});

function fn_detail(isModify, inqrySeq){
	$("#isModify").val(isModify);
	if(isModify == 'Y') {
		$("#inqrySeq").val(inqrySeq);
		sbmit("form", "/cms/member/mngInqryAnswer.do");
	} else {
		sbmit("form", "/cms/member/mngInqryWrite.do");
	}

}

function fn_search(){
	listThread(1);
}

function listThread(pageNo) {
	$("#pageIndex").val(pageNo);
	sbmit("form", "/cms/member/mngInqryList.do");
}

</script>


<%@include file="../layout/footer.jsp"%>