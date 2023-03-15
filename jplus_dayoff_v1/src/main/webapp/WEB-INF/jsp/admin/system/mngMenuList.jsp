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
		<input type="hidden" name="menuSeq" id="menuSeq"/>
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
				            		<option value="menuNm" <c:if test="${schGb eq 'menuNm'}">selected</c:if>>메뉴명</option>
				            	</select>
				                <input type="text" name="schVal" class="form-control custom-select" style="width: calc(100% - 22%);" placeholder="검색어를 입력하세요" value="" onkeypress="if( event.keyCode == 13 ){fn_search();}">
				            </div>
				            <div class="btn_group">
				                <span><button type="button" class="btn waves-effect waves-light btn-info m-r-10" onclick="fn_search();">검색</button></span>
				            	<span><button type="button" class="btn waves-effect waves-light btn-secondary" onclick="fn_reset();">초기화</button></span>
				        	</div>

			        	</div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                        	<div class="flx board-list-top m-b-20 jc-sb ai-cnt">
                               	<div class="list-num" >검색<span id="schCount"><c:out value='${listCntInfo.SCH_COUNT}'/></span>/ 전체<span id="totalCount"><c:out value='${listCntInfo.TOTAL_CNT}'/></span></div>
                               	<div class="flx list-option">
				                	<button type="button" class="flx btn waves-effect waves-light m-r-10 btn-green" onclick="sbmit('form', '/admin/accountListExcelDownload.do');"> <i class="fa fa-file-excel-o m-r-10"></i>엑셀 다운로드</button>
				                	<select class="form-control custom-select m-r-10" name="showListCnt" onchange="fn_search();" style=" width: auto;">
										<option value="20" selected="">20개씩 보기</option>
										<option value="50">50개씩 보기</option>
										<option value="100">100개씩 보기</option>
									</select>
				                </div>
				            </div>
                            <table id="demo-foo-addrow" class="table table-hover contact-list footable-loaded footable user-table" data-page-size="7">
	                            <colgroup>
				                    <col width="8%">
				                    <col width="*">
				                    <col width="5%">
				                    <col width="10%">
				                    <col width="10%">
				                    <col width="8%">
				                    <col width="10%">
				                    <col width="8%">
				                    <col width="8%">
				                </colgroup>
                                <thead>
                                    <tr>
				                        <th>메뉴 차수</th>
				                        <th>메뉴명</th>
				                        <th class="center">순서</th>
				                        <th class="center">메뉴 구분</th>
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
						                        <td class="num"><c:out value='${list.MENU_DEPTH eq 1 ? "상위메뉴" : "하위메뉴"}'/></td>
						                        <td style="text-align: left;">
						                        	<a href="javascript:fn_detail('Y', '<c:out value='${list.MENU_SEQ}'/>');">
							                        	<c:choose>
							                        		<c:when test="${list.MENU_DEPTH eq 2}">└</c:when>
							                        		<c:when test="${list.MENU_DEPTH eq 3}">└└</c:when>
							                        	</c:choose>
							                        	<c:out value='${list.MENU_NM}'/>
						                        	</a>
						                        </td>
						                        <td class="center"><c:out value='${list.MENU_ORDER}'/></td>
						                        <td class="center"><c:out value='${list.MENU_GB_STR}'/></td>
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
					                        <td class="no-data" colspan="20">등록된 메뉴가 없습니다.</td>
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
	           		<button id="write" class="btn btn-success " onclick="fn_detail('N');" type="button"><spring:message code="cmn.regist" text="등록"/></button>
	           	</div>
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

function fn_detail(isModify, menuSeq){
	$("#isModify").val(isModify);
	if(isModify == 'Y') $("#menuSeq").val(menuSeq);
	sbmit("form", "/cms/system/mngMenuWrite.do");
}

function fn_search(){
	listThread(1);
}
function listThread(pageNo) {
	$("#pageIndex").val(pageNo);
	sbmit("form", "/cms/system/mngMenuList.do");
}
</script>


<%@include file="../layout/footer.jsp"%>