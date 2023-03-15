<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
<form id="form" name="form" method="post" onsubmit="return false;" enctype="multipart/form-data">
	<input type="hidden" name="pageIndex" value="<c:out value='${pageIndex}'/>"/>
	<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
	<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
	<input type="hidden" name="schGb" id="schGb" value="<c:out value='${schGb}'/>" />
	<input type="hidden" name="schVal" id="schVal" value="<c:out value='${schVal}'/>" />
	<input type="hidden" name="menuSeq" id="menuSeq" value="<c:out value='${menuSeq}'/>" />
	<input type="hidden" name="parentMenuSeq" id="parentMenuSeq" value="<c:out value='${result.P_MENU_SEQ}'/>" />
	<input type="hidden" name="realFilePath" id="realFilePath" value="MENU" />
	<input type="hidden" name="deleteFileArr" id="deleteFileArr"/>

	<div class="row">
	    <div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">메뉴 차수</h4>
					<select class="form-control custom-select" id="menuDepth" name="menuDepth" style="width: 20%;" onchange="fn_chgMenuDepth();">
						<option value="1" <c:if test="${result.MENU_DEPTH eq '1'}">selected</c:if>>상위메뉴</option>
			            <option value="2" <c:if test="${result.MENU_DEPTH eq '2'}">selected</c:if>>하위메뉴</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-6 pMenuDiv" style="display: none;">
			<div class="card">
	    		<div class="card-body">
	    			<h4 class="card-title req">상위 메뉴</h4>
	    			<div>
                    	<select id="parentMenu" name="pMenuSeq" class="form-control form-control-line reqIpt" style="width: auto" data-label="상위 메뉴">
                    		<option value="">-선택-</option>
                    	</select>
                    </div>
	    		</div>
	    	</div>
	    </div>
	</div>

	<div id="menuBannerImgDiv" class="row" style="display: none;">
	    <div class="col-12">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">메뉴 배너 이미지</h4>
					<label for="menuBannerImg" class="uploadLabel">
                    	<input type="file" id="menuBannerImg" name="menuBannerImg" class="dropify reqIpt" data-label="메뉴 배너 이미지"
                    		value="<c:out value='${result.MENU_BANNER_IMG_FILE_PATH_NM}'/>" data-default-file="<c:out value='${result.MENU_BANNER_IMG_FILE_PATH_NM}'/>" fileSeq="<c:out value='${result.FILE_SEQ}'/>" accept="image/*"/>
                    </label>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
	    <div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">메뉴명</h4>
					<input type="text" name="menuNm" class="form-control form-control-line w100p reqIpt" data-label="메뉴명" value="<c:out value='${result.MENU_NM}'/>" maxlength="30"/>
				</div>
			</div>
		</div>
		<div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">메뉴 순서</h4>
					<input type="text" name="menuOrder" class="form-control form-control-line reqIpt onlyNumber" data-label="메뉴 순서" value="<c:out value='${result.MENU_ORDER}'/>" maxlength="3"/>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
	    <div class="col-6">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">메뉴 구분</h4>
					<div class="rdoWrap">
						<c:forEach items="${menuTypeList}" var="i" varStatus="status">
	              			<input type="radio" name="menuGbCd" autocomplete="off" id="menuGb_<c:out value='${i.SUB_CD}'/>" value="<c:out value='${i.SUB_CD}'/>" class="custom" <c:if test="${(status.index eq 0 and empty result.MENU_GB_CD) or result.MENU_GB_CD eq i.SUB_CD}">checked</c:if>>
	          				<label class="ml5 mr10" for="menuGb_<c:out value='${i.SUB_CD}'/>"><c:out value='${i.SUB_CD_NM}'/></label>
	              		</c:forEach>
              		</div>
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

	<div class="row" id="choiceMenuGbWrp" <c:if test="${empty result.MENU_GB_CD or result.MENU_GB_CD eq '00'}">style="display: none;"</c:if>>
	    <div class="col-12">
	    	<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req"></h4>
					<input type="text" name="menuUrl" class="form-control form-control-line reqIpt iptMenuCntnts w100p" data-label="URL" value="<c:out value='${result.MENU_URL}'/>" maxlength="300"/>
              		<select class="form-control custom-select iptMenuCntnts" name="boardSeq" style="width: auto;" data-label="게시판 선택">
              			<option value="">-선택-</option>
              			<c:forEach items="${boardList}" var="list" varStatus="status">
              				<option value="<c:out value='${list.BOARD_SEQ}'/>" <c:if test="${result.BOARD_SEQ eq list.BOARD_SEQ}">selected</c:if>><c:out value='${list.BOARD_NM}'/></option>
              			</c:forEach>
              		</select>
              		<select class="form-control custom-select iptMenuCntnts" name="contentsSeq" style="width: auto;" data-label="컨텐츠 선택">
              			<option value="">-선택-</option>
              			<c:forEach items="${contentsList}" var="list" varStatus="status">
              				<option value="<c:out value='${list.CONTENTS_SEQ}'/>" <c:if test="${result.CONTENTS_SEQ eq list.CONTENTS_SEQ}">selected</c:if>><c:out value='${list.CONTENTS_NM}'/></option>
              			</c:forEach>
              		</select>
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

	fn_chgMenuDepth();

	$(".dropify-clear").click(function(){
		var targetId = $(this).parents("label").attr("for");
		if(!isEmpty($("#" + targetId).attr("fileSeq")))  deleteFileArr.push($("#" + targetId).attr("fileSeq"));
	})
	$("#menuBannerImg").change(function(){
		if(!isEmpty($(this).attr("fileSeq"))) deleteFileArr.push($(this).attr("fileSeq"));
	})

	$("[name=menuGbCd]").change(function(){
		fn_hideShowIptMenuCntnts();
	})

	if($("#isModify").val() == "Y") fn_hideShowIptMenuCntnts();

});


