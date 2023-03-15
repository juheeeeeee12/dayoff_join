<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/assets/images/favicon.png">
    <title>Admin Press newjplus</title>
    <link href="/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/assets/plugins/footable/css/footable.core.css" rel="stylesheet">
    <link href="/resources/assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
    <link href="/resources/assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="/resources/assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
    <link href="/resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <link href="/resources/assets/plugins/morrisjs/morris.css" rel="stylesheet">
    <link href="/resources/assets/plugins/dropify/dist/css/dropify.min.css" rel="stylesheet">
    <link href="/resources/assets/plugins/dropzone-master/dist/dropzone.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/newStyle.css" rel="stylesheet"/>
    <link href="/resources/css/colors/blue.css" id="theme" rel="stylesheet">
</head>

<body>
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>

    <!-- 회원가입 : start -->
    <section id="wrapper" class="login-register login-sidebar" style="background:#ddd;">
        <div class="login-box card">
            <div class="card-body">
                <form class="form-horizontal form-material" id="loginform" action="index.html">
                    <a href="javascript:void(0)" class="text-center db logo" ><img src="/resources/assets/images/newjplus_logo.png" alt="Home" /><br/><img src="/resources/assets/images/logo-text.png" alt="Home" /></a>
                    <h3 class="box-title m-t-40 m-b-0">회원가입</h3><small></small>
                    <div class="form-group m-t-20">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="UserName">
                        </div>
                    </div>
                    <div class="form-group m-t-20">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="UserId">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" required="" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" required="" placeholder="Confirm Password">
                        </div>
                    </div>
                   <!--  <div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-primary p-t-0">
                                <input id="checkbox-signup" type="checkbox">
                                <label for="checkbox-signup"> I agree to all <a href="#">Terms</a></label>
                            </div>
                        </div>
                    </div> -->
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="button">회원가입</button>
                        </div>
                    </div>
                    <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center">
                            <p>계정이 있으신가요? <a href="/cms/login.do" class="text-info m-l-5"><b>로그인</b></a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- 회원가입 : end -->


    <script src="/resources/assets/plugins/jquery/jquery.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.slimscroll.js"></script>
    <script src="/resources/js/waves.js"></script>
    <script src="/resources/js/sidebarmenu.js"></script>
    <script src="/resources/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="/resources/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/custom.min.js"></script>
    <script src="/resources/assets/plugins/footable/js/footable.all.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="/resources/js/footable-init.js"></script>
    <script src="/resources/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
    <script src="/resources/assets/plugins/dropify/dist/js/dropify.min.js"></script>
    <script src="/resources/assets/plugins/dropzone-master/dist/dropzone.js"></script>
</body>
</html>