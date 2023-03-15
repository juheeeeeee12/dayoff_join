<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form id="menuForm" name="menuForm">
	<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
	<input type="hidden" name="nowPostSeq" value="<c:out value='${nowPostSeq}'/>"/>
	<input type="hidden" id="windowTargetHidField" value="<c:out value='${windowTarget}'/>" />
</form>
<aside class="left-sidebar">
    <div class="scroll-sidebar">
        <div class="user-profile">
            <div class="profile-img"> <img src="/resources/assets/images/newjplus_logo.png" alt="homepage" class="leftLogo" style="cursor: pointer;" onclick="window.location.href='/cms/main.do';">
            </div>
            <div class="profile-text">
                <a href="#" class="dropdown-toggle u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><i class="mdi mdi-settings"></i></a>
                <a href="app-email.html" class="" data-toggle="tooltip" title="Email"><i class="mdi mdi-gmail"></i></a>
                <a href="/cms/logout.do" class="" data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a>
                <div class="dropdown-menu animated flipInY">
                    <a href="#" class="dropdown-item"><i class="ti-user"></i> My Profile</a>
                    <a href="#" class="dropdown-item"><i class="ti-wallet"></i> My Balance</a>
                    <a href="#" class="dropdown-item"><i class="ti-email"></i> Inbox</a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item"><i class="ti-settings"></i> Account Setting</a>
                    <div class="dropdown-divider"></div>
                    <a href="/cms/logout.do" class="dropdown-item"><i class="fa fa-power-off"></i> Logout</a>
                </div>
            </div>
        </div>
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-devider"></li>
                <li class="nav-small-cap">PERSONAL</li>
            </ul>
        </nav>
    </div>
</aside>
<div class="page-wrapper">
    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h3 class="text-themecolor nowMenuNm"></h3>
        </div>
        <div class="col-md-7 align-self-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/cms/main.do">Home</a></li>
                <li class="breadcrumb-item pMenuNm"></li>
                <li class="breadcrumb-item active nowMenuNm"></li>
            </ol>
        </div>
    </div>
<script>

	var nowMenuSeq = "";
	var nowPostSeq = "";
	var registAuthYn = false;

	$(function(){
		nowMenuSeq = $("#menuForm [name=nowMenuSeq]").val();
		nowPostSeq = $("#menuForm [name=nowPostSeq]").val();
		fn_getAuthMenuList();
	})

	function fn_clickMenu(t){
		var $p = $(t).parents(".depth1Link");
		$p.toggleClass("active");
		$p.find("ul").slideToggle(100);
	}

	function fn_goMenu(url, seq, postSeq){
		$("#menuForm [name=nowMenuSeq]").val(seq);
		$("#menuForm [name=nowPostSeq]").val(postSeq != null && postSeq != undefined ? postSeq : "");
		sbmit("menuForm", url);
	}

	function fn_getAuthMenuList(){
		$.ajax({
			type : "POST",
			url : "/cms/selectAccountAuthMenuListAjax.do",
			traditional : true,
			dataType : 'json',
			data : {},
			beforeSend: function(){
				$("#loading").show();
			},
			success : function(data) {
				$("#loading").hide();
				if( data.retcode == "SUCC") {
					var menuList = data.accountAuthMenuList;

					// 기능 중 다른 메뉴 링크 태웠을 경우 권한 체크
					if(!isEmpty(nowMenuSeq) && menuList.findIndex(v => v.MENU_SEQ === nowMenuSeq) == -1) {
						alert("접근 권한이 없습니다.");
						if($("#windowTargetHidField").val() == "blank") window.close();
						else location.href='/cms/main.do';
					}

					if(menuList != null) {
						$.each(menuList, function(idx, item){
							if(item.MENU_DEPTH == 1) { // 대메뉴
								var str = '<li data-menu_seq="' + item.MENU_SEQ + '" class="depth1Link"><a class="has-arrow waves-effect waves-dark" aria-expanded="false" href="javascript: void(0);" onclick="' + (item.MENU_GB_CD == "01" ? 'fn_goMenu(\'' + item.MENU_URL + '\', \'' + item.MENU_SEQ + '\')' : 'fn_clickMenu(this)') + '">';
								if(!isEmpty(item.MENU_ICON)) str += '<i class="' + item.MENU_ICON + '"></i> ';
								str += '<span class="hide-menu">' + item.MENU_NM + '</span></a>';
								if(item.DEPTH2_CHILD > 0) str += '<ul id="pMenu_' + item.MENU_SEQ + '" aria-expanded="false" class="collapse">'; //하위메뉴있으면 하위 ul 만들어주기
								str += '</li>';
								$("#sidebarnav").append(str);
							} else { // 소메뉴
								if(item.MENU_NM === "게시글 관리") {
									let boardList = data.postMenuList;
									let boardUrl = item.MENU_URL;
									let boardSeq = item.MENU_SEQ;
									let parentSeq = item.P_MENU_SEQ;
									$.each(boardList, function(idx, item){
										var str  = '<li><a href="javascript: ' + ( isEmpty(boardUrl) ? "void(0);" : "fn_goMenu(\'" + boardUrl + "\', \'" + boardSeq + "\', \'" + item.MENU_SEQ + "\')" ) + '" data-menu_seq="' + boardSeq + '" data-post_seq="' + item.MENU_SEQ + '" class="depth2Link"><span>' + item.MENU_NM + '</span></a></li>';
										$("#pMenu_" + parentSeq).append(str);
									});
								}
								else {
									var str = '<li><a href="javascript: ' + ( isEmpty(item.MENU_URL) ? "void(0);" : "fn_goMenu(\'" + item.MENU_URL + "\', \'" + item.MENU_SEQ + "\')" ) + '" data-menu_seq="' + item.MENU_SEQ + '" class="depth2Link"><span>' + item.MENU_NM + '</span></a></li>';
									$("#pMenu_" + item.P_MENU_SEQ).append(str);
								}
							}
						});
					}

					$('#sidebarnav').metisMenu();

					if(isEmpty(nowMenuSeq)) return;
					var $menuTag = $("[data-menu_seq=" + nowMenuSeq + "]");
					if (nowPostSeq != null && nowPostSeq != "") {
						$menuTag = $("[data-post_seq=" + nowPostSeq + "]");
						nowPostSeq = $("#menuForm [name=nowPostSeq]").val();
					}
					$menuTag.addClass("active");
					if($menuTag.hasClass("depth2Link")) { // 2depth 메뉴인 경우
						$menuTag.parents("ul").addClass("in");
						$menuTag.parents(".depth1Link").addClass("active");
						$(".pMenuNm").text($menuTag.parents(".depth1Link").find(".has-arrow span").text());
					} else { // 1depth 메뉴인 경우
						$(".pMenuNm").hide();
					}
					$(".nowMenuNm").text($menuTag.find("span").text());

					// 등록 수정 삭제 권한 체크
					var accountRegistAuthList = data.accountRegistAuthList;
					if(!isEmpty(accountRegistAuthList)) {
						accountRegistAuthList = accountRegistAuthList.split(",");
						if(accountRegistAuthList.indexOf(nowMenuSeq) > -1) registAuthYn = true;
					}
					fn_hideRegistArea();
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
				$("#loading").hide();
				if(isEmpty($("#sessionId").val())) {
					alert('로그인 후 이용해주세요.');
					location.href='/admin/login.do';
				} else {
		        	alert("문제가 발생하였습니다.\n고객센터에 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
				}
		    }
		});
	}

</script>

