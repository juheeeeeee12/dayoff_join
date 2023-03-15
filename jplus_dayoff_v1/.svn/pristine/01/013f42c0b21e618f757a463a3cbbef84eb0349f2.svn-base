<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
<form id="form" name="form" method="post" onsubmit="return false;">
	<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
	<input type="hidden" name="authSeq" id="authSeq" value="<c:out value='${authSeq}'/>" />
	<input type="hidden" name="menuAuthList" id="menuAuthList" />

	<div class="row">
		<div class="col-12">
			<div class="card">
	    		<div class="card-body">
					<h4 class="card-title req">권한 구분123</h4>
                	<select name="authCd" class="form-control custom-select reqIpt" data-label="계정 구분" style="width: 200px;" onchange="fn_chgAccountGb();">
		                <option value="">-선택-</option>
		                <c:forEach items="${accountGbList}" var="list" varStatus="status">
		                	<option value="<c:out value='${list.SUB_CD}'/>" <c:if test="${authCd eq list.SUB_CD}">selected</c:if>><c:out value='${list.SUB_CD_NM}'/></option>
		                </c:forEach>
		            </select>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
	    		<div class="card-body">
					<h4 class="card-title">메뉴 권한</h4>
                	<table class="table-bordered">
		            	<colgroup>
		            		<col width="15%">
		            		<col width="15%">
		            		<col width="25%">
		            		<col width="45%">
		            	</colgroup>
		                <tbody>
		                	<c:forEach items="${menuList}" var="menu" varStatus="status">
		                		<tr id="tr_<c:out value='${menu.MENU_SEQ}'/>">
		                			<th rowspan="<c:out value='${menu.ROWSPAN}'/>" colspan="<c:out value='${menu.COLSPAN}'/>" >
		                				<c:if test="${menu.MENU_DEPTH eq 1 and menu.DEPTH2_CHILD ne 0}">
		                					<input type="hidden" name="<c:out value='${menu.MENU_SEQ}'/>_read" id="<c:out value='${menu.MENU_SEQ}'/>_0" class="readChk authChk dep1auth"/>
		                				</c:if>
		                				<c:out value='${menu.MENU_NM}'/>
		                			</th>
		                			<c:if test="${menu.ROWSPAN <= 1}">
			                			<td>
			                				<ul class="customChkList">
				   		                        <li>
				   		                        	<input type="hidden" value="<c:out value='${menu.MENU_SEQ}'/>" class="menuSeq">
				                                    <div class="cont">
				                                        <input name="<c:out value='${menu.MENU_SEQ}'/>_read" type="checkbox" id="<c:out value='${menu.MENU_SEQ}'/>_1" class="custom readChk authChk" data-p_menu_seq="<c:out value='${menu.P_MENU_SEQ}'/>" onclick="fn_authChk(this);"/>
				                                        <label for="<c:out value='${menu.MENU_SEQ}'/>_1">조회</label>
				                                        <input name="<c:out value='${menu.MENU_SEQ}'/>_write" type="checkbox" id="<c:out value='${menu.MENU_SEQ}'/>_2" class="custom writeChk authChk" data-p_menu_seq="<c:out value='${menu.P_MENU_SEQ}'/>" onclick="fn_authChk(this);"/>
				                                        <label for="<c:out value='${menu.MENU_SEQ}'/>_2">등록/수정/삭제</label>
				                                    </div>
												</li>
											</ul>
			                			</td>
		                			</c:if>
		                		</tr>
		                	</c:forEach>
		                </tbody>
		            </table>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
	        <div class="btn_group right">
        		<button type="button" class="btn btn-info waves-effect waves-light" onclick="fn_regist();">저장</button>
	        </div>
	    </div>
	</div>

</form>
</div>
</div>

<script type="text/javascript">

$(function(){
	if(!isEmpty($("[name=authCd] option:selected").val())) fn_chgAccountGb();
// 	$(".authChk").click(function(){
// 		if(!registAuthYn) return;
// 	})
})

