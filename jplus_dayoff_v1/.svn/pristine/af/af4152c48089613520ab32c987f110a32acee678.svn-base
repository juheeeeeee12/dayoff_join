<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<link rel="stylesheet" href="/resources/admin/css/newStyle.css">

<form id="form" name="form" method="post" enctype="multipart/form-data" onsubmit="return false;">
	<input type="hidden" name="pageIndex" value="<c:out value='${pageIndex}'/>"/>
	<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
	<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
	<input type="hidden" name="schGb" id="schGb" value="<c:out value='${schGb}'/>" />
	<input type="hidden" name="schVal" id="schVal" value="<c:out value='${schVal}'/>" />
	<input type="hidden" name="inqrySeq" id="inqrySeq" value="<c:out value='${inqrySeq}'/>" />

	<input type="hidden" name="realFilePath" id="realFilePath" value="INQRY" />
	<input type="hidden" name="deleteFileArr" id="deleteFileArr"/>

	<!-- path -->
	<div id="path">
	    <div class="inner">
	        <div class="back">
	            <button type="button" class="btn square trans" onclick="history.back();"><i class="fas fa-2x fa-chevron-circle-left"></i></button>
	        </div>
	        <div class="left">
	            <h2 class="pTit"><c:out value='${pageName}'/></h2>
	            <span class="sTit">${isModify eq 'N'? "등록" : "수정"}</span>
	        </div>
	        <div class="right">
	        	<c:if test="${isModify eq 'Y'}">
	        		<button type="button" class="btn square trans delBtn" onclick="fn_delete();"><i class="far fa-trash-alt"></i></button>
	        	</c:if>
	            <button type="button" class="btn square trans" onclick="fn_regist();"><i class="fas fa-2x fa-save"></i></button>
	        </div>
	    </div>
	</div>
	<!-- path -->

	<!-- main -->
	<div id="main">
	    <div class="group">
	    	<div class="header">
	            <h3>고객문의</h3>
	        </div>
	        <div class="body">
	            <table class="board_write">
	            	<colgroup>
	            		<col width="10%">
	            		<col width="40%">
	            		<col width="10%">
	            		<col width="40%">
	            	</colgroup>
	                <tbody>
	                    <tr>
	                        <th>문의 카테고리</th>
	                        <td colspan="3"><c:out value='${result.INQRY_CATEGORY_NM}'/></td>
	                    </tr>
	                    <tr>
	                        <th>문의 제목</th>
	                        <td colspan="3"><c:out value='${result.INQRY_TITLE}'/></td>
	                    </tr>
	                    <tr>
	                        <th>문의 내용</th>
	                    	<td colspan="3">
				                <div class="ipt_group"><c:out value='${result.INQRY_CNTNT}'/></div>
	                    	</td>
	                    </tr>
	                    <c:if test="${not empty inqryFileList}">
		                    <tr>
		                		<th>첨부파일</th>
		                		<td colspan="3">
		                			<ul class="fileList attachFileList">
						            	<c:forEach items="${inqryFileList}" var="f">
		                                	<li class="file">
		                                		<a href="javascript: fn_multiFileDown('<c:out value='${f.FILE_SEQ}'/>');">
								              		<span class="name downloadLink"><c:out value='${f.FILE_NM}'/></span>
							              		</a>
											</li>
						            	</c:forEach>
	                                </ul>
		                		</td>
		                	</tr>
	                	</c:if>
	                	<c:if test="${isModify eq 'Y'}">
	                    	<tr>
		                    	<th>등록자</th>
		                    	<td><c:out value='${result.CREATE_BY}'/></td>
		                    	<th>등록일시</th>
		                    	<td><c:out value='${result.CREATE_DATE}'/></td>
		                    </tr>
		                    <tr>
		                    	<th>최종수정자</th>
		                    	<td><c:out value='${result.LAST_UPDATE_BY}'/></td>
		                    	<th>최종수정일시</th>
		                    	<td><c:out value='${result.LAST_UPDATE_DATE}'/></td>
		                    </tr>
	                    </c:if>
	                </tbody>
	            </table>
	        </div>
	    </div>

	    <div class="group">
	    	<div class="header">
	            <h3>문의답변</h3>
	        </div>
	        <div class="body">
	            <table class="board_write">
	            	<colgroup>
	            		<col width="10%">
	            		<col width="40%">
	            		<col width="10%">
	            		<col width="40%">
	            	</colgroup>
	                <tbody>
	                    <tr>
	                        <th class="req">답변 제목</th>
	                        <td colspan="3">
	                        	<input type="text" name="answerTitle" class="ipt w100p reqIpt" data-label="답변 제목" value="<c:out value='${result.ANSWER_TITLE}'/>" maxlength="30"/>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="req">답변 내용</th>
	                    	<td colspan="3">
				                <div class="ipt_group">
				                	<textarea maxlength="3000" class="ipt" name="answerCntnt" id="answerCntnt" style="width: 100%; height: 300px;"><c:out value='${result.ANSWER_CNTNT}'/></textarea>
				                </div>
	                    	</td>
	                    </tr>
	                    <tr>
	                		<th>파일첨부</th>
	                		<td colspan="3">

	                			<div class="uploadFile">
	                                <input type="file" class="answerFile" onchange="fn_readFileName(this);" style="display: none;" name="answerFile_1"/>
	                                <button type="button" class="btn black ajax_file_upload" onclick="fn_addFile('answerFile', this)">Attachments</button>
	                                <ul class="fileList attachFileList">
										<c:if test="${not empty answerFileList}">
							            	<c:forEach items="${answerFileList}" var="f">
			                                	<li class="file">
			                                		<a href="javascript: fn_multiFileDown('<c:out value='${f.FILE_SEQ}'/>');">
				                                		<input type="checkbox" id="<c:out value='${f.FILE_SEQ}'/>" class="custom files">
		                                       			<label for="${f.FILE_SEQ}" class="text-none"></label>
									              		<span class="name downloadLink"><c:out value='${f.FILE_NM}'/></span>
								              		</a>
												</li>
							            	</c:forEach>
										</c:if>
	                                </ul>
	                                <div class="fileOpt">
	                                    <div class="allChk">
	                                        <input name="file" type="checkbox" id="fileAll" class="custom fileAll" onchange="fn_fileAllChk(this);">
	                                        <label for="fileAll" class="text-none"></label>
	                                        <span class="name">All</span>
	                                    </div>
	                                    <div class="btns">
	                                        <a class="btn small red" onclick="fn_multiDeleteFile(this);">Delete</a>
	                                    </div>
	                                </div>
	                            </div>

	                		</td>
	                	</tr>
	                	<c:if test="${result.ANSWER_YN eq 'Y'}">
	                    	<tr>
		                    	<th>답변자</th>
		                    	<td><c:out value='${result.ANSWER_BY}'/></td>
		                    	<th>답변일시</th>
		                    	<td><c:out value='${result.ANSWER_DATE}'/></td>
		                    </tr>
	                    </c:if>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</form>
