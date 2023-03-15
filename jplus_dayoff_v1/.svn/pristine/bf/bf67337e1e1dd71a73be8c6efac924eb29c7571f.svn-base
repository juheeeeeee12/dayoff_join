<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
<form id="form" name="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pageIndex" value="<c:out value='${pageIndex}'/>"/>
	<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
	<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
	<input type="hidden" name="schGb" id="schGb" value="<c:out value='${schGb}'/>" />
	<input type="hidden" name="schVal" id="schVal" value="<c:out value='${schVal}'/>" />
	<input type="hidden" name="contentsSeq" id="contentsSeq" value="<c:out value='${contentsSeq}'/>" />

	<input type="hidden" name="realFilePath" id="realFilePath" value="CONTENTS" />
	<input type="hidden" name="deleteFileArr" id="deleteFileArr"/>
	<input type="hidden" name="saveGb" id="saveGb"/>

	<div class="row">
	    <div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">컨텐츠명</h4>
					<input type="text" name="contentsNm" class="form-control form-control-line reqIpt" data-label="컨텐츠명" value="<c:out value='${result.CONTENTS_NM}'/>" maxlength="30"/>
				</div>
			</div>
		</div>
		<div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">사용여부</h4>
					<div class="switch">
                        <label>
                        	<input type="hidden" name="useYn" id="useYn" />
                            <input type="checkbox" id="useYnChk" <c:if test="${result.USE_YN ne 'N'}">checked</c:if>>
                            <span class="lever" style="margin-left: 0;"></span>
                        </label>
                    </div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
	    	<div class="card">
	    		<div id="contentsArea" class="card-body">
					<h4 class="card-title req">컨텐츠 내용</h4>
					<select name="contentsGb" class="form-control custom-select" style="width: auto" onchange="fn_chgContentsGb();">
               			<option value="EDITOR" <c:if test="${result.CONTENTS_GB eq 'EDITOR'}">selected</c:if>>에디터 입력</option>
               			<option value="FILE" <c:if test="${result.CONTENTS_GB eq 'FILE'}">selected</c:if>>파일 첨부</option>
               		</select>
				    <div class="ipt_group editor_group" style="margin-top: 10px; <c:if test="${result.CONTENTS_GB eq 'FILE'}">display: none;</c:if>">
				    	<textarea maxlength="3000" class="ipt" name="contents" id="contents" style="width: 100%; height: 300px; margin-bottom: 30px;" placeholder="컨텐츠 내용을 입력해주세요."><c:out value='${result.CONTENTS}'/></textarea>
				    </div>
				    <div class="ipt_group file_group" style="margin-top: 10px; <c:if test="${result.CONTENTS_GB eq 'EDITOR'}">display: none;</c:if>" >
				    	<button type="button" class="btn waves-effect waves-light btn-warning attachFileBtn m-r-5" onclick="fn_attachFile(this);" style="float: left;">파일첨부</button>
				    	<input type="file" name="contentsFile" class="chooseFile" fileSeq="<c:out value='${result.CONTENTS_FILE_SEQ}'/>" data-extns="html,jsp" onchange="fn_fileValChg(this)">
				        <input maxlength="1000" type="text" value="<c:out value='${result.CONTENTS_FILE_NM}'/>" class="ipt fileName form-control form-control-line" style="width: 42.7%" readonly>
	                    <div class="btns"
	                    	<c:if test="${empty result.CONTENTS_FILE_SEQ}"> style="display: none;"</c:if>
	                    	<c:if test="${!empty result.CONTENTS_FILE_SEQ}"> style="display: inline-block; position: relative; top: -1px;"</c:if>
	                    >
	                        <a href="javascript: void(0);" class="btn waves-effect waves-light btn-success" onclick="fn_fileDownload(this);">다운로드</a>
	                        <a href="javascript: void(0);" class="btn waves-effect waves-light btn-danger" onclick="fn_fileDelete(this);">삭제</a>
	                    </div>
	                    <span class="reference m-l-5">* html, jsp 파일만 업로드 가능합니다</span>
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
						<c:out value='${result.CREATE_BY}'/>
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
						<c:out value='${result.LAST_UPDATE_BY}'/>
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
	            	<button type="button" class="btn btn-info m-r-10" onclick="fn_regist();"> <i class="fa fa-pencil"></i> <spring:message code="button.modify" text="수정"/></button>
		            <button type="button" class="btn waves-effect waves-light btn-danger m-r-10" onclick="fn_delete();"><spring:message code="button.delete" text="삭제"/></button>
	            </c:if>
	            <button type="button" class="btn btn-inverse waves-effect waves-light" onclick="fn_goList();"><spring:message code="button.list" text="목록"/></button>
	        </div>
	    </div>
	</div>
