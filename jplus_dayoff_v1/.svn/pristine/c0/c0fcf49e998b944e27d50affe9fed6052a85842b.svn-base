package cms.file.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.WebFactoryUtil;
import cms.file.service.FileService;
import egovframework.com.cmm.service.EgovProperties;

@Controller
public class FileController {

	@Autowired
	private CmnService cmnService;

	@Autowired
	private FileService fileService;
	
	protected Log log = LogFactory.getLog(this.getClass());

	protected Logger logger = LogManager.getLogger(this.getClass());

	/**
	 * 파일 공통 다운로드
     * @param request
     * @param response
     * @return
     * @throws Exception
	 */
	@RequestMapping("/file/fileDownload.do")
    public void fileDownload(HttpServletRequest request, HttpServletResponse response){

        ZValue zvl = WebFactoryUtil.getAttributesInit(request);
        File file = null;
        InputStream is = null;
        OutputStream os = null;

        String mimetype = "application/x-msdownload";
        response.setContentType(mimetype);

        try {

        	ZValue fileInfo = cmnService.retrieveCommonDetail("file.selectFileInfo", zvl);
            setDisposition(((String) fileInfo.get("FILE_NM")), request, response);
            String uploadPath = EgovProperties.getProperty((String) zvl.get("realFilePath"));
            file = new File(uploadPath, ((String) fileInfo.get("SYSTEM_FILE_NM")));
            is = new FileInputStream(file);
            os = response.getOutputStream();

            byte b[] = new byte[(int) file.length()];
            int leng = 0;

            while((leng = is.read(b)) > 0){
                os.write(b,0,leng);
            }

            is.close();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	/**
	 * 파일  공통 다운로드 - 브라우져에 따른 공백 처리, 인코딩(UTF-8)
     * @param request
     * @param response
     * @return
     * @throws Exception
	 */
    void setDisposition(String filename, HttpServletRequest request,
	HttpServletResponse response) throws Exception {
	    String browser = getBrowser(request);
	    String dispositionPrefix = "attachment; filename=";
	    String encodedFilename = null;

	    if (browser.equals("MSIE")) {
	        encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
	        "\\+", "%20");
	    } else if (browser.equals("Firefox")) {
	        encodedFilename = "\""
	        + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
	    } else if (browser.equals("Opera")) {
	        encodedFilename = "\""
	        + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
	    } else if (browser.equals("Chrome")) {
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < filename.length(); i++) {
	        char c = filename.charAt(i);
	        if (c > '~') {
	            sb.append(URLEncoder.encode("" + c, "UTF-8"));
	        } else {
	            sb.append(c);
	        }
	    }
	    encodedFilename = sb.toString();
	    } else {
	        throw new IOException("Not supported browser");
	    }

	    response.setHeader("Content-Disposition", dispositionPrefix
	    + encodedFilename);

	    if ("Opera".equals(browser)) {
	        response.setContentType("application/octet-stream;charset=UTF-8");
	    }
	}

    /**
	 * 파일 공통 다운로드 - 브라우저 구분값 가져오기
     * @param request
     * @param response
     * @return
     * @throws Exception
	 */
    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
             return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
             return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
             return "Opera";
        } else if (header.indexOf("Firefox") > -1) {
             return "Firefox";
        } else if (header.indexOf("Mozilla") > -1) {
             if (header.indexOf("Firefox") > -1) {
                  return "Firefox";
             }else{
                  return "MSIE";
             }
        }
        return "MSIE";
    }

	/**
     * 스마트에디터 이미지 업로드
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
//    @RequestMapping(value="/file/singleImageUploader.do")
//    public void simpleImageUploader(HttpServletRequest request, HttpServletResponse response, SmarteditorVO smarteditorVO) throws UnsupportedEncodingException{
//
//    	String callback = smarteditorVO.getCallback();
//    	String callback_func = smarteditorVO.getCallback_func();
//    	String file_result = "";
//    	MultipartFile multiFile = smarteditorVO.getFiledata();
//
//    	response.setCharacterEncoding("UTF-8");
//    	response.setContentType("text/html;charset=UTF-8");
//
//    	try{
//    		if(multiFile != null && multiFile.getSize() > 0 && StringUtils.isNotBlank(multiFile.getName())){
//    			if(multiFile.getContentType().toLowerCase().startsWith("image/")){
//    				String oriName = multiFile.getName();
//    				String uploadPath = request.getServletContext().getRealPath("/img");
//    				String path = uploadPath + "/smarteditor/";
//    				File file = new File(path);
//    				if(!file.exists()) file.mkdirs();
//    				String fileName = UUID.randomUUID().toString();
//    				smarteditorVO.getFiledata().transferTo(new File(path + fileName));
//
//    				file_result += "&bNewLine=true&sFileName=" + oriName + "&sFileURL=/img/smarteditor/" + fileName;
//    			} else{
//    				file_result += "&errstr=error";
//    			}
//    		} else {
//    			file_result += "&errstr=error";
//    		}
//
//    		response.sendRedirect(callback + "?callback_func=" + URLEncoder.encode(callback_func, "UTF-8") + file_result);
//    	} catch (Exception e){
//    		e.printStackTrace();
//    	}
//    }


	/**
	 * 이미지 순서 변경
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/file/reOrderingImgFile.do")
	public ModelAndView reOrderingImgFile(MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			fileService.updateFileInfo(request, zvl);
			modelAndView.addObject("message", "정상적으로 저장되었습니다.");
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 관리자에게 문의하세요.");
			modelAndView.addObject("errCode", e.getMessage());
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}
	
	/**
	 * Dropzone 이미지 저장
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/file/dropzone.do")
	public ModelAndView test(HttpServletResponse response, MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			zvl.put("parentSeq", zvl.getString("postSeq"));
			fileService.insertFileInfo(request, zvl);
			modelAndView.addObject("message", "정상적으로 저장되었습니다.");
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 관리자에게 문의하세요.");
			modelAndView.addObject("errCode", e.getMessage());
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}
}
