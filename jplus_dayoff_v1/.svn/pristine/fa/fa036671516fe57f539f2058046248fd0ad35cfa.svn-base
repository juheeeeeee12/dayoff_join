<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
    <!-- <link href="/resources/assets/font/Pretendard/pretendard.css" rel="stylesheet"/> -->
    <link href="/resources/css/colors/blue.css" id="theme" rel="stylesheet">


    <!-- All Jquery -->
    <script src="/resources/assets/plugins/jquery/jquery.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.slimscroll.js"></script>
    <script src="/resources/js/waves.js"></script>
    <script src="/resources/js/sidebarmenu.js"></script>
    <script src="/resources/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="/resources/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/assets/plugins/tinymce/tinymce.min.js"></script>
    <script src="/resources/assets/plugins/footable/js/footable.all.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="/resources/js/footable-init.js"></script>
    <script src="/resources/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
    <script src="/resources/assets/plugins/dropify/dist/js/dropify.min.js"></script>
    <script src="/resources/assets/plugins/dropzone-master/dist/dropzone.js"></script>
    <script src="/resources/js/common.js"></script>
     
</head>

</head>
<!--접속자 통계 -->
<div class="page-wrapper">

<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-themecolor">통계</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
            <li class="breadcrumb-item active">접속자 통계</li>
        </ol>
    </div>
    <div>
        <button class="right-side-toggle waves-effect waves-light btn-inverse btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
    </div>
</div>

