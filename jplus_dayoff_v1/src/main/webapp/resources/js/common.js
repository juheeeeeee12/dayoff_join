var	_f = [
    function(string) { //을/를 구분
  return _hasJong(string) ? '을' : '를';
},
function(string){ //은/는 구분
  return _hasJong(string) ? '은' : '는';
},
function(string){ //이/가 구분
  return _hasJong(string) ? '이' : '가';
},
function(string){ //와/과 구분
  return _hasJong(string) ? '과' : '와';
    }
  ],
    _formats = {
      '을/를' : _f[0],
  '을' : _f[0],
  '를' : _f[0],
  '을를' : _f[0],
  '은/는' : _f[1],
  '은' : _f[1],
  '는' : _f[1],
  '은는' : _f[1],
  '이/가' : _f[2],
  '이' : _f[2],
  '가' : _f[2],
  '이가' : _f[2],
  '와/과' : _f[3],
  '와' : _f[3],
  '과' : _f[3],
  '와과' : _f[3]
    };

  function _hasJong(string){ //string의 마지막 글자가 받침을 가지는지 확인
    string = string.charCodeAt(string.length - 1);
    return (string - 0xac00) % 28 > 0;
  }

  var josa = {
    c: function(word, format){
      if (typeof _formats[format] === 'undefined') throw 'Invalid format!';
      return _formats[format](word);
    },
    r: function(word, format) {
      return word + josa.c(word, format);
    }
  };

  if (typeof define == 'function' && define.amd) {
    define(function(){
      return josa;
    });
  } else if (typeof module !== 'undefined') {
    module.exports = josa;
  } else {
    window.Josa = josa;
  }

function valiChk(id, name){
	if(!$("#" + id).val()) {
		alert(Josa.r(name,'은/는') + " 필수 입력사항 입니다.");
		$("#" + id).focus();
		return false;
	}
	return true;
}

function valiChkByClass(className, name){
	if(!$("." + className).val()) {
		alert(Josa.r(name,'은/는') + " 필수 입력사항 입니다.");
		$("." + className).focus();
		return false;
	}
	return true;
}

// null > true return / not null > false return
var isEmpty = function(value){
	if( value == null || value == undefined || $.trim(value).length < 1 || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		return true ;
	}else{
		return false;
	}
};
function isEmptyChg(str, chgStr){
    if(isEmpty(str)) return chgStr
    else return str;
}

function fn_getFmtDate(paramDate, getType){
	var date = paramDate;
	var NowTime = date.getFullYear();

	NowTime += "-" + ((new String(date.getMonth()+1).length == 1) ? "0" + new String(date.getMonth()+1) : new String(date.getMonth()+1));
	if(getType == "month") return NowTime;
	NowTime += "-" + ((new String(date.getDate()).length == 1) ? "0" + new String(date.getDate()) : new String(date.getDate()));
    if(getType == "time"){
    	NowTime += ((new String(date.getHours()).length == 1) ? "0" + new String(date.getHours()) : new String(date.getHours()));
    	NowTime += ((new String(date.getMinutes()).length == 1) ? "0" + new String(date.getMinutes()) : new String(date.getMinutes()));
    	NowTime += ((new String(date.getSeconds()).length == 1) ? "0" + new String(date.getSeconds()) : new String(date.getSeconds()));
    }
	return NowTime;
}

function sbmit(formId, url) {
	$("#" + formId).attr({
		onsubmit : "return true",
		method : "post",
		action : url
	}).submit();
}