// 메뉴 depth별 상위메뉴 hide show
function fn_chgMenuDepth(){
	var menuDepth = $("[name=menuDepth] option:selected").val();
	if(menuDepth != '1'){ // 하위메뉴
		$(".pMenuDiv").show();

		// 상위 메뉴 리스트 불러오기 ajax
		$.ajax({
			type : "POST",
			url : "/cms/system/selectParentMenuListAjax.do",
			traditional : true,
			dataType : 'json',
			data : {
				menuDepth : menuDepth
			},
			success : function(data) {
				if( data.retcode == "SUCC") {
					var pMenuList = data.pMenuList;
					if(pMenuList != null) {
						var str = '<option value="">-선택-</option>';
						$.each(pMenuList, function(idx, item){
							str += '<option value="' + item.MENU_SEQ + '">' + item.MENU_NM + '</option>';
			        	});

						$("#parentMenu").html(str);
						if($("#isModify").val() == "Y" && !isEmpty($("#parentMenuSeq").val())) {
							$("#parentMenu").val($("#parentMenuSeq").val()).prop("selected", true);
						}
					}
				} else {
					console.log(data.errCode);
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
		        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
		$("#menuBannerImgDiv").hide();
	} else { // 대메뉴
		$(".pMenuDiv").hide();
		$("#menuBannerImgDiv").show();
	}
}

// 메뉴 구분별 입력항목 hide / show
function fn_hideShowIptMenuCntnts(){
	var menuGbCd = $("[name=menuGbCd]:checked").val();
	if(menuGbCd != '00') {
		var lbl = "";
		$(".iptMenuCntnts").hide();
		if(menuGbCd == '01') { lbl = "메뉴 URL"; $("[name=menuUrl]").show(); }
		else if(menuGbCd == '02') { lbl = "게시판 선택"; $("[name=boardSeq]").show(); }
		else if(menuGbCd == '03') { lbl = "컨텐츠 선택"; $("[name=contentsSeq]").show(); }
		$("#choiceMenuGbWrp h4").text(lbl);
		$("#choiceMenuGbWrp").show();
	}
	else $("#choiceMenuGbWrp").hide();
}

function fn_regist(){

	if(!fn_chkValidation()) return;

	if($("#isModify").val() == "Y") $("#deleteFileArr").val(JSON.stringify(deleteFileArr));

	$("#useYn").val($("#useYnChk").is(":checked") ? "Y" : "N");

	if(confirm("저장하시겠습니까?")) {

		$("#form").attr("action", "/cms/system/saveMenuInfoAjax.do");

		var option = {
			beforeSend: function(){
				$("#loading").show();
			},
			success : function(data) {
				$("#loading").hide();
				alert(data.message);
				fn_goList();
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
			url : "/cms/system/deleteMenuInfoAjax.do",
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
	sbmit("form", "/cms/system/mngMenuList.do");
}
</script>
<style>
.iptMenuCntnts {display: none;}
</style>



<%@include file="../layout/footer.jsp"%>