<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
<form id="form" name="form" method="POST">
	<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${pageIndex}'/>"/>
	<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
	<input type="hidden" name="isModify" id="isModify"/>
	<input type="hidden" name="contentsSeq" id="contentsSeq"/>
    <!-- row -->
    <div class="row">
        <div class="col-12">
        	<div class="card border">
	            <div class="card-body">
	                <div class="user_search">
	                	<div class="radio_group flx  m-b-5">
			        		<p class="radio-tit">사용여부</p>
							<input name="schUseYn" type="radio" id="schUseYn_all" class="custom" value="" <c:if test="${empty schUseYn}">checked</c:if> />
		                    <label for="schUseYn_all">All</label>
		                    <input name="schUseYn" type="radio" id="schUseYn_Y" class="custom" value="Y" <c:if test="${schUseYn eq 'Y'}">checked</c:if> />
		                    <label for="schUseYn_Y">사용</label>
		                    <input name="schUseYn" type="radio" id="schUseYn_N" class="custom" value="N" <c:if test="${schUseYn eq 'N'}">checked</c:if> />
		                    <label for="schUseYn_N">미사용</label>
						</div>
	                    <div class="ipt_group">
		                	<select class="form-control custom-select" id="schGb" name="schGb" style="width: 20%;">
		                		<option value="contentsNm" <c:if test="${schGb eq 'contentsNm'}">selected</c:if>>컨텐츠명</option>
		                	</select>
		                    <input type="text" name="schVal" class="form-control custom-select" style="width: calc(100% - 22%);" placeholder="검색어를 입력하세요" value="" onkeypress="if( event.keyCode == 13 ){fn_search();}">
		                </div>
		                <div class="btn_group">
			                <span class=" "><button type="button" class="btn waves-effect waves-light btn-info m-r-10" onclick="fn_search();"><spring:message code="button.search" text="검색"/></button></span>
		                	<span class=" "><button type="button" class="btn waves-effect waves-light btn-secondary" onclick="fn_reset();"><spring:message code="button.reset" text="초기화"/></button></span>
	                	</div>
	            	</div>
	            </div>
	        </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                    	<div class="flx board-list-top m-b-20 jc-sb ai-cnt">
                          	<div class="list-num" >검색<span id="schCount">${listCntInfo.SCH_COUNT}</span>/ 전체<span id="totalCount">${listCntInfo.TOTAL_CNT}</span></div>
                          	<div class="flx list-option">
			                	<button type="button" class="flx btn waves-effect waves-light m-r-10 btn-green" onclick="sbmit('form', '/admin/accountListExcelDownload.do');"> <i class="fa fa-file-excel-o m-r-10"></i>엑셀 다운로드</button>
			                	<select class="form-control custom-select m-r-10" name="showListCnt" onchange="fn_search();" style=" width: auto;">
									<option value="20" selected="">20개씩 보기</option>
									<option value="50">50개씩 보기</option>
									<option value="100">100개씩 보기</option>
								</select>
			                </div>
			            </div>
                        <table class="table table-hover contact-list footable-loaded footable user-table">
                            <colgroup>
			                    <col width="5%">
			                    <col width="*%">
			                    <col width="10%">
			                    <col width="10%">
			                    <col width="10%">
			                    <col width="10%">
			                    <col width="10%">
			                    <col width="10%">
			                </colgroup>
			                <thead>
			                    <tr>
			                        <th class="center">No</th>
			                        <th>컨텐츠명</th>
			                        <th class="center">컨텐츠 구분</th>
			                        <th class="center">등록자</th>
			                        <th class="center">등록일</th>
			                        <th class="center">최종수정자</th>
			                        <th class="center">최종수정일</th>
			                        <th class="center">사용여부</th>
			                    </tr>
			                </thead>
                            <tbody>
                                <c:if test="${not empty resultList}">
			                		<c:forEach items="${resultList}" var="list" varStatus="status">
			                            <tr>
		                                    <td><c:out value="${(paginationInfo.totalRecordCount - status.index) - ( (paginationInfo.currentPageNo - 1)  *  paginationInfo.recordCountPerPage ) }"/></td>
		                                    <td><a href="javascript:fn_detail('Y', '<c:out value='${list.CONTENTS_SEQ}'/>');"><c:out value='${list.CONTENTS_NM}'/></a></td>
					                        <td class="center"><c:out value='${list.CONTENTS_GB}'/></td>
					                        <td class="center"><c:out value='${list.CREATE_BY}'/></td>
					                        <td class="center"><c:out value='${list.CREATE_DATE}'/></td>
					                        <td class="center"><c:out value='${list.LAST_UPDATE_BY}'/></td>
					                        <td class="center"><c:out value='${list.LAST_UPDATE_DATE}'/></td>
					                        <td class="state">
					                            <span class="<c:if test="${list.USE_YN eq 'Y'}">complete</c:if>"><c:out value="${list.USE_YN eq 'Y' ? '사용' : '미사용'}"/></span>
					                        </td>
	                                	</tr>
                                	</c:forEach>
                               	</c:if>
                               	<c:if test="${empty resultList}">
			                		<tr>
				                        <td class="no-data" colspan="20">데이터가 없습니다</td>
				                    </tr>
			                	</c:if>
                            </tbody>
                            <tfoot>
	                            <tr>
	                                <td colspan="20" class="footable-visible">
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
           		<button id="write" class="btn btn-success " onclick="fn_detail('N');" type="button">등록</button>
           	</div>
	    </div>
	</div>
</form>
</div>

<script type="text/javascript">

$(function(){
	$("[name=schUseYn]").on('change', function(){
    	listThread(1);
    });
});

function fn_detail(isModify, contentsSeq){
	$("#isModify").val(isModify);
	if(isModify == 'Y') $("#contentsSeq").val(contentsSeq);
	sbmit("form", "/cms/contents/mngContentsWrite.do");
}

function fn_search(){
	listThread(1);
}
function listThread(pageNo) {
	$("#pageIndex").val(pageNo);
	sbmit("form", "/cms/contents/mngContentsList.do");
}
</script>

<%@include file="../layout/footer.jsp"%>