function getPopupPage(pageInfo){
	var str = "";
	var tmp = 0, startIdx = 1, loopIdx = 0;
	var totalPage = pageInfo.totalPageCount
	    , pageSize = pageInfo.pageSize
	    , nowPage = pageInfo.currentPageNo;

	if(totalPage > pageSize){
		tmp = (Math.floor((nowPage - pageSize) / pageSize) * pageSize) + 1;
		if( (nowPage-pageSize)%pageSize == 0 ) tmp = (nowPage-pageSize) - 9;
		else if(nowPage - pageSize < 0 || tmp < 0) tmp = 1;
		str += '<a href="javascript:listThread(1);" class="first">first</a>'
			+ '<a href="javascript:listThread(' + tmp + ');" class="prev">prev</a>'
	}

	if(totalPage <= pageSize) loopIdx = totalPage;
	else{
		if(nowPage <= pageSize) loopIdx = pageSize;
		else{
			tmp = (Math.floor(nowPage / pageSize) * pageSize);
			startIdx = tmp + 1;

			if(tmp + pageSize > totalPage) loopIdx = totalPage;
			else loopIdx = tmp + pageSize;

			if(tmp == nowPage){
				loopIdx = tmp;
				startIdx -= pageSize;
			}
		}
	}

	for(var i = startIdx; i <= loopIdx; i++){
		if(i == nowPage){
			//str += '<a href="javascript: void(0);" class="now_page">' + i + '</a>';
			str += '<span>' + i + '</span>';
			continue;
		}
		str += '<a href="javascript: listThread(' + i + ');">' + i + '</a>';
	}

	if(totalPage > pageSize){
		if( (nowPage+pageSize)%pageSize == 0 ) tmp = nowPage + 1;
		else if(nowPage + pageSize > totalPage || (Math.floor((nowPage + pageSize) / pageSize) * pageSize) + 1 > totalPage)
			tmp = totalPage;
		else tmp = (Math.floor((nowPage + pageSize) / pageSize) * pageSize) + 1;

		str += '<a href="javascript: listThread(' + tmp + ');" class="next">next</a>'
			+ '<a href="javascript: listThread(' + totalPage + ');" class="last">last</a>'
	}
	return str;
}

var isEmpty = function(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		return true ;
	}else{
		return false;
	}
};


