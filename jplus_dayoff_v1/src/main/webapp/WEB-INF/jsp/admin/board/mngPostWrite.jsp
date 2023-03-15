<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
	<form id="form" name="form" method="POST" onsubmit="return false;" enctype="multipart/form-data">
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
		<input type="hidden" name="nowPostSeq" value="<c:out value='${nowPostSeq}'/>"/>
		<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
		<input type="hidden" name="boardSeq" id="boardSeq" value="<c:out value='${boardSeq}'/>" />
		<input type="hidden" name="postSeq" id="postSeq" value="<c:out value='${postSeq}'/>" />
		<input type="hidden" name="keywords" id="keywords" />

		<input type="hidden" name="realFilePath" id="realFilePath" value="POST" />
		<input type="hidden" name="deleteFileArr" id="deleteFileArr"/>
		<input type="hidden" name="reOrderArr" id="reOrderArr"/>

		<c:if test="${boardInfo.CATE_USE_YN eq 'Y'}">
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title req">카테고리</h4>
						    <select name="postCategorySeq" class="ipt reqIpt form-control custom-select" style="width:25%; margin-bottom: 8px;" data-label="카테고리">
						    	<c:forEach items="${boardCategoryList}" var="list" varStatus="status">
						    		<option value="<c:out value='${list.CATEGORY_SEQ}'/>" <c:if test="${result.POST_CATEGORY_SEQ eq list.CATEGORY_SEQ}">selected</c:if>><c:out value='${list.CATEGORY_NM}'/></option>
						    	</c:forEach>
						    </select>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title req">게시여부</h4>
							<div class="switch">
								<label>
									<input type="hidden" name="showYn" />
									<input type="checkbox" class="switchChk" id="showYn" <c:if test="${result.SHOW_YN ne 'N'}">checked</c:if>>
									<span class="lever"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${boardInfo.CATE_USE_YN ne 'Y'}">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title req">게시여부</h4>
							<div class="switch">
								<label>
									<input type="hidden" name="showYn" />
									<input type="checkbox" class="switchChk" id="showYn" <c:if test="${result.SHOW_YN ne 'N'}">checked</c:if>>
									<span class="lever" style="margin-left: 0;"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title req">제목</h4>
						<input type="text" name="postTitle" class="ipt form-control form-control-line reqIpt" data-label="제목" value="<c:out value='${result.POST_TITLE}'/>" maxlength="30"/>
					</div>
				</div>
			</div>
		</div>

		<c:if test="${boardInfo.BOARD_TYPE_CD ne '01'}">
			<div class="row">
				<div class="col-12 col-md-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">썸네일</h4>
							<label for="thumbImg" class="uploadLabel">
								<input type="file" id="thumbImg" name="thumbImg" class="dropify" data-label="썸네일" value="<c:out value='${result.FILE_PATH_NM}'/>" data-default-file="<c:out value='${result.FILE_PATH_NM}'/>" fileSeq="<c:out value='${result.FILE_SEQ}'/>" accept="image/*"/>
							</label>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${boardInfo.IMG_SLIDE_YN eq 'Y'}">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">슬라이드 이미지</h4>
							<c:set var="minImgCnt" value="${empty boardInfo.MIN_IMG_CNT ? 1 : boardInfo.MIN_IMG_CNT}"/>
							<c:set var="maxImgCnt" value="${empty boardInfo.MAX_IMG_CNT ? 5 : boardInfo.MAX_IMG_CNT}"/>
							<c:set var="curImgCnt" value="${empty postImgList ? 1 : fn:length(postImgList) }"/>

							<div id="postImgArea">
								<c:if test="${not empty postImgList}">
									<c:forEach var="i" items="${postImgList}" varStatus="status">
										<div class="wrap_sortable">
											<label for="postImg_<c:out value='${status.count}'/>" class="uploadLabel postImgWrap">
												<input type="file" id="postImg_<c:out value='${status.count}'/>" class="dropify postImg" data-label="슬라이드 이미지" value="<c:out value='${i.FILE_PATH_NM}'/>" data-default-file="<c:out value='${i.FILE_PATH_NM}'/>" fileSeq="<c:out value='${i.FILE_SEQ}'/>" accept="image/*"/>
											</label>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${empty postImgList}">
									<div class="wrap_sortable">
										<label for="postImg_1" class="uploadLabel postImgWrap">
											<input type="file" id="postImg_1" class="dropify postImg" data-label="슬라이드 이미지" accept="image/*"/>
										</label>
									</div>
								</c:if>
							</div>

							<div class="item_add_line">
								<button class="btn i-co waves-effect waves-light btn-info m-r-10" type="button" onclick="fn_addSlide();"><i class="ti-plus"></i></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title req">내용</h4>
						<textarea maxlength="3000" class="ipt form-control form-control-line" name="postCntnt" id="postCntnt" style="width: 100%; height: 300px; margin-bottom: 30px;" placeholder="내용을 입력해주세요."><c:out value='${result.POST_CNTNT}' escapeXml='false'/></textarea>
					</div>
				</div>
			</div>
		</div>

		<c:if test="${boardInfo.ATTACH_YN eq 'Y'}">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">파일첨부</h4>

							<div class="dropzone dz-clickable" id="fileDropzone">
								<c:if test="${not empty attachFileList}">
									<c:forEach var="i" items="${attachFileList}" varStatus="status">
										<input type="hidden" id="attachFile" name="attachFile" src="<c:out value='${i.FILE_PATH_NM}'/>" data-fileName="<c:out value='${i.FILE_NM}'/>" data-fileSize="<c:out value='${i.FILE_SIZE}'/>" fileSeq="<c:out value='${i.FILE_SEQ}'/>">
									</c:forEach>
								</c:if>
								<div class="dz-default dz-message"><span>Drop files here to upload</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${boardInfo.KEYWORD_YN eq 'Y'}">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">키워드</h4>
							<div id="keywordArea">
								<c:if test="${empty result.KEYWORDS}">
									<div class="keywordIptWrap">
										<input type="text" class="ipt form-control form-control-line keywordIpt" style="width:75%;" maxlength="20"/>
										<button class="btn i-co waves-effect waves-light btn-danger" type="button" onclick="fn_removeKeyword(this);"><i class="ti-minus"></i></button>
									</div>
								</c:if>
								<c:if test="${not empty result.KEYWORDS}">
									<c:forEach items="${fn:split(result.KEYWORDS, '┃') }" var="item" varStatus="status">
										<div class="keywordIptWrap left">
											<input type="text" class="ipt form-control form-control-line keywordIpt" style="width:75%;" value="<c:out value='${item}'/>" maxlength="20"/>
											<button class="btn i-co waves-effect waves-light btn-danger" type="button" onclick="fn_removeKeyword(this);"><i class="ti-minus"></i></button>
										</div>
									</c:forEach>
								</c:if>
							</div>
							<div class="btn_group left plusBtn">
								<button class="btn i-co waves-effect waves-light btn-info m-r-10" type="button" onclick="fn_addKeyword();"><i class="ti-plus"></i></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

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


