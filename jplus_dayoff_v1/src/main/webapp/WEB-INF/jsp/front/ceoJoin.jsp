<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./layout/frontTop.jsp"  %>
<form id="form" name="form" method="POST">
<div class="container-fluid">
	<!-- Row -->
	<div class="row" style=" justify-content: center;">
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<div class="center" style="margin-bottom: 30px;">
						<a href="/main.do" class="text-center dl logo" ><img src="/resources/assets/images/newjplus_logo.png" alt="Home" style="width:250px;" /></a>
					</div>
					<ul class="user-form">
						<li class="form-group"><label for="memberId">이메일</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-email"></i>
									</span>
								</div>
								<input type="email" class="form-control" id="memberId" name="memberId" placeholder="이메일 입력" maxlength="100"/>
							</div></li>
						<li class="form-group"><label for="memberNm" class="req">이름</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-user"></i>
									</span>
								</div>
								<input type="text" class="form-control reqIpt" id="memberNm" name="memberNm" data-label="이름" placeholder="이름 입력" maxlength="10"/>
							</div>
						</li>
					</ul>
					<ul class="user-form">
						<li class="form-group"><label for="memberPwd" class="req">비밀번호</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i>
									</span>
								</div>
								<input type="password" class="form-control reqIpt" id="memberPwd" name="memberPwd" data-label="비밀번호" placeholder="비밀번호 입력" maxlength="20"/>
							</div>
						</li>
						<li class="form-group"><label for="userpwd2" class="req">비밀번호 확인</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i>
									</span>
								</div>
								<input type="password" class="form-control reqIpt" id="reLoginPwd" data-label="비밀번호 확인" placeholder="비밀번호 재입력" maxlength="20"/>
							</div>
						</li>
					</ul>
					<ul class="user-form">
						<li class="form-group"><label for="memberBirth" class="req">생일</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-lock"></i>
									</span>
								</div>
								<input type="date" class="form-control reqIpt" id="memberBirth" name="memberBirth" placeholder="생일 입력" maxlength="100"/>
							</div>
						</li>
						<li class="form-group"><label for="address">주소</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-world"></i>
									</span>
								</div>
								<input type="text" class="form-control" id="address" name="address" placeholder="주소 입력" maxlength="100"/>
							</div>
						</li>
					</ul>
					<ul class="user-form">
						<li class="form-group"><label for="workDate">입사일</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-email"></i>
									</span>
								</div>
								<input type="date" class="form-control" id="workDate" name="workDate" placeholder="입사일 입력" maxlength="100"/>
							</div></li>
						<li class="form-group phoneWrap"><label for="phoneNum" class="req">연락처</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-mobile"></i>
									</span>
								</div>
								<input type="hidden" name="phoneNum"/>
								<input type="text" class="form-control reqIpt phoneNum onlyNumber" data-label="연락처" maxlength="3" /><span></span>
								<input type="text" class="form-control reqIpt phoneNum onlyNumber" data-label="연락처" maxlength="4" /><span></span>
								<input type="text" class="form-control reqIpt phoneNum onlyNumber" data-label="연락처" maxlength="4" />
							</div>
						</li>
					</ul>
					<ul class="user-form">
						<li class="form-group"><label for="cpNum">사업자번호</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-email"></i>
									</span>
								</div>
								<input type="text" class="form-control" id="cpNum" name="cpNum" placeholder="사업자번호 입력" maxlength="100"/>
							</div></li>
						<li class="form-group phoneWrap"><label for="cpNm" class="req">회사명</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"> <i class="ti-mobile"></i>
									</span>
								</div>
								<input type="text" class="form-control reqIpt" id="cpNm" name="cpNm" placeholder="회사명 입력" maxlength="20"/>
								<input type="hidden" name="memberGb" value="A"/>
								<input type="hidden" name="memberPosition" value="대표"/>
							</div>
						</li>
					</ul>
					<div class="form-group m-b-0 d-flex">
	                    <p class="left"><a href="/main.do" class="link m-l-5"><b>메인으로</b></a></p>
	                    <p class="right">계정이 있으신가요? <a href="/login.do" class="link m-l-5"><b>로그인</b></a></p>
                    </div>
				</div>
			</div>
			<div class="btn_group">
				 <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="button" onclick="fn_regist();">회원가입</button>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>

<style>
.container-fluid { height: 100vh; display: flex; align-items: center; }
.row { flex: 1; }
</style>

<script>

function fn_regist() {

	// validation check START
	if (!fn_chkValidation()){
		return;
	}

/* 	var regExp = /^[0-9a-zA-Z]{4,20}$/i;
	if (!regExp.test($("#memberId").val())) {
		alert("아이디는 4글자 이상 20자 이하의 숫자와 알파벳의 조합이어야 합니다.");
		$("#memberId").focus();
		return false;
	} */

	if ($("#memberPwd").val() != $("#reLoginPwd").val()) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#memberPwd").focus();
		return;
	}
	if ($("#memberPwd").val().length < 4) {
		alert("비밀번호는 4자 이상이어야 합니다.");
		$("#memberPwd").focus();
		return;
	}

	// 이메일 유효성 및 중복체크
	if (!isEmpty($("#memberId").val())) {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (!regExp.test($("#memberId").val())) {
			alert("이메일 형식과 맞지 않습니다.");
			$("#memberId").focus();
			return false;
		} else{
			const url = "/emailCheck.do";
			const email = $("#memberId").val();
			console.log(email);
			$.ajax({
				type : "POST",
				url : url,
				data : email,
				dataType : 'json',
				success : function(data){
					if(data.result == "FAIL"){
						return false;
					}
				}
			});
		}
	}

	
/* 	//회사코드 존재여부 확인
	const url = "/cpCodeCheck.do";
	var cpCode = $("#cpCode").val();
	$.ajax({
		type : "POST",
		url : url,
		data : cpCode,
		dataType: json,
		success : function(data){
			
		}
	}); */


	var vMobile = $(".phoneNum").map(function(){return this.value;}).get().join("-"); //휴대폰번호 val
	$("[name=phoneNum]").val(vMobile);

	// validation check End

	if(confirm("저장하시겠습니까?")) {
		$.ajax({
			type : "POST",
			url : "/applyJoin.do",
			traditional : true,
			dataType : 'json',
			data : $("#form").serialize(),
			success : function(data) {
				if( data.retcode == "SUCC") {
					window.location.href="/joinResult.do"
				} else {
					alert(data.message);
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
		        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
	}
}
</script>