<!-- main -->

<script type="text/javascript">

var deleteFileArr = new Array();
var oEditors1 = [];

$(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors1,
		elPlaceHolder: "answerCntnt",
		sSkinURI: "/resources/js/smart_editor/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams: {fOnBeforeUnload: function(){}}
		,fOnAppLoad: function(){}
	});
});

function fn_regist(){

	// validation check START
	if(!fn_chkValidation()) return;

	// 수정된 내용 반영
	oEditors1.getById["answerCntnt"].exec("UPDATE_CONTENTS_FIELD", []);

	// 빈 값 체크
	if(isEmpty($("#answerCntnt").val()) || $("#answerCntnt").val() == '&nbsp;' || $("#answerCntnt").val() == '<p>&nbsp;</p>'){
		alert("답변 내용은 필수 입력 항목입니다.");
		return false;
	}

	// validation check End

	if($("#isModify").val() == "Y") $("#deleteFileArr").val(JSON.stringify(deleteFileArr));

	if(confirm("저장하시겠습니까?")) {

		$("#form").attr("action", "/cms/member/saveInqryInfoAjax.do");

		var option = {
			success : function(data) {
				alert(data.message);
				if( data.retcode == "SUCC") {
					$("#form").attr("onsubmit", "return true");
					sbmit("form", "/cms/member/mngInqryList.do");
				} else {
					console.log(data.errCode);
				}
			},
			type : "POST"
		}

		$("#form").ajaxSubmit(option);

	}
}

function fn_delete(){
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type : "POST",
			url : "/cms/member/deleteInqryInfoAjax.do",
			traditional : true,
			dataType : 'json',
			data : $("#form").serialize(),
			success : function(data) {
				alert(data.message);
				if( data.retcode == "SUCC") {
					$("#form").attr("onsubmit", "return true");
					sbmit("form", "/cms/member/mngInqryList.do");
				} else {
					console.log(data.errCode);
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
		        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
	}
}

</script>

<%@include file="../layout/footer.jsp"%>