<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
	<form id="form" name="form" method="POST">
		<input type="hidden" name="pageIndex" value="<c:out value='${pageIndex}'/>" />
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>" />
		<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
		<input type="hidden" name="schGb" id="schGb" value="<c:out value='${schGb}'/>" />
		<input type="hidden" name="schVal" id="schVal" value="<c:out value='${schVal}'/>" />

	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<form class="form p-t-20">
						<ul class="user-form">
							<li class="form-group">
								<label for="memberId" class="req">회원 ID</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"><i class="ti-user"></i></span>
									</div>
									<input type="text" id="memberId" name="memberId" class="ipt form-control reqIpt" data-label="회원 ID" value="<c:out value='${result.MEMBER_ID}'/>" maxlength="20" <c:if test="${isModify eq 'Y'}">readonly</c:if>/>
								</div>
							</li>
							<li class="form-group">
								<label for="memberNm" class="req">회원 이름</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"><i class="ti-user"></i></span>
									</div>
									<input type="text" name="memberNm" class="ipt form-control reqIpt" data-label="회원 이름" value="<c:out value='${result.MEMBER_NM}'/>" maxlength="10" />
								</div>
							</li>
						</ul>
						<ul class="user-form">
							<li class="form-group">
								<label for="email">이메일</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"><i class="ti-email"></i></span>
									</div>
									<input type="email" name="email" class="form-control" id="email" data-label="이메일" value="<c:out value='${result.EMAIL}'/>" maxlength="100" />
								</div>
							</li>
							<li class="form-group"><label for="userAddress">주소</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-world"></i></span>
									</div>
									<input type="text" name="address" class="form-control" id="address" data-label="주소" value="<c:out value='${result.ADDRESS}'/>" maxlength="100" />
								</div>
							</li>
						</ul>
						<ul class="user-form">
							<li class="form-group">
								<label for="loginPwd" class="req">비밀번호</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
									</div>
									<input type="password" class="form-control" id="loginPwd" name="loginPwd" maxlength="20">
								</div>
							</li>
							<li class="form-group">
								<label for="reLoginPwd" class="req">비밀번호 확인</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"><i class="ti-lock"></i></span>
									</div>
									<input type="password" class="form-control" id="reLoginPwd" name="reLoginPwd" maxlength="20">
								</div>
							</li>
						</ul>
						<ul class="user-form">
							<li class="form-group phoneWrap"><label for="phoneNum" class="req">연락처</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-mobile"></i></span>
									</div>
									<input type="hidden" name="phoneNum" value="<c:out value='${result.PHONE_NUM}'/>"/>
									<input type="text" class="form-control reqIpt phoneNum onlyNumber" data-label="연락처" value="<c:out value="${fn:split(result.PHONE_NUM, '-')[0]}"/>" maxlength="3" /><span></span>
									<input type="text" class="form-control reqIpt phoneNum onlyNumber" data-label="연락처" value="<c:out value="${fn:split(result.PHONE_NUM, '-')[1]}"/>" maxlength="4" /><span></span>
									<input type="text" class="form-control reqIpt phoneNum onlyNumber" data-label="연락처" value="<c:out value="${fn:split(result.PHONE_NUM, '-')[2]}"/>" maxlength="4" />
								</div>
							</li>
							<li class="form-group">
								<label for="joinStatusCd">승인여부</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-check-box"></i></span>
									</div>
									<select name="joinStatusCd" data-label="승인여부" id="joinStatusCd" class="form-control custom-select" style="width: auto">
										<c:if test="${empty joinStatusCdList}">
											<option value="">-선택-</option>
										</c:if>
										<c:forEach items="${joinStatusCdList}" var="i" varStatus="status">
											<option value="<c:out value="${i.SUB_CD}"/>" <c:if test="${result.JOIN_STATUS_CD eq i.SUB_CD}">selected</c:if>><c:out value='${i.SUB_CD_NM}'/></option>
										</c:forEach>
									</select>
								</div>
							</li>
						</ul>
					</form>
				</div>
			</div>
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

$(function() {
	if($("#isModify").val() == "Y") {
		$("#loginPwdArea li label").removeClass("req");
		$("#loginPwdArea li input[type=password]").removeClass("reqIpt");
	}
})

function fn_goList(pageNo){
	sbmit("form", "/cms/member/mngMemberList.do");
}

function fn_regist() {

	// validation check START
	if (!fn_chkValidation()){
		return;
	}

	if ($("#isModify").val() != "Y" || ($("#isModify").val() == "Y" && (!isEmpty($("#loginPwd").val()) || !isEmpty($("#reLoginPwd").val())))) {
		if ($("#loginPwd").val() != $("#reLoginPwd").val()) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			$("#loginPwd").focus();
			return;
		}
		if ($("#loginPwd").val().length < 4) {
			alert("비밀번호는 4자 이상이어야 합니다.");
			$("#loginPwd").focus();
			return;
		}
	}

	// 이메일 유효성 및 중복체크
	if (!isEmpty($("#email").val())) {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!regExp.test($("#email").val())) {
			alert("이메일 형식과 맞지 않습니다.");
			$("#email").focus();
			return false;
		}
	}
	if ($("#isModify").val() == "N") {
		var regExp = /^[0-9a-zA-Z]{4,20}$/i;
		if (!regExp.test($("#memberId").val())) {
			alert("아이디는 4글자 이상 20자 이하의 숫자와 알파벳의 조합이어야 합니다.");
			$("#memberId").focus();
			return false;
		}
	}

	var vMobile = $(".phoneNum").map(function(){return this.value;}).get().join("-"); //휴대폰번호 val
	$("[name=phoneNum]").val(vMobile);

	// validation check End

	if(confirm("저장하시겠습니까?")) {
		$.ajax({
			type : "POST",
			url : "/cms/member/saveMemberInfoAjax.do",
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
			url : "/cms/member/deleteMemberInfoAjax.do",
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

</script>

<%@include file="../layout/footer.jsp"%>
