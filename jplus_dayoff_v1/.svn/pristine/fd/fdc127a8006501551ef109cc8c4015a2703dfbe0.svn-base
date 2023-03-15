<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
<form id="form" name="form" method="post" onsubmit="return false;" enctype="multipart/form-data">
	<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
	<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
	<input type="hidden" name="bannerSeq" id="bannerSeq" value="<c:out value='${bannerSeq}'/>" />
	<input type="hidden" name="realFilePath" id="realFilePath" value="BANNER" />
	<input type="hidden" name="deleteFileArr" id="deleteFileArr"/>

	<div class="row">
		<div class="col-6">
			<div class="card">
	    		<div class="card-body">
	    			<h4 class="card-title req">메인 카피</h4>
	    			<input type="text" name="bannerTitle" class="form-control form-control-line reqIpt" data-label="메인 카피" value="<c:out value='${result.BANNER_TITLE}'/>" maxlength="90"/>
	    		</div>
	    	</div>
	    </div>
	    <div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
	    			<h4 class="card-title">서브 카피</h4>
	    			<input type="text" name="bannerSubTitle" class="form-control form-control-line" value="<c:out value='${result.BANNER_SUB_TITLE}'/>" maxlength="90"/>
	    		</div>
	    	</div>
	    </div>
	</div>
	<div class="row">
	    <div class="col-12">
	    	<div class="card">
	    		<div class="card-body">
	    			<h4 class="card-title">내용</h4>
	    			<textarea name="bannerCntnt" class="form-control form-control-line" maxlength="600" rows="5"/><c:out value='${result.BANNER_CNTNT}'/></textarea>
	    		</div>
	    	</div>
		</div>
	</div>
	<div class="row">
	    <div class="col-12">
	    	<div class="card">
                <div class="card-body">
                    <h4 class="card-title req">배너 이미지</h4>
                    <label for="bannerImg" class="uploadLabel">
                    	<input type="file" id="bannerImg" name="bannerImg" class="dropify reqIpt" data-label="배너 이미지" value="<c:out value='${result.BANNER_IMG_FILE_PATH_NM}'/>" data-default-file="<c:out value='${result.BANNER_IMG_FILE_PATH_NM}'/>" fileSeq="<c:out value='${result.FILE_SEQ}'/>" accept="image/*"/>
                    </label>
                </div>
            </div>
		</div>
	</div>
	<div class="row">
		<div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">사용여부</h4>
					<div class="switch">
                        <label>
                        	<input type="hidden" name="showYn" id="showYn" />
                            <input type="checkbox" id="showYnChk" <c:if test="${result.SHOW_YN ne 'N'}">checked</c:if>>
                            <span class="lever" style="margin-left: 0;"></span>
                        </label>
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

var deleteFileArr = new Array();

$(function(){
	$('.dropify').dropify();

	$(".dropify-clear").click(function(){
		var targetId = $(this).parents("label").attr("for");
		if(!isEmpty($("#" + targetId).attr("fileSeq")))  deleteFileArr.push($("#" + targetId).attr("fileSeq"));
	})
	$("#bannerImg").change(function(){
		if(!isEmpty($(this).attr("fileSeq"))) deleteFileArr.push($(this).attr("fileSeq"));
	})
})

function fn_goList() {
	sbmit("form", "/cms/visual/mainBannerList.do");
}

function fn_regist(){

	// validation check START
	if(!fn_chkValidation()) return;
	// validation check End

	if($("#isModify").val() == "Y") $("#deleteFileArr").val(JSON.stringify(deleteFileArr));

	if(confirm("저장하시겠습니까?")) {

		$("#showYn").val($("#showYnChk").is(":checked") ? "Y" : "N");
		$("#form").attr("action", "/cms/visual/saveMainBannerInfoAjax.do");

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
			url : "/cms/visual/deleteMainBannerInfoAjax.do",
			traditional : true,
			dataType : 'json',
			data : $("#form").serialize(),
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
		    }
		});
	}
}

</script>