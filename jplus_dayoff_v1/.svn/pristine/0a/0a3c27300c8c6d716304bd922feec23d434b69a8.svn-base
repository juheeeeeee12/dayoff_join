<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="./layout/top.jsp"%>

<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
	<meta name="title" content="로그인 | AdminPress">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>Log In | AdminPress</title>
	<link rel="stylesheet" href="/resources/admin/css/login.css">
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script src="/resources/js/common.js"></script>
 </head>
<body>

    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>

    <section id="wrapper" class="login-register login-sidebar">
        <div class="login-box card">
            <div class="card-body">
                <form class="form-horizontal form-material" id="form" name="loginFrm" method="post" onsubmit="return false;">
                    <a href="javascript:void(0)" class="text-center db logo" ><img src="/resources/assets/images/newjplus_logo.png" alt="Home" /><br/></a>
                    <div class="form-group m-t-40">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" id="adminId" name="adminId" required="" placeholder="UserId" onKeyDown="if(event.keyCode==13) {chkForm(document.loginFrm);}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" name="adminPwd" required="" placeholder="Password" onKeyDown="if(event.keyCode==13) {chkForm(document.loginFrm);}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div>
                            <div class="checkbox checkbox-primary pull-left p-t-0">
                                <input id="saveAdminid" type="checkbox"/>
                                <label for="saveAdminid"> 아이디 저장 </label>
			                    <input type="hidden" name="saveAdminid"/>
                            </div>
<!--                             <a href="javascript:void(0)" id="to-recover" class="text-dark pull-right"><i class="fa fa-lock m-r-5"></i> Forgot pwd?</a>  -->
						</div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="button" onclick="chkForm(document.loginFrm);">로그인</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </section>

</body>
</html>

<script type="text/javascript">

$(function(){
	fnInit();
})
function chkForm(f){
	$.ajax({
		  type 		: "POST"
		, url 		: "/cms/adminLogin.do"
		, data 		: $("#form").serialize()
		, dataType 	: "json"
		, success 	: function(data){
			if(!data.success) alert(data.message);
			else {
				saveid();
				location.href = '/cms/main.do';
			}
		}, error : function(jqXHR, textStatus, errorThrown){
	        alert("문제가 발생하였습니다.\n관리자에게 문의하세요.");
	    }
	});
}

function saveid() {
    var expdate = new Date();
    if ($("#saveAdminid").is(":checked")){
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
        setCookie("saveAdminid", $("#adminId").val(), expdate);
    }else{
        expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
        setCookie("saveAdminid", $("#adminId").val(), expdate);
    }
}

function fnInit(){
    var cookieid = getCookie("saveAdminid");
    if(cookieid !=""){
        $("input:checkbox[id='saveAdminid']").prop("checked", true);
        $('#adminId').val(cookieid);
    }
}

</script>