function onlyNumber(){
	if(event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;
}

function comma(num){
  num = num + "";
  num = num.replace(/[^\d]+/g, '');
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function fn_comma(e){
	var val = $(e).val();
	$(e).val(comma(val));
}

function removeUpload() {
  $(".file-upload-input").replaceWith($(".file-upload-input").clone());
  $(".file-upload-content").hide();
  $(".image-upload-wrap").show();
}

/* Utility 함수들 */
function ajaxJsonError(jqXHR, textStatus, errorThrown) {
    var err_msg = '(';
    if (jqXHR.status === 0) {
        err_msg += '네트워크가 오프라인입니다.\n네트워크를확인하시기 바랍니다.';
    } else if (jqXHR.status == 404) {
        err_msg += '요청 된 페이지를 찾을 수 없습니다. [404]';
    } else if (jqXHR.status == 500) {
        err_msg += '내부 서버 오류. [500]';
    } else if (textStatus === 'parsererror') {
        err_msg += '요청 된 JSON 구문 분석에 실패했습니다.';
    } else if (textStatus === 'timeout') {
        err_msg += '시간 초과 오류가 발생했습니다.';
    } else if (textStatus === 'abort') {
        err_msg += 'Ajax 요청이 중단되었습니다.';
    } else {
        err_msg += 'Uncaught Error.\n' + jqXHR.responseText;
    }
	err_msg += ')';
    return err_msg;
}

function fn_chkValidation(){
	var chkFlag = true;
	$(".reqIpt").each(function(){
		if(isEmpty($(this).val()) && $(this).is(":visible")) {
			if($(this).hasClass("dropify") && !isEmpty($(this).attr("value"))) return false;
			alert(Josa.r($(this).data("label"), "은/는") + " 필수 입력 사항 입니다.");
			$(this).focus();
			chkFlag = false;
			return false;
		}
	})
	return chkFlag;
}

function isDuplicate(arr)  {
	if(arr.length < 1) return false;
	const isDup = arr.some(function(x) {
	  return arr.indexOf(x) !== arr.lastIndexOf(x);
	});

	return isDup;
}

$(document).on("input",".onlyNumber",function(){
	$(this).val($(this).val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
})


// COMMA
function comma(num){
  num = num + "";
  num = num.replace(/[^\d]+/g, '');
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function readFileURL(input){
    var isIE = (navigator.appName=="Microsoft Internet Explorer");
    var isie8= (/msie 8/i).test(navigator.userAgent);
    var isie9 = (/msie 9/i).test(navigator.userAgent);
    var path = input.value;
    var ext = path.substring(path.lastIndexOf('.') + 1).toLowerCase();
    var inputField = $(input).closest('.fileinputs').find('.input > input');
    var ImgField = $(input).closest('.uploadImgFile').find('.thumb');

    if(path == ""){
      $(input).val('');
      inputField.val('');
      ImgField.html('');
      return;
    }

    if($(input).closest('.fileinputs').is('.excel')){
      inputField.val(input.files[0].name);
      return;
    }

    if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
      alert('gif, png, jpg, jpeg 파일만 가능합니다.');
      $(input).val('');
      inputField.val('');
      ImgField.html('');
      return;
    }

    var img = "",
        btnDel = '<button class="i-set close1" onclick="readFileDel(this);">삭제</button>'
    if($(input).closest('.uploadImgFlie').hasClass('noneDel')) btnDel = '';

    inputField.val(input.files[0].name);

    if(isie8 || isie9) {
      alert("ie9이하 버전은 미리보기 기능을 지원하지 않습니다.");
      img = btnDel;
      ImgField.html(img);
      //$(input).closest('.fakefile').find('.file').css('display', 'block');
    }else{
         if(input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                img = '<div class="img"><img src="'+e.target.result+'"/></div>'+btnDel;
                ImgField.html(img);
            }
            reader.readAsDataURL(input.files[0]);
         }
    }
}

var randomNum = {
    random : function(n1, n2) {
        return parseInt(Math.random() * (n2 -n1 +1)) + n1;
    },
    autoNo : function(n) {
        var value = "";
        for(var i=0; i<n; i++){
            value += randomNum.random(0,9);
        }
        return value;
    }
};

function fn_random(){
	const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'
	const stringLength = 8;
	let randomstring = ''
	for (let i = 0; i < stringLength; i++) {
		const rnum = Math.floor(Math.random() * chars.length)
	    randomstring += chars.substring(rnum, rnum + 1)
	}
	return randomstring;
}

var addRemoveItem = {
    add: function(t) {
        var itemList = $(t).closest('.addRemoveItem_ctrl').prev('.addRemoveItem_list'),
            min = parseInt($(t).closest('.addRemoveItem_ctrl').data('min')),
            max = parseInt($(t).closest('.addRemoveItem_ctrl').data('max'));

//        for(i = 0; i < min; i++) {
            var item = itemList.find('.item').eq(0).clone();
            item.find('input').not("input[type=radio]").val('');
            item.find('input').attr('fileSeq', '');
            item.find('textarea').val('');
            item.find('.ajax_image_file').removeClass('inFiles');
            item.find('.ajax_image_file').html('');
            item.find('.hidden_img').val('');
            item.find('input[type="file"]').val('');
            item.find('.up_hidden_img').val('');
            item.find('.fileList').html('');
            itemList.append(item);
//        }

        if(itemList.find('.item').length >= max){
            $(t).closest('.addRemoveItem_ctrl').find('button.add').attr("disabled", true);
        }
        if(itemList.find('.item').length > min){
            $(t).closest('.addRemoveItem_ctrl').find('button.remove').attr("disabled", false);
        }
    },
    remove: function(t) {
        var itemList = $(t).closest('.addRemoveItem_ctrl').prev('.addRemoveItem_list'),
            min = parseInt($(t).closest('.addRemoveItem_ctrl').data('min')),
            max = parseInt($(t).closest('.addRemoveItem_ctrl').data('max'));

        var removeStart = itemList.find('.item').length - 1;
        itemList.find('.item').each(function(i) {
            if(removeStart != 0 && i > removeStart-1) {
            	fn_removeUploadImg($(this).find("button.btn_delete"));
            	$(this).remove();
            }
        	if(removeStart == 0) {
        		$(this).find('input').val('');
        	}
        });

        if(itemList.find('.item').length < max){
            $(t).closest('.addRemoveItem_ctrl').find('button.add').attr("disabled", false);
        }

        if(itemList.find('.item').length <= min){
            $(t).closest('.addRemoveItem_ctrl').find('button.remove').attr("disabled", true);
        }
    }
}


function fn_reset(){
	$(".resetVal").val('');
	listThread(1);
}

//파일첨부 공통 함수 START

function fn_attachFile(t){
	$(t).siblings(".chooseFile").trigger("click");
}

function fn_fileValChg(t) {

	if (t.files && t.files[0]) {
		var fileVal = $(t).val();

		// 파일 확장자 체크
		if(!isEmpty($(t).data("extns")) && !isEmpty(fileVal)) {
			var ext = fileVal.split('.').pop().toLowerCase(); //확장자분리
	        //아래 확장자가 있는지 체크
	        if($.inArray(ext, $(t).data("extns").split(",")) == -1) {
	          alert($(t).data("extns") + "파일만 업로드 할수 있습니다.");
	          $(t).val("");
	          return;
	        }
		}

		// 파일 용량 체크
		var maxSize = 10 * 1024 * 1024; // 10MB
		if(!isEmpty($(t).data("max-size"))) maxSize = $(t).data("max-size") * 1024 * 1024;
	    var fileSize = t.files[0].size;
	    if(fileSize > maxSize){
		    alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
		    $(t).val("");
		    return;
	    }

		var fileName = "";
	 	if(!isEmpty(fileVal)) fileName = fileVal.substring((fileVal).lastIndexOf("\\")+1);
	 	$(t).siblings(".btns").hide();
		$(t).siblings(".fileName").val(fileName);

		if($("#isModify").val() != "Y") return;

		if(!isEmpty($(t).closest(".chooseFile").attr("fileSeq"))) {
			deleteFileArr.push($(t).closest(".chooseFile").attr("fileSeq"));
		}
	}
}

//파일 삭제
function fn_fileDelete(t) {
	if($("#isModify").val() == "Y") {
		var fileSeq = $(t).closest(".file_group").find(".chooseFile").attr("fileSeq");
		if(!isEmpty(fileSeq)) deleteFileArr.push(fileSeq);
	}
	$(t).closest(".file_group").find(".chooseFile").val("");
	$(t).closest(".file_group").find(".fileName").val("");
	$(t).closest(".btns").hide();
}

//수정페이지 첨부파일 다운로드
function fn_fileDownload(t) {
	var fileSeq = $(t).closest(".file_group").find(".chooseFile").attr("fileSeq");
	if(!isEmpty(fileSeq)) window.location.href= "/file/fileDownload.do?fileSeq=" + fileSeq + "&realFilePath=" + $("#realFilePath").val();
}

function fn_attachImgFile(t) {
	$(t).closest(".uploadImgFile").find('.file-upload-input').trigger('click');
}

function readImgFileName(ipt){
	if (ipt.files && ipt.files[0]) {
		var reader = new FileReader();
		var $p = $(ipt).closest(".uploadImgFile");
		reader.onload = function(e) {
			$p.find('.ajax_image_file').addClass("img");
			if(ipt.files[0].type.includes('video')){
				var v = document.createElement('video');
				var url = URL.createObjectURL(ipt.files[0]);
				$(v).attr('src', url)
				$(v).attr('height', '240px')
				$(v).attr('controls', 'controls')
				$p.find(".ajax_image_file").append(v);
			}else{
				$p.find('.ajax_image_file').html('<img src="' + e.target.result + '">');
			}
			$p.find('.btn_delete').show();
			$p.find('.btn_delete').attr('onclick', 'fn_removeUploadImg(this)');
		};

		if($("#isModify").val() == "Y") {
			var fileSeq = $(ipt).attr("fileSeq");
			if(!isEmpty(fileSeq) && deleteFileArr != null) deleteFileArr.push(fileSeq);
		}

		reader.readAsDataURL(ipt.files[0]);
	}
}

function readImgURL(input) {
	var $this = $(input);
	var $parent = $this.closest(".item");
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		var fileSize = input.files[0].size;
		var maxSize = 10 * 1024 * 1024;
		if(fileSize > maxSize){
			alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
			$this.val('');
			return false;
		}

		reader.onload = function(e) {
			$parent.find(".image-upload-wrap").hide();
			$parent.find('.ajax_image_file').addClass("img");
			$parent.find('.ajax_image_file').html('<img src="' + e.target.result + '">');
		};

		if($("#isModify").val() == "Y") {
			var fileSeq = $this.attr("fileSeq");
			if(!isEmpty(fileSeq) && deleteFileArr != null) deleteFileArr.push(fileSeq);
		}

		reader.readAsDataURL(input.files[0]);
		$parent.find(".btn_delete").show();
	}
}

function fn_removeUploadImg(t) {
	$parent = $(t).closest('.uploadImgFile');
    $parent.find('.ajax_image_file').html('');
    $parent.find('.ajax_image_file').removeClass("img");

    var $fileIpt = $parent.find('input:file');
    var fileSeq = $fileIpt.attr('fileSeq');
    if(!isEmpty(fileSeq) && deleteFileArr != null) deleteFileArr.push(fileSeq);

    $fileIpt.val("");
    $fileIpt.attr("fileSeq", "");
    $(t).css("display","none");
}

function fn_addFile(cls, e) {
	var cnt = $(e).closest('.uploadFile').find("input[type=file]").length;
	$("[name=" + cls + "_" + cnt).trigger('click');
	$(e).closest('.uploadFile').append($("[name=" + cls + "_" + cnt).clone().attr('name', cls + '_' + (cnt + 1)));
}

function fn_readFileName(input) {
	var $parent = $(input).closest('.uploadFile');

	if (input.files && input.files[0]) {
		var str = '<li class="file">'
			+ ' 	<input name="" type="checkbox" id="'+input.files[0].name+'" class="custom files">'
			+ ' 	<label for="'+input.files[0].name+'" class="text-none"></label>'
			+ ' 	<span class="name">' + input.files[0].name
			+ '</span>' + ' </li>';
		$parent.find('.fileList').append(str);
	}
}

function fn_fileAllChk(t) {
	$(t).closest(".uploadFile").find("input:checkbox").prop("checked", $(t).is(":checked"))
}

function fn_multiDeleteFile(obj) {
	var $parent = $(obj).closest('.uploadFile');

	if ($parent.find('.files:checked').length != 0) {
		$parent.find('.files:checked').each(function(idx, item) {
			$(this).parents("li.file").remove();
			if(!isEmpty($(item).attr('id')) && deleteFileArr != null) deleteFileArr.push($(item).attr('id'));
		});
	} else {
		alert("삭제하실 파일을 선택해주세요.")
	}
}

function fn_multiFileDown(fileSeq) {
	window.location.href= "/file/fileDownload.do?fileSeq=" + fileSeq + "&realFilePath=" + $("#realFilePath").val();
}

// 파일첨부 공통 함수 END

var addRemoveVisualItem = {
    add: function() {

        var item = $(".visualOuterWrap").find('.group').eq(0).clone();

        item.removeClass("modifyInfo").addClass("insertInfo");
        item.find("input").val("");
        item.find("textarea").val("");
        item.find(".ajax_image_file").html("");
        item.find(".useYnChk").prop("checked", true);
        item.find("input").attr("fileSeq", "");
        item.find(".visualIdx").text($(".visualOuterWrap").find('.group').length + 1);
        item.find(".delBtn").show();

        $(".visualOuterWrap").append(item);

    },
    remove: function(t) {
        $(t).parents(".group").remove();
        $(".visualIdx").each(function(idx, item){ $(this).text(idx + 1); })
    }
}

/* Modals */
var modalFn = {
    show : function(t, params){
        var defaults = {
            onStart : function(){},
            onLoad : function(){},
            onClose : "",
            btnCloseCl : 'modal_close',
            bgClose : true,
            bxId: "#modal_bx",
            bgId : '#modal_overlay',
            parent : false
        };
        params = params || {};
        for (var prop in defaults) {
            if (prop in params && typeof params[prop] === 'object') {
                for (var subProp in defaults[prop]) {if (! (subProp in params[prop])) params[prop][subProp] = defaults[prop][subProp];}
            } else if (! (prop in params)) {params[prop] = defaults[prop];}
        };
        var _this = this;
        if(typeof t != 'object' && $(params.bxId).length === 0){
            var bx_id = params.bxId.substring(params.bxId.indexOf('#')+1, params.bxId.indexOf('.') === -1 ? params.bxId.length : params.bxId.indexOf('.'));
            var bx_class = params.bxId.replace("#"+bx_id,"").replace("."," ");
            $("body").append($("<section></section>").prop({id : bx_id}).addClass(bx_class));
        }
        if($(params.bgId).length === 0){
            var bg_id = params.bgId.substring(params.bgId.indexOf('#')+1, params.bgId.indexOf('.') === -1 ? params.bgId.length : params.bgId.indexOf('.'));
            var bg_class = params.bgId.replace("#"+bg_id,"").replace("."," ");
            $("body").append($("<div></div>").prop({id : bg_id}).addClass(bg_class));
        }

        var bg = $(params.bgId);
        $('body').css('overflow','hidden');
        bg.css('display','block');
        typeof t != 'object' ? ajax() : show();
        function ajax(){
      $.ajax({
                url : t,
                type : "get",
                dataType : "html",
                data : params.data,
                success : function(data){
                    if($(params.bxId).length === 0){
                        var bx_id = params.bxId.substring(params.bxId.indexOf('#')+1, params.bxId.indexOf('.') === -1 ? params.bxId.length : params.bxId.indexOf('.'));
                        var bx_class = params.bxId.replace("#"+bx_id,"").replace("."," ");
                        $("body").append($("<section></section>").prop({id : bx_id}).addClass(bx_class));
                    }
                    var bx = $(params.bxId);
                    bx.html(data);
                    t = bx.find(">*").eq(0);
                    show();
                    fn_hideRegistArea();
                    if($(".btn_group .btn").length == 1) $(".btn_group .btn").addClass("black");
                },
                error : function(a,b,c){
                    alert(b);
                }
            });
        }
        function show(){
            if(params.onLoad)params.onLoad();
            var posi = t.css('position');
            t.css('display','block');
            t.imagesLoaded(function(){
              if($(".modal.on").length > 0) params.parent = $('#'+$(".modal.on").attr("id"));
                bg.addClass('on');
                if(params.bgClose){
                    bg.off('click').on('click',function(){close()});
                }
                $(window).on('resize', {tg : t}, modalFn.resize).resize();
                if(params.parent){
                    params.parent.removeClass('on');
                }
                t.addClass('on');
                t.find('.'+params.btnCloseCl).on('click',function(){close()});
            });
        }
        function close() {
          modalFn.hide(t,params.parent,params.bgId, params.onClose, params.mobileUI);
        }
    },
    hide : function(t, parent, bgId, onClose, mobileUI){
        var bg = bgId ? $(bgId): $("#modal_overlay");
        var bx = $("#modal_bx");
        onClose ? onClose() : "";
        if(!parent){
            bg.off('click');
            bg.removeClass('on');
            $('body').css('overflow','');
        }else{
            bg.off('click').on('click',function(){modalFn.hide(parent);});
            parent.addClass('on');
        }
        t.removeClass('on notrans');
        setTimeout(function(){
            if(!parent){
                bg.remove();
                bx.remove();
            }
            t.css('display','none');
            t.css({'max-height':'', "top":''});
        },500);
        $(window).off('resize', modalFn.resize);
        this.close = null;
    },
    resize : function(e){
        var t = e.data.tg ? e.data.tg : e;
        var posi = t.css('position');
        var vH = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
        var bxHeadH = t.find(".modal_header").length != 0 ? t.find(".modal_header").outerHeight() : 0;
        var bxFootH = t.find(".modal_footer").length != 0 ? t.find(".modal_footer").outerHeight() : 0;
        var bxCont = t.find(".modal_content");
        var scl = posi =='fixed' ? 0 : $(window).scrollTop();
        bxCont.css({"height": ""});
        var bxH = t.outerHeight();
        if(bxCont.outerHeight() > bxH-bxHeadH-bxFootH) bxCont.css({"height": (bxH-bxHeadH-bxFootH)+1});
        bxH = t.outerHeight();
        t.css({"top":( bxH > vH ? scl : (vH-bxH)/2+scl )+"px"});
    }
};



function fn_hideRegistArea() {
	if(registAuthYn == null || registAuthYn == 'undefined') return;
	if(!registAuthYn) {
		$(".registAuthArea, .registAuthBtn, .uploadImgFile button, .addRemoveItem_ctrl, .tagItem button, .registForm .authBtnBox .btn:not(.listBtn)").remove();
		$(".registAuthIpt, .custom.authChk, .registAuthIpt, .registForm .ipt").attr("readonly", true);
		$(".registForm .custom, .registForm .leverChk, .registForm select.ipt").not(".noChk").attr("disabled", true);
		$(".noAuthIpt").attr("readonly", false).attr("disabled", false);
		$(".tagItem, .custom.authChk, .registAuthEvt").attr("onclick", "");
		$("#selTagWrap .tagItem").css("paddingRight", "15px");
		$(".registForm .authBtnBox .leftBtn").removeClass("leftBtn");
	} else {
		$(".registAuthArea, .registAuthBtn, .uploadImgFile button.btn.small.black, .addRemoveItem_ctrl, .tagItem button, .registForm .authBtnBox .btn:not(.listBtn)").show();
	}
}


function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setTime(todayDate.getTime() + 0);
    if(todayDate > expiredays){
        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
    }else if(todayDate < expiredays){
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
    }
}

function getCookie(Name) {
    var search = Name + "=";

    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search);
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length;

            return unescape(document.cookie.substring(offset, end));
        }
    }
    return "";
}