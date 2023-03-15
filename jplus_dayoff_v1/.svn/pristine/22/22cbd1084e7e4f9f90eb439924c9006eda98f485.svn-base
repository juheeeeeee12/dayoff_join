package cms.admin.contents.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cms.admin.contents.service.ContentsService;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.WebFactoryUtil;
import cms.file.service.FileService;
import cms.cmn.util.BaseUtil;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ContentsController {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnService cmnService;

	@Autowired
	private FileService fileService;

	@Autowired
	private ContentsService contentsService;

	/**
	 * 컨텐츠 관리 > 컨텐츠 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/contents/mngContentsList.do")
	public ModelAndView mngContentsList(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {

			if (!zvl.containsKey("pageIndex") || BaseUtil.isEmpty(zvl.get("pageIndex"))) zvl.put("pageIndex", 1);

			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(BaseUtil.parseIntDft1(zvl.get("pageIndex")));
			paginationInfo.setRecordCountPerPage(10);
			paginationInfo.setPageSize(10);

			zvl.put("firstIndex", paginationInfo.getFirstRecordIndex());
			zvl.put("lastIndex", paginationInfo.getLastRecordIndex());
			zvl.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());

			ZValue listCntInfo = cmnService.retrieveCommonDetail("contents.selectContentsListCnt", zvl);
			modelAndView.addObject("listCntInfo", listCntInfo);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("contents.selectContentsList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);

		modelAndView.addObject("pageLevel1", "contents");
	    modelAndView.addObject("pageName", "컨텐츠 관리");

		modelAndView.setViewName("admin/contents/mngContentsList");
		return modelAndView;
	}

	/**
	 * 컨텐츠 관리 > 컨텐츠 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/contents/mngContentsWrite.do")
	public ModelAndView mngContentsWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("contentsSeq"))) {
				ZValue result = cmnService.retrieveCommonDetail("contents.selectContentsInfo", zvl);
				modelAndView.addObject("result", result);
				if(result.getString("CONTENTS_GB").equals("CSTMZ")) {
					String custJson = "";
					for(int i = 1; i <= 5; i++) {
						custJson += result.getString("CUST_JSON_" + i);
					}
					if(!BaseUtil.isEmpty(custJson)) {
						String json = custJson;
					    ObjectMapper mapper = new ObjectMapper();
					    List<ZValue> custKeyValList = mapper.readValue(json, new TypeReference<ArrayList<ZValue>>(){});
					    modelAndView.addObject("custKeyValList", custKeyValList);
					}
					modelAndView.addObject("custImgList", cmnService.retrieveCommonList("contents.selectContentsImgList", zvl));
				}

			}
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addObject("pageLevel1", "contents");
		modelAndView.addObject("pageName", "컨텐츠 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/contents/mngContentsWrite");
		return modelAndView;
	}

	/**
	 * 컨텐츠 관리 > 컨텐츠 정보 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/contents/saveContentsInfoAjax.do")
	public ModelAndView saveContentsInfo(HttpServletResponse response, MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
//			MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) request;

			contentsService.saveContentsInfo(zvl);
			zvl.put("parentSeq", zvl.getString("contentsSeq"));
			fileService.insertFileInfo(request, zvl);
			modelAndView.addAllObjects(zvl);
			modelAndView.addObject("message", "정상적으로 저장되었습니다.");
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 관리자에게 문의하세요.");
			modelAndView.addObject("errCode", e.getMessage());
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/**
	 * 컨텐츠 관리 > 컨텐츠 미리보기
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/contents/previewContents.do")
	public ModelAndView previewContents(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			modelAndView.addObject("result", cmnService.retrieveCommonDetail("contents.selectContentsInfo", zvl));
			modelAndView.addObject("cntntImgList", cmnService.retrieveCommonList("contents.selectContentsImgList", zvl));
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.setViewName("admin/contents/content_preview");
		return modelAndView;
	}

	/**
	 * 컨텐츠 관리 > 컨텐츠 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/contents/deleteContentsInfoAjax.do")
	public ModelAndView deleteContentsInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			contentsService.deleteContentsInfo(zvl);
			zvl.put("parentSeq", zvl.getString("contentsSeq"));
			fileService.deleteAttachFiles(zvl);
			modelAndView.addObject("message", "정상적으로 삭제되었습니다.");
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
