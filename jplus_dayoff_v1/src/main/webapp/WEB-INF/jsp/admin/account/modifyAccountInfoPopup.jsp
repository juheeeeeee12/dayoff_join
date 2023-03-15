<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

a<section id="modifyAccountModal" class="modal notranslate on" style="width: 50%; display: block; top: 250px;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">개인정보 수정</h4>
				<button type="button" class="close" onclick="modalFn.hide($('#modifyAccountModal'));">×</button>
			</div>
			<div class="modal_content">
				<div class="inner">
					<section>
						<div class="modal-body">
							<form id="modifyAccountForm" name="modifyAccountForm" method="post" enctype="multipart/form-data">
								<input type="hidden" name="isModify" value="Y">
								<input type="hidden" name="adminId" value="<c:out value='${myAccountInfo.ADMIN_ID}'/>">
								<input type="hidden" name="joinStatusCd" value="02">
							<ul class="user-form">
								<li class="form-group"><label for="userId" class="req">아이디</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i class="ti-user"></i></span>
										</div>
										<input type="text" class="form-control" name="adminId" id="adminId" value="<c:out value='${myAccountInfo.ADMIN_ID}'/>" readonly >
									</div></li>
								<li class="form-group"><label for="userName" class="req" >이름</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i class="ti-user"></i></span>
										</div>
										<input type="text" class="form-control" id="loginNm" placeholder="Username" name="adminNm" value="<c:out value='${myAccountInfo.ADMIN_NM}'/>" >
									</div></li>
							</ul>
							<ul class="user-form">
								<li class="form-group"><label for="userpwd1">비밀번호</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
										</div>
										<button type="button" class="btn btn-inverse waves-effect waves-light chgPwd" onclick="fn_openChgPwdModal();">비밀번호 변경</button>
									</div>
								</li>
							</ul>
						</form>
						</div>
					</section>
					<div class="modal-footer">
						<button type="button" class="btn btn-info waves-effect waves-light m-r-10" onclick="fn_modify();">수정</button>
						<button type="button" class="btn btn-danger waves-effect text-left" onclick="modalFn.hide($('#modifyAccountModal'));">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function fn_modify(){

		if(confirm("수정하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : "/cms/member/saveAdminInfoAjax.do",
				traditional : true,
				dataType : 'json',
				data : $("#modifyAccountForm").serialize(),
				success : function(data) {
					alert(data.message);
					if( data.retcode == "SUCC") {
						modalFn.hide($('#modifyAccountModal'));
					}
				},
				error : function(jqXHR, textStatus, errorThrown){
			        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
			    }
			});
		}

	}

</script>