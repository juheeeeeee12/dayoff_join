<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
	<form id="form" name="form" method="POST">
		<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${pageIndex}'/>"/>
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
		<input type="hidden" name="nowPostSeq" value="<c:out value='${nowPostSeq}'/>"/>
		<input type="hidden" name="isModify" id="isModify"/>
		<input type="hidden" name="boardSeq" id="boardSeq" value="<c:out value='${boardSeq}'/>"/>
		<input type="hidden" name="parentGb" id="parentGb" value="POST"/>
		<input type="hidden" name="postSeq" id="postSeq"/>

		<div class="row">
			<div class="col-12">
				<div class="card border">
					<div class="card-body">
						<div class="user_search">
							<div class="radio_group flx  m-b-5">
								<p class="radio-tit">사용여부</p>
								<input type="radio" id="useAll" name="schShowYn" class="custom" value="" onchange="fn_search();" <c:if test="${empty schShowYn}">checked</c:if>>
								<label for="useAll"> 전체</label>
								<input type="radio" id="useY" name="schShowYn" class="custom" value="Y" onchange="fn_search();" <c:if test="${schShowYn eq 'Y'}">checked</c:if>>
								<label for="useY"> 게시</label>
								<input type="radio" id="useN" name="schShowYn" class="custom" value="N" onchange="fn_search();" <c:if test="${schShowYn eq 'N'}">checked</c:if>>
								<label for="useN"> 미게시</label>
							</div>
							<div class="ipt_group">
			                	<c:if test="${boardInfo.CATE_USE_YN eq 'Y'}">
				                	<select class="resetVal form-control custom-select" id="schCategory" name="schCategory" style="width:calc(15% - 5px);" onchange="listThread(1);">
				                		<option value="" <c:if test="${empty schCategory}">selected</c:if>>-전체 카테고리-</option>
				                		<c:forEach items="${boardCategoryList}" var="list" varStatus="status">
				                			<option value="<c:out value='${list.CATEGORY_SEQ}'/>" <c:if test="${schCategory eq list.CATEGORY_SEQ}">selected</c:if>><c:out value='${list.CATEGORY_NM}'/></option>
				                		</c:forEach>
				                	</select>
									<select class="resetVal form-control custom-select" id="schGb" name="schGb" style="width:calc(15% - 5px);">
										<option value="postTitle" <c:if test="${schGb eq 'postTitle'}">selected</c:if>>제목</option>
									</select>
									<input type="text" name="schVal" class="resetVal form-control custom-select" style="width: calc(100% - 32% + 6px);" placeholder="검색어를 입력하세요" value="<c:out value='${schVal}'/>" onkeypress="if( event.keyCode == 13 ){fn_search();}">
			                	</c:if>
			                	<c:if test="${boardInfo.CATE_USE_YN ne 'Y'}">
									<select class="resetVal form-control custom-select" id="schGb" name="schGb" style="width:20%;">
										<option value="postTitle" <c:if test="${schGb eq 'postTitle'}">selected</c:if>>제목</option>
									</select>
									<input type="text" name="schVal" class="resetVal form-control custom-select" style="width: calc(100% - 22%);" placeholder="검색어를 입력하세요" value="<c:out value='${schVal}'/>" onkeypress="if( event.keyCode == 13 ){fn_search();}">
			                	</c:if>
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
				                    <c:if test="${boardInfo.CATE_USE_YN eq 'Y'}">
					                    <col width="10%">
				                    </c:if>
				                    <col width="*">
				                    <col width="10%">
				                    <col width="8%">
				                    <col width="10%">
				                    <col width="8%">
				                    <col width="8%">
				                    <col width="8%">
				                </colgroup>
								<thead>
									<tr class="center">
										<th class="footable-sortable">No<span class="footable-sort-indicator"></span></th>
				                        <c:if test="${boardInfo.CATE_USE_YN eq 'Y'}">
				                        	<th class="footable-sortable">카테고리<span class="footable-sort-indicator"></span></th>
				                        </c:if>
										<th class="footable-sortable">제목<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">등록자<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">등록일<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">최종수정자<span class="footable-sort-indicator"></span></th>
										<th class="footable-sortable">최종수정일<span class="footable-sort-indicator"></span></th>
				                        <th class="footable-sortable">게시여부<span class="footable-sort-indicator"></span></th>
				                        <th class="footable-sortable">조회수<span class="footable-sort-indicator"></span></th>
									</tr>
								</thead>
								<tbody>
				                	<c:if test="${not empty resultList}">
				                		<c:forEach items="${resultList}" var="list" varStatus="status">
				                			<tr>
						                        <td class="num"><c:out value="${(paginationInfo.totalRecordCount - status.index) - ( (paginationInfo.currentPageNo - 1)  *  paginationInfo.recordCountPerPage ) }"/></td>
						                        <c:if test="${boardInfo.CATE_USE_YN eq 'Y'}">
						                        	<td class="center"><c:out value='${list.POST_CATEGORY_NM}'/></td>
						                        </c:if>
						                        <td class="left"><a href="javascript:fn_detail('Y', '<c:out value='${list.POST_SEQ}'/>');"><c:out value='${list.POST_TITLE}'/></a></td>
						                        <td class="center"><c:out value='${list.CREATE_BY}'/></td>
						                        <td class="center"><c:out value='${list.CREATE_DATE}'/></td>
						                        <td class="center"><c:out value='${list.LAST_UPDATE_BY}'/></td>
						                        <td class="center"><c:out value='${list.LAST_UPDATE_DATE}'/></td>
						                        <td class="state">
						                            <span class="<c:if test="${list.SHOW_YN eq 'Y'}">complete</c:if>"><c:out value="${list.SHOW_YN eq 'Y' ? '게시' : '미게시'}"/></span>
						                        </td>
						                        <td class="num center"><c:out value='${list.VIEW_CNT}'/></td>
						                    </tr>
				                		</c:forEach>
				                	</c:if>
				                	<c:if test="${empty resultList}">
				                		<tr>
				                        	<td class="none" colspan="20">등록된 게시글이 없습니다.</td>
				                    	</tr>
				                	</c:if>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="100%" class="footable-visible">
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
	$("[name=schShowYn]").on('change', function(){
    	listThread(1);
    });
});

function fn_detail(isModify, postSeq){
	$("#isModify").val(isModify);
	if(isModify == 'Y') $("#postSeq").val(postSeq);
	sbmit("form", "/cms/board/mngPostWrite.do");
}

function fn_search(){
	listThread(1);
}
function listThread(pageNo) {
	$("#pageIndex").val(pageNo);
	sbmit("form", "/cms/board/mngPostList.do");
}
</script>


<%@include file="../layout/footer.jsp"%>