function fn_authChk(t){
	if(isEmpty($("[name=authCd] option:selected").val())) {
		alert("계정 구분을 선택해주세요.");
		$(t).prop("checked", false);
	}
	// 조회 권한 체크 해제 시 등록/수정/삭제 권한도 체크 해제
	if($(t).hasClass("readChk") && !$(t).is(":checked")) $(t).parents(".cont").find(".writeChk").prop("checked", false);
	// 등록/수정/삭제 권한 체크 시 조회 권한도 체크
	if($(t).hasClass("writeChk") && $(t).is(":checked")) $(t).parents(".cont").find(".readChk").prop("checked", true);
	// 소메뉴 권한이 하나라도 있을 경우 대메뉴 권한 부여 / 소메뉴 권한 모두 체크 해제시 대메뉴 권한 해제
	var pMenuSeq = $(t).data("p_menu_seq")
	if(!isEmpty(pMenuSeq)) {
		if($("[data-p_menu_seq=" + pMenuSeq + "]:checked").length == 0) $("[name=" + pMenuSeq + "_read]").val("N");
		else $("[name=" + pMenuSeq + "_read]").val("Y");
	}
}

function fn_chgAccountGb(){
	$(".authChk").prop("checked", false);
	var authCd = $("[name=authCd] option:selected").val();
	if(isEmpty(authCd)) return false;
	$(".dep1auth").val("N");
	$.ajax({
		type : "POST",
		url : "/cms/system/selectAuthMenuListAjax.do",
		traditional : true,
		dataType : 'json',
		data : {
			authCd : authCd
		},
		beforeSend: function(){
			$("#loading").show();
		},
		success : function(data) {
			$("#loading").hide();
			if( data.retcode == "SUCC") {
				var resultList = data.authMenuList;
				$.each(resultList, function(idx, item){
					if(item.MENU_DEPTH == "1" && $(".dep1auth[name=" + item.MENU_SEQ + "_read]").length > 0) {
						$("[name=" + item.MENU_SEQ + "_read]").val(item.READ_YN);
					} else {
						if(item.READ_YN == "Y") $("[name=" + item.MENU_SEQ + "_read]").prop("checked", true);
						if(item.WRITE_YN == "Y") $("[name=" + item.MENU_SEQ + "_write]").prop("checked", true);
					}
	        	});
			}
		},
		error : function(jqXHR, textStatus, errorThrown){
			$("#loading").hide();
	        alert("문제가 발생하였습니다.\n고객센터에 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
	    }
	});
}

function fn_regist(){

	// validation check START
	if(!fn_chkValidation()) return;
	// validation check End

	var menuAuthArr = new Array();
	$(".dep1auth").each(function(){ // 대메뉴 권한
		var tmpObj = new Object();
		tmpObj.menuSeq = $(this).attr("name").replace("_read", "");
		tmpObj.readYn = $(this).val() || "N";
		if($("[data-p_menu_seq=" + $(this).attr("id").split("_")[0] + "]:checked").length > 0) tmpObj.readYn = "Y";
		tmpObj.writeYn = "N";
		menuAuthArr.push(tmpObj);
	})
	$(".customChkList").each(function() { // 소메뉴 권한
		var tmpObj = new Object();
		tmpObj.menuSeq = $(this).find(".menuSeq").val();
		tmpObj.readYn = $(this).find(".readChk").is(":checked") ? "Y" : "N";
		tmpObj.writeYn = $(this).find(".writeChk").is(":checked") ? "Y" : "N";
		menuAuthArr.push(tmpObj);
	})

	$("#menuAuthList").val(JSON.stringify(menuAuthArr));
	$("#useYn").val($("#useYnChk").is(":checked") ? "Y" : "N");

	if(confirm("저장하시겠습니까?")) {

		$("#form").attr("action", "/cms/system/saveAuthInfoAjax.do");

		var option = {
			beforeSend: function(){
				$("#loading").show();
			},
			success : function(data) {
				$("#loading").hide();
				alert(data.message);
				if( data.retcode == "SUCC") sbmit("form", "/cms/system/mngAuthPage.do");

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
</script>
<%@include file="../layout/footer.jsp"%>