<div class="container-fluid">

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="d-flex flex-wrap">
                    <div>
                        <h4 class="card-title">접속자 통계</h4>
                    </div>
                    <div class="ml-auto align-self-center">
                        <ul class="list-inline m-b-0">
                            <li>
                                <h6 class="text-muted text-success"><i class="fa fa-circle font-10 m-r-10 "></i>접속자 수</h6> </li>
                            <li>
                                <h6 class="text-muted text-info"><i class="fa fa-circle font-10 m-r-10"></i>가입자 수</h6> </li>
                        </ul>
                    </div>
                </div>
                <div class="campaign ct-charts" style="height:305px!important;"></div>
            </div>
        </div>
        <div class="card border">
                            <div class="card-body">
                                <div class="user_search">
                                	<!-- <div class="radio_group flx  m-b-5">
				                		<p class="radio-tit">사용여부</p>
										<input type="radio" id="useAll" name="schUseYn" class="custom" value="" onchange="fn_search();">
										<label for="useAll"> 전체</label>         
										<input type="radio" id="useY" name="schUseYn" class="custom" value="Y" checked="checked" onchange="fn_search();">
										<label for="useY"> 사용</label>         
										<input type="radio" id="useN" name="schUseYn" class="custom" value="N" onchange="fn_search();">
										<label for="useN"> 미사용</label>
									</div> -->                                
	                                <div class="ipt_group  m-b-10">
					                	<select class="form-control custom-select" id="schGb" name="schGb" style="width: 20%;">
					                		<option value="" selected disabled hidden>- 검색구분 -</option>
					                		<option value="">1</option>
					                		<option value="">2</option>
					                	</select>
					                    <input type="text" name="schVal" class="form-control custom-select" style="width: calc(100% - 22%);" placeholder="검색어를 입력하세요" value="" onkeypress="if( event.keyCode == 13 ){fn_search();}">
					                </div>
					                <div class="btn_group">
						                <span class=" "><button type="button" class="btn waves-effect waves-light btn-info m-r-10" onclick="fn_search();">검색</button></span>
					                	<span class=" "><button type="button" class="btn waves-effect waves-light btn-secondary" onclick="fn_reset();">초기화</button></span>
				                	</div>
				                	
				                	 <div class="ipt_group">
					                	<select class="form-control custom-select" id="schGb" name="schGb" style="width: 20%;">
					                		<option value="" selected disabled hidden>- 조회구분 -</option>
					                		<option value="">일별 조회</option>
					                		<option value="">월별 조회</option>
					                		<option value="">연도별 조회</option>
					                	</select>
					                	<input type="date" class="form-control" style="width: calc(100% - 22%);" placeholder="dd/mm/yyyy">
					                </div>				                	
			                	</div>			                                                
                            </div>                        	
                        </div>
        
        <div class="card">
						<div class="card-body">                             
                                <div class="table-responsive">
                                	<div class="flx board-list-top m-b-20 jc-sb ai-cnt">
	                                	<div class="list-num">검색<span id="schCount">4</span>/ 전체<span id="totalCount">4</span></div>
	                                	<div class="flx list-option">
						                	<button type="button" class="flx btn waves-effect waves-light m-r-10 btn-green" onclick="sbmit('form', '/admin/accountListExcelDownload.do');"> <i class="fa fa-file-excel-o m-r-10"></i>엑셀 다운로드</button>
						                	<select class="form-control custom-select m-r-10" name="showListCnt" onchange="fn_search();" style=" width: auto;">
												<option value="20" selected="">20개씩 보기</option>
												<option value="50">50개씩 보기</option>
												<option value="100">100개씩 보기</option>
											</select> 
											<select class="form-control custom-select" name="filterOrder" onchange="fn_search();" style="width: auto;">
												<option value="createDesc" selected="">등록일 내림차순</option>
												<option value="createAsc">등록일 오름차순</option>
												<option value="updateDesc">수정일 내림차순</option>
												<option value="updateAsc">수정일 오름차순</option>
												<option value="lastLoginDesc">최종 로그인 내림차순</option>
												<option value="lastLoginAsc">최종 로그인 오름차순</option>
											</select> 
						                </div>
						            </div>
                                    <table id="demo-foo-addrow" class="table table-hover contact-list footable-loaded footable user-table" data-page-size="7">
                                    <colgroup>
					                    <col width="5%">
					                    <col width="18%"> 
					                    <col width="15%"> 
					                    <col width="17%"> 
					                    <col width="15%">
					                    <col width="15%">
					                    <col width="15%">  
					                </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="footable-sortable">No<span class="footable-sort-indicator"></span></th>
                                                <th class="footable-sortable">접속자 ID<span class="footable-sort-indicator"></span></th>
                                                <th class="footable-sortable">접속자 성명<span class="footable-sort-indicator"></span></th>
                                                <th class="footable-sortable">연락처<span class="footable-sort-indicator"></span></th>
                                                <th class="footable-sortable">접속일자<span class="footable-sort-indicator"></span></th>
                                                <th class="footable-sortable">가입일자<span class="footable-sort-indicator"></span></th>
                                                <th class="footable-sortable">접속IP<span class="footable-sort-indicator"></span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<!-- <tr>
                                        		<td class="no-data" colspan="10" style="">등록된 데이터가 없습니다.</td>
                                        	</tr> -->
                                            <tr>
                                                <td class="center"><span class="footable-toggle"></span>1</td>
                                                <td class="center">Eichmann</td>
                                                <td class="center">Eichmann</td>
                                                <td class="center">010-1111-1111</td>
                                                <td class="center">2023.01.30</td>
                                                <td class="center">2023.01.30</td>
                                                <td class="center">127.0.0.1</td>
                                            </tr>
                                            <tr>
                                                <td class="center"><span class="footable-toggle"></span>2</td>
                                                <td class="center">Deshmukh</td>
                                                <td class="center">Prohaska</td>
                                                <td class="center">010-2222-2222</td>
                                                <td class="center">2023.01.29</td>
                                                <td class="center">2023.01.29</td>
                                                <td class="center">127.0.0.1</td>
                                            </tr>
                                            <tr>
                                                <td class="center"><span class="footable-toggle"></span>3</td>
                                                <td class="center">Roshan</td>
                                                <td class="center">Rogahn</td>
                                                <td class="center">010-3333-3333</td>
                                                <td class="center">2023.01.28</td>
                                                <td class="center">2023.01.28</td>
                                                <td class="center">127.0.0.1</td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="7" class="footable-visible">
                                                    <div class="text-right">
                                                        <ul class="pagination"> <li class="footable-page-arrow disabled"><a data-page="first" href="#first">«</a></li><li class="footable-page-arrow disabled"><a data-page="prev" href="#prev">‹</a></li><li class="footable-page active"><a data-page="0" href="#">1</a></li><li class="footable-page"><a data-page="1" href="#">2</a></li><li class="footable-page-arrow"><a data-page="next" href="#next">›</a></li><li class="footable-page-arrow"><a data-page="last" href="#last">»</a></li></ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>               
                            </div>                        	
                        </div>
				    </div>    
				</div>
<!--접속자 통계 -->



                    </div>
                </div>
            <footer class="footer">
                © 2019 Admin Press Admin by themedesigner.in
            </footer>

        </div>
    </div>

   <script src="/resources/assets/plugins/jquery/jquery.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.slimscroll.js"></script>
    <script src="/resources/js/waves.js"></script>
    <script src="/resources/js/sidebarmenu.js"></script>
     <script src="/resources/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="/resources/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="/resources/js/custom.min.js"></script>
    <script src="/resources/assets/plugins/tinymce/tinymce.min.js"></script>
    
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
    <script src="/resources/assets/plugins/raphael/raphael-min.js"></script>
	<script src="/resources/assets/plugins/morrisjs/morris.min.js"></script>
	<script src="/resources/assets/plugins/chartist-js/dist/chartist.min.js"></script>
	<script src="/resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="/resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
	<script src="/resources/assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="/resources/js/dashboard2.js"></script>
	<script src="/resources/assets/plugins/raphael/raphael-min.js"></script>
	<script src="/resources/assets/plugins/morrisjs/morris.min.js"></script>

</body>

</html>