<script type="text/javascript">

var deleteFileArr = new Array();
var oEditors1 = [];

const maxInage = '<c:out value="${maxImgCnt}"/>';
const minImage = '<c:out value="${minImgCnt}"/>';
let curImage = '<c:out value="${curImgCnt}"/>';

$(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors1,
		elPlaceHolder: "postCntnt",
		sSkinURI: "/resources/js/smart_editor/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams: {fOnBeforeUnload: function(){}}
		,fOnAppLoad: function(){}
	});

	$("#thumbImg").change(function(){
		if(!isEmpty($(this).attr("fileSeq"))) {
			deleteFileArr.push($(this).attr("fileSeq"));
		}
	});

	$(".postImg").change(function(){
		if(!isEmpty($(this).attr("fileSeq"))) {
			deleteFileArr.push($(this).attr("fileSeq"));
		}
	});

	$("#postImgArea").sortable({
		handel: ".wrap_sortable",
		revert : true
	});

	$("div#fileDropzone").dropzone({
		url: "/file/dropzone.do",
		method: "post",
		paramName: "attachFile",
		autoProcessQueue: false,
		clickable: true,
		maxFiles: 10,
		parallelUploads: 10,
		createImageThumbnails: true,
		autoDiscover: false,
		addRemoveLinks: true,
		dictRemoveFile: '삭제',
		uploadMultiple: true,
		init: function() {
			let myDropzone = this;

			$('input[name=attachFile]').each(function(){
		        let mockFile = {
		                name: $(this).attr("data-fileName"),
		                size: $(this).attr("data-fileSize"),
		                fileSeq: $(this).attr("fileSeq"),
		                status: Dropzone.SUCCESS,
		                accepted: true
		        };
		        myDropzone.createThumbnailFromUrl(mockFile, $(this).attr("src"));
				myDropzone.emit("addedfile", mockFile);
				myDropzone.emit("thumbnail", mockFile, $(this).attr("src"));
				myDropzone.emit("success", mockFile);
				myDropzone.files.push(mockFile);
		    });

			// maxFiles 카운터를 초과하면 경고창
            this.on("maxfilesexceeded", function (file) {
                alert("최대 업로드 파일 수는 " + myDropzone.options.maxFiles + "개 입니다.");
                myDropzone.removeFile(file);
            });

            // 이미지 삭제
            this.on("removedfile", function (file) {
            	if (file.fileSeq != null && file.fileSeq != undefined) {
            		deleteFileArr.push(file.fileSeq);
            	}
            });

            this.on("sendingmultiple", function(data, xhr, formData) {
            	formData.append("isModify", $("input[name='isModify']").val());
            	formData.append("postSeq", $("input[name='postSeq']").val());
            	formData.append("realFilePath", $("input[name='realFilePath']").val());
            	formData.append("deleteFileArr", $("input[name='deleteFileArr']").val());
            });
		}
	});

	fn_dropify();

});