</form>
</div>
</div>

<script type="text/javascript">

var deleteFileArr = new Array();
var oEditors1 = [];
var editorCnt = 0;
var drawEditorFlag = false;

$(function(){
	fn_chgContentsGb();
});

function fn_chgContentsGb(){
	$("#contentsArea .ipt_group").hide();
	var iptGrpGb = $("[name=contentsGb] option:selected").val().toLowerCase();
	$("." + iptGrpGb + "_group").show();
	if(!drawEditorFlag && iptGrpGb == "editor") {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors1,
			elPlaceHolder: "contents",
			sSkinURI: "/resources/js/smart_editor/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
			htParams: {fOnBeforeUnload: function(){}}
			,fOnAppLoad: function(){}
		});
		drawEditorFlag = true;
	}
}

function fn_delete(){
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type : "POST",
			url : "/cms/contents/deleteContentsInfoAjax.do",
			traditional : true,
			dataType : 'json',
			data : $("#form").serialize(),
			success : function(data) {
				alert(data.message);
				fn_goList();
			},
			error : function(jqXHR, textStatus, errorThrown){
		        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
	}
}

function fn_goList(){
	sbmit("form", "/cms/contents/mngContentsList.do");
}

function fn_regist(){
	if(confirm("저장하시겠습니까?")) fn_save("save");
}

function fn_previewContents(){
	if(confirm("임시저장하고 미리보기하시겠습니까?")) fn_save("preview");
}

function fn_save(gb){

	// validation check START
	if(!fn_chkValidation()) return;

	var contentsGb = $("[name=contentsGb] option:selected").val();
	if(contentsGb == "FILE") { // 컨텐츠 내용이 파일인 경우
		if(isEmpty($(".fileName").val())) {
			alert("컨텐츠 내용이 파일 첨부인 경우 파일 첨부는 필수입니다.");
			return;
		}
	} else if(contentsGb == "EDITOR") { // 컨텐츠 내용이 에디터인 경우
		// 수정된 내용 반영
		oEditors1.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);

		// 빈 값 체크
		if(isEmpty($("#contents").val()) || $("#contents").val() == '&nbsp;' || $("#contents").val() == '<p>&nbsp;</p>'){
			alert("컨텐츠 내용은 필수 입력 항목입니다.");
			return false;
		}
	}
	// validation check End

	$("#useYn").val($("#useYnChk").is(":checked") ? "Y" : "N");
	$("#deleteFileArr").val(JSON.stringify(deleteFileArr));
	$("#form").attr("action", "/cms/contents/saveContentsInfoAjax.do");
	$("#saveGb").val(gb);

	var option = {
		success : function(data) {
			if( data.retcode == "SUCC") {
				if(gb == "preview") window.open("/cms/contents/previewContents.do?contentsSeq=" + data.contentsSeq);
				else if(gb == "save") {
					alert(data.message);
					fn_goList()
				}
			} else {
				alert(data.message);
				console.log(data.errCode);
			}
		},
		error : function(jqXHR, textStatus, errorThrown){
			$("#loading").hide();
	        alert("문제가 발생하였습니다.\n고객센터에 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
	    },
		type : "POST"
	}

	$("#form").ajaxSubmit(option);
// 	sbmit("form", "/cms/contents/saveContentsInfoAjax.do");
}

</script>

<style>
	.iptMenuCntnts {display: none;}
	.writeCntntInner .ipt.w100p::placeholder {font-size:1em;}
	#contentsArea .btn {min-height: auto; padding: 6px 20px;}
</style>

<%@include file="../layout/footer.jsp"%>