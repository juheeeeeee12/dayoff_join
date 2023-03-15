<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal chgPwdModal notranslate on"  >
	<div class="modal-dialog modal-m" style=" background: #fff;">
		<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">개인정보 수정</h4>
					<button type="button" class="close" onclick="modalFn.hide($('#modifyAccountModal'));">×</button>
				</div>
				<div class="modal-body">
					<form id="chgPwdForm" name="chgPwdForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="adminId" value="<c:out value='${sessionScope.adminId}'/> ">						
						<ul class="user-form">
							<li class="form-group"><label for="nowPwd" class="req">현재 비밀번호</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
									</div>
									<input type="password" id="nowPwd" name="nowPwd" class="form-control" data-label="현재 비밀번호" maxlength="20">
								</div>								
							</li>
							<li class="form-group"><label for="newPwd" class="req">비밀번호</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
									</div>
									<input type="password" id="newPwd" name="newPwd" class="form-control" data-label="새 비밀번호" maxlength="20">
								</div>
								
							</li>
							<li class="form-group"><label for="rePwd" class="req">새 비밀번호 확인</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
									</div>
									<input type="password" id="rePwd" name="rePwd" class="form-control" data-label="새 비밀번호 확인" maxlength="20">
								</div>								
							</li>
					</ul>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-info waves-effect waves-light m-r-10" onclick="fn_chgPwd();">변경</button>
			<button type="button" class="btn btn-danger waves-effect text-left" onclick="modalFn.hide($('#modifyAccountModal'));">취소</button>
		</div>
	</div>
</div>

<script>
	function fn_chgPwd(){
		
		if($("#nowPwd").val() == $("#newPwd").val()) {
			alert("현재 비밀번호와 새 비밀번호가 일치할 수 없습니다.");
			$("#nowPwd").focus();
			return;
		}
		if($("#newPwd").val() != $("#rePwd").val()) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			$("#newPwd").focus();
			return;
		}
		if($("#newPwd").val().length < 4) {
			alert("비밀번호는 4자 이상이어야 합니다.");
			$("#newPwd").focus();
			return;
		}
		if(confirm("비밀번호를 변경하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : "/cms/chgLoginPwdAjax.do",
				traditional : true,
				dataType : 'json',
				data : $("#chgPwdForm").serialize(),
				success : function(data) {
					alert(data.message);
					if( data.retcode == "SUCC") {
						window.location.href = '/cms/login.do'
					}	
				},
				error : function(jqXHR, textStatus, errorThrown){
			        alert("문제가 발생하였습니다.\n고객센터에 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
			    }
			});
			
		}
	}
			
	
</script>