function fn_dropify() {

	$('.dropify').dropify();

	$(".dropify-clear").click(function(){
		var targetId = $(this).parents("label").attr("for");
		if(!isEmpty($("#" + targetId).attr("fileSeq"))) {
			deleteFileArr.push($("#" + targetId).attr("fileSeq"));
		}
		if ($(".wrap_sortable").length > 1) {
			$(this).closest(".wrap_sortable").remove();
		}
	});
}

function fn_goList(){
	sbmit("form", "/cms/board/mngPostList.do");
}

function fn_reOrdering(fileSeq, fileName) {
	$.ajax({
		url : '/file/reOrderingImgFile.do',
		type : 'POST',
		dataType : 'json',
		data : {
			"fileSeq" : fileSeq,
			"fileName" : fileName
		},
	});
}

function fn_regist(){

	// validation check START
	if(!fn_chkValidation()) return;

	// 수정된 내용 반영
	oEditors1.getById["postCntnt"].exec("UPDATE_CONTENTS_FIELD", []);

	// 빈 값 체크
	if(isEmpty($("#postCntnt").val()) || $("#postCntnt").val() == '&nbsp;' || $("#postCntnt").val() == '<p>&nbsp;</p>'){
		alert("내용은 필수 입력 항목입니다.");
		return false;
	}

	// 슬라이드 이미지 최소 개수 체크
	if ($(".postImgWrap").length < minImage) {
		alert("슬라이드 이미지의 최소 파일 수는 " + minImage + "개 입니다.");
		return false;
	}
	// validation check End

	$(".switchChk").each(function(){
		$("[name=" + $(this).attr("id") + "]").val($(this).is(":checked") ? "Y" : "N");
	})

	if($("#keywordArea").length > 0) {
		var str = "";
		$(".keywordIpt").each(function(idx, item){
			if(!isEmpty($(this).val())) str += $(this).val() + "┃";
		})
		$("#keywords").val(str);
	}

	$(".attachFile").each(function(idx, item){
		$(this).attr("name", "attachFile_" + (idx+1));
	});

	var reOrderArr = new Array();
	$(".postImg").each(function(idx, item){
		if(!isEmpty($(this).attr("fileSeq"))) {
			var tmpObj = new Object();
			tmpObj.chgOrder = (idx + 1);
			tmpObj.reOrdSeq = $(this).attr("fileSeq");
			reOrderArr.push(tmpObj);
		}
		if(item.files.length > 0) $(this).attr("name", "postImg_" + (idx + 1));
	});

	if($("#isModify").val() == "Y") {
		$("#deleteFileArr").val(JSON.stringify(deleteFileArr));
		if(reOrderArr.length > 0) $("#reOrderArr").val(JSON.stringify(reOrderArr));
	}

	if(confirm("저장하시겠습니까?")) {

		$("#form").attr("action", "/cms/board/savePostInfoAjax.do");

		var option = {
			beforeSend: function(){
				$("#loading").show();
			},
			success : function(data) {
				$("#loading").hide();
				alert(data.message);
				if( data.retcode == "SUCC") fn_goList();
			},
			error : function(jqXHR, textStatus, errorThrown){
				$("#loading").hide();
				alert("문제가 발생하였습니다.\n고객센터에 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
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
			url : "/cms/board/deletePostInfoAjax.do",
			traditional : true,
			dataType : 'json',
			data : $("#form").serialize(),
			beforeSend: function(){
				$("#loading").show();
			},
			success : function(data) {
				$("#loading").hide();
				alert(data.message);
				if( data.retcode == "SUCC") {
					fn_goList();
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
				$("#loading").hide();
		        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
	}
}

function fn_addSlide() {
	if($(".postImgWrap").length >= maxInage) {
		alert("슬라이드 이미지의 최대 개수는 " + maxInage + "개 입니다.");
		return ;
	}
	curImage += 1;
	var str = '<div class="wrap_sortable">'
			+ '	<label for="postImg_' + curImage +'" class="uploadLabel postImgWrap">'
			+'		<input type="file" id="postImg_' + curImage +'" class="dropify postImg" data-label="슬라이드 이미지" accept="image/*"/>'
			+ '	</label>'
			+ '</div>';
	$("#postImgArea").append(str);
	fn_dropify();
}

function fn_addKeyword(){
	if($(".keywordIptWrap").length >= 20) { alert("키워드는 20개까지만 등록하실 수 있습니다."); return; }
	var str = '<div class="keywordIptWrap">'
		    + '    <input type="text" class="ipt form-control form-control-line keywordIpt" style="width:75%;" maxlength="20"/>'
		    + '    <button class="btn i-co waves-effect waves-light btn-danger m-r-10" type="button" onclick="fn_removeKeyword(this);"><i class="ti-minus"></i></button>'
		    + '</div>';
	$("#keywordArea").append(str);
}

function fn_removeKeyword(t){
	$(t).closest(".keywordIptWrap").remove();
}

</script>

<style>
	.keywordIptWrap {float: left;}
	.defaultBtns {display: inline-block; position: relative; top: -1px;}
</style>

<%@include file="../layout/footer.jsp"%>