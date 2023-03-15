<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

	<div class="container-fluid">
		<form id="form" name="form" method="POST">
			<input type="hidden" name="pageIndex" value="<c:out value='${pageIndex}'/>"/>
			<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
			<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
			<input type="hidden" name="schGb" id="schGb" value="<c:out value='${schGb}'/>" />
			<input type="hidden" name="schVal" id="schVal" value="<c:out value='${schVal}'/>" />
			<input type="hidden" name="boardSeq" id="boardSeq" value="<c:out value='${boardSeq}'/>" />
			<input type="hidden" name="selCateList" id="selCateList" />
			<input type="hidden" name="delCateList" id="delCateList" />


			<div class="row">
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">게시판명</h4>
							<input type="text" name="boardNm" class="ipt form-control form-control-line reqIpt" data-label="게시판명" value="<c:out value='${result.BOARD_NM}'/>" maxlength="30"/>
						</div>
					</div>
				</div>
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">게시판 스타일</h4>
							<select name="boardTypeCd" class="ipt resetVal form-control custom-select" onchange="fn_chgBoardStyle();">
                    			<c:forEach items="${boardTypeList}" var="i" varStatus="status">
                    				<option value="<c:out value='${i.SUB_CD}'/>" <c:if test="${i.SUB_CD eq result.BOARD_TYPE_CD}">selected</c:if>><c:out value='${i.SUB_CD_NM}'/></option>
                    			</c:forEach>
				            </select>
						</div>
					</div>
				</div>
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">사용여부</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="useYn"/>
                                	<input type="checkbox" class="leverChk boardChk" id="useYn" <c:if test="${result.USE_YN ne 'N'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">고정게시 여부</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="fixYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="fixYn" <c:if test="${result.FIX_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">파일첨부 기능</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="attachYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="attachYn" <c:if test="${result.ATTACH_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">답글 기능</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="replyYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="replyYn" <c:if test="${result.REPLY_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                                <p class="reference" style="display: inline-block; position: relative; top: 3px; margin-left: 15px;">* 리스트형만 가능</p>
                            </div>
						</div>
					</div>
				</div>
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">댓글 기능</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="commentYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="commentYn" <c:if test="${result.COMMENT_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">키워드 기능</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="keywordYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="keywordYn" <c:if test="${result.KEYWORD_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">사용자 작성가능 여부</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="userWritableYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="userWritableYn" <c:if test="${result.USER_WRITABLE_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
			    <div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">카테고리 사용여부</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="cateUseYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="cateUseYn" <c:if test="${result.CATE_USE_YN eq 'Y'}">checked</c:if> onchange="fn_chgCateUseYn();">
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">추천/비추천 기능</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="rcmndYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="rcmndYn" <c:if test="${result.RCMND_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">신고 기능</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="reportYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="reportYn" <c:if test="${result.REPORT_YN eq 'Y'}">checked</c:if>>
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-3">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">이미지 슬라이드 기능</h4>
							<div class="switch">
                                <label>
                                	<input type="hidden" name="imgSlideYn"/>
                                    <input type="checkbox" class="leverChk boardChk" id="imgSlideYn" <c:if test="${result.IMG_SLIDE_YN eq 'Y'}">checked</c:if> onchange="fn_chgImgSlide();">
                                	<span class="lever"><i class="fa fa-check"></i></span>
                                </label>
                            </div>
						</div>
					</div>
				</div>
			    <div id="setImgSlide" class="col-lg-3" style="display: none;">
			    	<div class="card">
			    		<div class="card-body">
							<h4 class="card-title req">이미지 슬라이드 설정</h4>
							<label>min</label>
                    		<input type="text" name="minImgCnt" class="ipt form-control form-control-line onlyNumber minImgCnt" maxlength="3" value="<c:out value='${empty result.MIN_IMG_CNT ? 1 : result.MIN_IMG_CNT}'/>">
                    		<label>max</label>
                    		<input type="text" name="maxImgCnt" class="ipt form-control form-control-line onlyNumber maxImgCnt" maxlength="3" value="<c:out value='${empty result.MAX_IMG_CNT ? 5 : result.MAX_IMG_CNT}'/>">
						</div>
					</div>
				</div>
			</div>

			<div id="boardCateTbl" class="row" style="display: none;">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="header">
								<div style="float: right;">
									<button class="btn i-co waves-effect waves-light btn-info m-r-10" type="button" onclick="fn_addCategory();" style="position: relative; top: -5px;"><i class="ti-plus"></i></button>
								</div>
								<h3 class="card-title">카테고리</h3>
							</div>
							<div class="table-responsive">
								<table id="boardCtgTbl" class="table contact-list footable-loaded footable user-table">
									<colgroup>
										<col width="*%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
									</colgroup>
									<thead>
										<tr class="center">
											<th class="req">카테고리명</th>
											<th class="req">정렬순서</th>
											<th class="req">사용여부</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty boardCategoryList}">
											<c:forEach items="${boardCategoryList}" var="list" varStatus="status">
												<tr class="boardCtgTr">
													<input type="hidden" class="ipt" data-label="카테고리번호" data-name="categorySeq" value="<c:out value='${list.CATEGORY_SEQ}'/>" maxlength="11">
													<td class="center">
														<input type="text" class="ipt form-control form-control-line reqIpt" data-label="카테고리명" data-name="categoryNm" value="<c:out value='${list.CATEGORY_NM}'/>" maxlength="30">
													</td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line onlyNumber reqIpt" data-label="정렬순서" data-name="sortOrder" value="<c:out value='${list.SORT_ORDER}'/>" maxlength="3">
													</td>
													<td class="center">
														<div class="switch">
															<label>
															<input type="hidden" name="">
															<input type="checkbox" class="leverChk useCtgYnChk" <c:if test="${list.USE_YN eq 'Y'}">checked</c:if>>
															<span class="lever"><i class="fa fa-check"></i></span>
															</label>
														</div>
													</td>
													<td class="center">
														<button class="btn waves-effect waves-light btn-danger m-r-10" type="button" onclick="fn_rmvCategory(this, <c:out value='${list.CATEGORY_SEQ}'/>);">삭제</button>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty boardCategoryList}">
											<tr>
												<td class="none no-data" colspan="20" style="">카테고리를 등록해주세요.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:if test="${isModify eq 'Y'}">
				<div class="row">
					<div class="col-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">등록자</h4>
								<c:out value='${result.CREATE_BY}'></c:out>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">등록일시</h4>
								<c:out value='${result.CREATE_DATE}'/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">최종수정자</h4>
								<c:out value='${result.LAST_UPDATE_BY}'></c:out>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">최종수정일시</h4>
								<c:out value='${result.LAST_UPDATE_DATE}'/>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<div class="row">
				<div class="col-12">
					<div class="btn_group right registAuthArea">
			        	<c:if test="${isModify ne 'Y'}">
			        		<button type="button" class="btn btn-info waves-effect waves-light m-r-10" onclick="fn_regist();"><spring:message code="button.create" text="등록"/></button>
			        	</c:if>
			        	<c:if test="${isModify eq 'Y'}">
				            <button type="button" class="btn waves-effect waves-light btn-danger m-r-10" onclick="fn_delete();"><spring:message code="button.delete" text="삭제"/></button>
			            	<button type="button" class="btn btn-info m-r-10" onclick="fn_regist();"> <i class="fa fa-pencil"></i> <spring:message code="button.modify" text="수정"/></button>
			            </c:if>
			            <button type="button" class="btn btn-inverse waves-effect waves-light f_left" onclick="fn_goList();"><spring:message code="button.list" text="목록"/></button>
			        </div>
			    </div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">

var boardCategoryArr = new Array();
var delCategoryArr = new Array();

$(function(){
	fn_enterCmndCdFocusUnderRow();
	fn_chgBoardStyle();
	fn_chgCateUseYn();
	fn_chgImgSlide();
});

function fn_goList(){
	sbmit("form", "/cms/board/mngBoardList.do");
}

function fn_addCategory() {
	var str = "";
	$("#boardCtgTbl tr td.none").remove();
	str += '<tr class="boardCtgTr">'
			+ '<input type="hidden" class="ipt" data-label="카테고리번호" data-name="categorySeq" value="0" maxlength="11">'
			+ '	<td class="center"><input type="text" class="ipt form-control form-control-line reqIpt" data-label="카테고리명" data-name="categoryNm" maxlength="20"></td>'
			+ '	<td class="center"><input type="text" class="ipt form-control form-control-line onlyNumber reqIpt" data-label="정렬순서" data-name="sortOrder" maxlength="3"></td>'
			+ '	<td class="center">'
			+ '		<div class="switch">'
			+ '			<label>'
			+ '				<input type="hidden" name="">'
			+ '				<input type="checkbox" class="leverChk useCtgYnChk" checked>'
			+ '				<span class="lever"><i class="fa fa-check"></i></span>'
			+ '			</label>'
			+ '		</div>'
			+ '	</td>'
			+ '	<td class="center">'
			+ '		<button class="btn waves-effect waves-light btn-danger m-r-10" type="button" onclick="fn_rmvCategory(this, 0);">삭제</button>'
			+ '	</td>' + '</tr>';
	$("#boardCtgTbl tbody").append(str);
	fn_enterCmndCdFocusUnderRow();
}

function fn_rmvCategory(t, seq) {
	$(t).closest("tr").remove();
	if ($("#boardCtgTbl tbody tr.boardCtgTr").length == 0) {
		$("#boardCtgTbl tbody").html('<tr><td class="none no-data" colspan="20" style="">카테고리를 등록해주세요.</td></tr>');
	}

	// 삭제할 카테고리 seq 저장
	if (seq != 0) {
		var delCateInfo = new Object();
		delCateInfo.categorySeq = seq;
		delCategoryArr.push(delCateInfo);
	}
}

function fn_enterCmndCdFocusUnderRow(){
	$(".boardCtgTr .ipt").off().on("keyup",function(key){
        if(key.keyCode==13) {
            $(".boardCtgTr").eq($(this).parents("tr").index()).find("td").eq($(this).parents("td").index()).find(".ipt").focus();
        }
    });
}

function fn_regist(){

	if(!fn_chkValidation()) return;

	$(".boardChk").each(function(){
		$("[name=" + $(this).attr("id") + "]").val($(this).is(":checked") ? "Y" : "N");
	})

	boardCategoryArr = new Array();
	$(".boardCtgTr").each(function() {
		var cateInfo = new Object();
		$(this).find(".ipt").each(function() {
			cateInfo[$(this).data("name")] = $(this).val();
		})
		cateInfo.useYn = $(this).find(".useCtgYnChk").is(":checked") ? "Y" : "N";
		boardCategoryArr.push(cateInfo);
	})

	if(boardCategoryArr.length > 0) {
		$("#selCateList").val(JSON.stringify(boardCategoryArr));
	}

	if (delCategoryArr.length > 0) {
		$("#delCateList").val(JSON.stringify(delCategoryArr));
	}

	if($("[name=imgSlideYn]").val() == "Y") {
		var minImgCnt = $(".minImgCnt").val(), maxImgCnt = $(".maxImgCnt").val();
		if(isEmpty(minImgCnt)) {
			alert("이미지 첨부 최소 개수 제한을 입력해주세요.");
			$(".minImgCnt").focus();
			return;
		}
		if(isEmpty(maxImgCnt)) {
			alert("이미지 첨부 최대 개수 제한을 입력해주세요.");
			$(".maxImgCnt").focus();
			return;
		}
		if(Number(minImgCnt) > Number(maxImgCnt)) {
			alert("최소 개수 제한이 최대 개수 제한보다 큽니다.");
			return;
		}
	}

	if($("[name=cateUseYn]").val() == "Y" && boardCategoryArr.length == 0) {
		alert("카테고리 사용 시 카테고리를 1개 이상 설정해주세요.");
		return;
	}

	if(confirm("저장하시겠습니까?")) {
		$.ajax({
			type : "POST",
			url : "/cms/board/saveBoardInfoAjax.do",
			traditional : true,
			dataType : 'json',
			data : $("#form").serialize(),
			success : function(data) {
				alert(data.message);
				if( data.retcode == "SUCC") {
					fn_goList();
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
		        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
	}
}

function fn_delete(){
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type : "POST",
			url : "/cms/board/deleteBoardInfoAjax.do",
			traditional : true,
			dataType : 'json',
			data : $("#form").serialize(),
			success : function(data) {
				alert(data.message);
				if( data.retcode == "SUCC") {
					fn_goList();
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
		        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
	}
}

function fn_chgBoardStyle(){
	if($("[name=boardTypeCd] option:selected").val() != "01") $("#replyYn").prop("checked", false);
	$("#replyYn").attr("disabled", !($("[name=boardTypeCd] option:selected").val() == "01"));
}

function fn_chgCateUseYn(){
	if($("#cateUseYn").is(":checked")) $("#boardCateTbl").show();
	else $("#boardCateTbl").hide();
}

function fn_chgImgSlide(){
	if($("#imgSlideYn").is(":checked")) $("#setImgSlide").show();
	else $("#setImgSlide").hide();
}
</script>

<style>
	.minImgCnt, .maxImgCnt {width: 15%; margin-left: 5px; margin-right: 20px; text-align: center;}
	.table .no-data { padding: 2.2rem 0 !important; }
</style>


<%@include file="../layout/footer.jsp"%>