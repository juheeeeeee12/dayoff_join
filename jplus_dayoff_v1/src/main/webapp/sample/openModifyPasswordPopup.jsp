<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="pwdChgModal" class="modal chgPwdModal notranslate on"  >
	<div class="modal-dialog modal-m" >
		<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">개인정보 수정</h4>
					<button type="button" class="close" onclick="modalFn.hide($('#modifyAccountModal'));">×</button>
				</div>
				<div class="modal-body">
					<form id="chgPwdForm" name="chgPwdForm" method="post" enctype="multipart/form-data">						
						<ul class="user-form">
							<li class="form-group"><label for="nowPwd" class="req">현재 비밀번호</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
									</div>
									<input type="password" id="nowPwd" class="form-control" data-label="현재 비밀번호" maxlength="20">
								</div>								
							</li>
							<li class="form-group"><label for="newPwd" class="req">비밀번호</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
									</div>
									<input type="password" id="newPwd" class="form-control" data-label="새 비밀번호" maxlength="20">
								</div>
								
							</li>
							<li class="form-group"><label for="rePwd" class="req">새 비밀번호 확인</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i></span>
									</div>
									<input type="password" id="rePwd" class="form-control" data-label="새 비밀번호 확인" maxlength="20">
								</div>								
							</li>
					</ul>
					
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-info waves-effect waves-light m-r-10">변경</button>
			<button type="button" class="btn btn-danger waves-effect text-left" onclick="modalFn.hide($('#pwdChgModal'));">취소</button>
		</div>
	</div>
</div>