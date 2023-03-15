<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/assets/images/favicon.png">
    <title>Admin Press newjplus</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/assets/plugins/html5-editor/bootstrap-wysihtml5.css" />
    <!-- Custom CSS -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/newStyle.css" rel="stylesheet"/>
    <!-- You can change the theme colors from here -->
    <link href="/resources/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="fix-header card-no-border">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="/sample/login.jsp">
                        <!-- Logo icon --><b>

                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span class="logotxt">
                         <!-- dark Logo text -->
                         <img src="/resources/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                         <!-- Light Logo text -->
                         <img src="/resources/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <li class="nav-item m-l-10"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Comment -->
                        <!-- ============================================================== -->
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li>
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="/resources/assets/images/user.png" alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right scale-up">
                                <ul class="dropdown-user">
                                    <li>
                                        <div class="dw-user-box">
                                            <div class="u-img">Admin</div>
                                         </div>
                                    </li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#"><i class="ti-user"></i> My Profile</a></li>
                                    <li><a href="#"><i class="ti-wallet"></i> My Balance</a></li>
                                    <li><a href="#"><i class="ti-email"></i> Inbox</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#"><i class="ti-settings"></i> Account Setting</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#"><i class="fa fa-power-off"></i> Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- User profile -->
                <div class="user-profile">
                    <!-- User profile image -->
                    <div class="profile-img"> <img src="/resources/assets/images/newjplus_logo.png" alt="homepage" class="leftLogo">
                        <!-- this is blinking heartbit-->

                    </div>
                    <!-- User profile text-->
                    <div class="profile-text">
                        <a href="#" class="dropdown-toggle u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><i class="mdi mdi-settings"></i></a>
                        <a href="app-email.html" class="" data-toggle="tooltip" title="Email"><i class="mdi mdi-gmail"></i></a>
                        <a href="pages-login.html" class="" data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a>
                        <div class="dropdown-menu animated flipInY">
                            <!-- text-->
                            <a href="#" class="dropdown-item"><i class="ti-user"></i> My Profile</a>
                            <!-- text-->
                            <a href="#" class="dropdown-item"><i class="ti-wallet"></i> My Balance</a>
                            <!-- text-->
                            <a href="#" class="dropdown-item"><i class="ti-email"></i> Inbox</a>
                            <!-- text-->
                            <div class="dropdown-divider"></div>
                            <!-- text-->
                            <a href="#" class="dropdown-item"><i class="ti-settings"></i> Account Setting</a>
                            <!-- text-->
                            <div class="dropdown-divider"></div>
                            <!-- text-->
                            <a href="login.html" class="dropdown-item"><i class="fa fa-power-off"></i> Logout</a>
                            <!-- text-->
                        </div>
                    </div>
                </div>
                <!-- End User profile text-->
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        <li class="nav-small-cap">PERSONAL</li>
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-file-chart"></i><span class="hide-menu">대시보드 </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="/sample/dashboard.jsp">대시보드 </a></li>
                            </ul>
                        </li>
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu">관리자 관리</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="/">공통코드</a></li>
                                <li><a href="/">권한 관리</a></li>
                                <li><a href="/">메뉴 관리</a></li>
                                <li><a href="/sample/userList.jsp">계정 관리</a></li>
                            </ul>
                        </li>
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-book-multiple"></i><span class="hide-menu">배너 관리</span></a>
                            <ul aria-expanded="false" class="collapse">
                            	<li><a href="/">배너 관리 </a></li>
                            </ul>
                        </li>
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-book-multiple"></i><span class="hide-menu">팝업 관리</span></a>
                            <ul aria-expanded="false" class="collapse">
                            	<li><a href="/">팝업 관리 </a></li>
                            </ul>
                        </li>
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu">게시판 관리</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="/sample/boardList.jsp">게시판 관리 </a></li>
                            </ul>
                        </li>
                        <li> <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-widgets"></i><span class="hide-menu">컨텐츠 관리</span></a>
                            <ul aria-expanded="false" class="collapse">
                            	 <li><a href="/">컨텐츠 관리 </a></li
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">사용자 등록</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">관리자 관리</li>
                        <li class="breadcrumb-item active">계정 관리</li>
                    </ol>
                </div>
                <div class="">
                    <button class="right-side-toggle waves-effect waves-light btn-inverse btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                </div>
            </div>

            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">사용자 정보 입력</h4>
                                <form class="form p-t-20">
	                                <ul class="user-form">
	                                    <li class="form-group">
	                                        <label for="userId"  class="req">사용자 ID</label>
	                                        <div class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text" id="basic-addon1">
	                                                    <i class="ti-user"></i>
	                                                </span>
	                                            </div>
	                                            <input type="text" class="form-control" id="userId" placeholder="UserId">
	                                        </div>
	                                    </li>
	                                    <li class="form-group">
	                                        <label for="userName" class="req">사용자 이름</label>
	                                        <div class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text" id="basic-addon1">
	                                                    <i class="ti-user"></i>
	                                                </span>
	                                            </div>
	                                            <input type="text" class="form-control" id="userName" placeholder="Username">
	                                        </div>
	                                    </li>
	                                </ul>
	                                <ul class="user-form">
	                                    <li class="form-group">
	                                        <label for="userEmail1">이메일</label>
	                                        <div class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text" id="basic-addon1">
	                                                    <i class="ti-email"></i>
	                                                </span>
	                                            </div>
	                                            <input type="email" class="form-control" id="userEmail1" placeholder="email">
	                                        </div>
	                                    </li>
	                                    <li class="form-group">
	                                    	<label for="userAddress">주소</label>
	                                        <div class="input-group">
	                                                <div class="input-group-prepend">
	                                                    <span class="input-group-text" id="basic-addon1">
			                                                <i class="ti-world"></i>
			                                            </span>
			                                          </div>
	                                              <input type="text" class="form-control" id="userAddress" placeholder="address">
	                                        </div>
	                                    </li>
	                                </ul>
	                                <ul class="user-form">
	                                    <li class="form-group">
	                                        <label for="userpwd1">비밀번호</label>
	                                        <div class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text" id="basic-addon1">
	                                                    <i class="ti-lock"></i>
	                                                </span>
	                                            </div>
	                                            <input type="password" class="form-control" id="userpwd1" placeholder="password">
	                                        </div>
	                                    </li>
	                                     <li class="form-group">
	                                        <label for="userphone">연락처</label>
	                                        <div class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text" id="basic-addon1">
	                                                    <i class="ti-mobile"></i>
	                                                </span>
	                                            </div>
	                                            <input type="text" class="form-control" id="userphone" placeholder="phone">
	                                        </div>
	                                    </li>
	                                </ul>
	                                <ul class="user-form">
	                                	<li class="form-group">
	                                        <label for="userpwd2">비밀번호 확인</label>
	                                        <div class="input-group">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text" id="basic-addon1">
	                                                    <i class="ti-lock"></i>
	                                                </span>
	                                            </div>
	                                            <input type="password" class="form-control" id="userpwd2" placeholder="password">
	                                        </div>
	                                    </li>

	                                    <li class="form-group flx jc-sb">
	                                    	<div class="wd-hlf">
		                                        <label for="authSeq" class="req">권한</label>
		                                        <div class="input-group ">
		                                            <div class="input-group-prepend">
		                                                <span class="input-group-text" id="basic-addon1">
		                                                    <i class="ti-id-badge"></i>
		                                                </span>
		                                            </div>
		                                            <select name="authSeq" data-label="권한" class="form-control custom-select" style="width: auto">
		                                            	<option value="2">슈퍼관리자</option>
		                        						<option value="1" selected="">일반사용자</option>
		                        					</select>
		                                        </div>
		                                     </div>
		                                     <div class="wd-hlf">
		                                         <label for="authSeq" class="req">승인여부</label>
		                                         <div class="input-group ">
		                                            <div class="input-group-prepend">
		                                                <span class="input-group-text" id="basic-addon1">
		                                                    <i class="ti-check-box"></i>
		                                                </span>
		                                            </div>
			                                        <select name="joinStatusCd" data-label="승인여부" class="form-control custom-select" style="width: auto">
			                                        	<option value="02" selected="">승인</option>
			                                        	<option value="03">사용중지</option>
			                                        </select>
		                                    	</div>
		                                    </div>
	                                    </li>
	                                </ul>
                                </form>
                            </div>
                        </div>
                        <div class="btn_group">
	                    	<button type="button" class="btn btn-info waves-effect waves-light m-r-10">등록</button>
	                        <!-- <button type="submit" class="btn btn-info m-r-10"> <i class="fa fa-pencil"></i> 수정</button> -->
	                        <button type="button" class="btn btn-inverse waves-effect waves-light">취소</button>
                        </div>
                    </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="m-t-20">
                                <li><b>With Light sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                                <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                                <li><a href="javascript:void(0)" data-theme="red" class="red-theme">3</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme working">4</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                                <li class="d-block m-t-30"><b>With Dark sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default-dark" class="default-dark-theme">7</a></li>
                                <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a></li>
                                <li><a href="javascript:void(0)" data-theme="red-dark" class="red-dark-theme">9</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme">10</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple-dark" class="purple-dark-theme">11</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme ">12</a></li>
                            </ul>

                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                © 2023 Admin Press Admin by themedesigner.in
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="/resources/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/resources/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="/resources/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="/resources/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/resources/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="/resources/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="/resources/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="/resources/js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="/resources/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>