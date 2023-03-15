<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./layout/frontTop.jsp"  %>
<div class="container-fluid">
	<div class="row" style=" justify-content: center;">
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<form class="form-horizontal form-material" id="loginform" name="loginform">
						<div class="center">
	                    	<a href="/main.do" class="text-center dl logo" ><img src="/resources/assets/images/newjplus_logo.png" alt="Home" style="width:250px;" /></a>
	                    </div>
	                    <div class="form-group m-t-40">
	                        <div class="col-xs-12">
	                            <input class="form-control" type="text" id="loginId" name="loginId" required="" placeholder="아이디" onKeyDown="if(event.keyCode==13) {chkForm(document.loginFrm);}"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <div class="col-xs-12">
	                            <input class="form-control" type="password" name="loginPwd"" required="" placeholder="비밀번호" onKeyDown="if(event.keyCode==13) {chkForm(document.loginFrm);}"/>
	                        </div>
	                    </div>
	                    <div class="form-group">
							<div class="checkbox checkbox-primary pull-left p-t-0">
	                        	<input id="saveId" type="checkbox"/>
	                            <label for="saveId">아이디 기억하기 </label>
	                            <input type="hidden" name="saveId"/>
							</div>
	                    </div>
	                    <div class="form-group m-b-0 d-flex">
                            <p class="left"><a href="/main.do" class="link m-l-5"><b>메인으로</b></a></p>
                            <p class="right">계정이 없으신가요? <a href="/join.do" class="link m-l-5"><b>회원가입</b></a></p>
	                    </div>
	                </form>
				</div>
			</div>
			<div class="btn_group">
				<button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="button" onclick="chkForm(document.loginFrm);">로그인</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>

<style>
.container-fluid { height: 100vh; display: flex; align-items: center; }
.row { flex: 1; }
</style>

<script type="text/javascript">

$(function(){
	fnInit();
})
function chkForm(f){
	$.ajax({
		  type 		: "POST"
		, url 		: "/loginCheck.do"
		, data 		: $("#loginform").serialize()
		, dataType 	: "json"
		, success 	: function(data){
			if(data.success) {
				saveid();
				location.href = '/main.do';
			} else {
				alert(data.message);
			}
		}, error : function(jqXHR, textStatus, errorThrown){
	        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.");
	    }
	});
}

function saveid() {
    var expdate = new Date();
    if ($("#saveId").is(":checked")){
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
        setCookie("saveId", $("#loginId").val(), expdate);
    }else{
        expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
        setCookie("saveId", $("#loginId").val(), expdate);
    }
}

function fnInit(){
    var cookieid = getCookie("saveId");
    if(cookieid !=""){
        $("input:checkbox[id='saveId']").prop("checked", true);
        $('#loginId').val(cookieid);
    }
}

</script>
