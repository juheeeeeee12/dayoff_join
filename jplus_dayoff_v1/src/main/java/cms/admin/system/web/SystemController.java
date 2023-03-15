package cms.admin.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cms.admin.system.service.SystemService;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.BaseUtil;
import cms.cmn.util.WebFactoryUtil;
import cms.file.service.FileService;

@Controller
public class SystemController {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnService cmnService;

	@Autowired
	private FileService fileService;

	@Autowired
	private SystemService systemService;

	/**
	 * 시스템 관리 > 공통코드 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/cmnCodeList.do")
	public ModelAndView cmnCodeList(HttpServletResponse response, HttpServletRequest request){
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

			ZValue listCntInfo = cmnService.retrieveCommonDetail("system.selectGrpCdListCnt", zvl);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("listCntInfo", listCntInfo);
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("system.selectGrpCdList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);

		modelAndView.addObject("pageLevel1", "system");
	    modelAndView.addObject("pageLevel2", "1");
	    modelAndView.addObject("pageName", "공통코드 관리");

		modelAndView.setViewName("admin/system/cmnCodeList");
		return modelAndView;
	}

	/**
	 * 시스템 관리 > 공통코드 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/cmnCodeWrite.do")
	public ModelAndView cmnCodeWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("grpCd"))) {
				modelAndView.addObject("grpCdInfo", cmnService.retrieveCommonDetail("system.selectGrpCdInfo", zvl));
				modelAndView.addObject("cmnCdList", cmnService.retrieveCommonList("system.selectCmnCdList", zvl));
			}
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addObject("pageLevel1", "system");
		modelAndView.addObject("pageLevel2", "1");
		modelAndView.addObject("pageName", "공통코드 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/system/cmnCodeWrite");
		return modelAndView;
	}

	/**
	 * 시스템 관리 > 공통코드 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/saveCmnCodeAjax.do")
	public ModelAndView saveCmnCode(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			systemService.saveCmnCode(zvl);
			modelAndView.addObject("message", "정상적으로 저장되었습니다.");
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", (BaseUtil.isEmpty(zvl.getString("outMessage")) ? "문제가 발생했습니다. 관리자에게 문의하세요." : zvl.getString("outMessage")));
			modelAndView.addObject("errCode", e.getMessage());
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/**
	 * 시스템 관리 > 공통코드 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/deleteCmnCodeAjax.do")
	public ModelAndView deleteCmnCode(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			systemService.deleteCmnCode(zvl);
			modelAndView.addObject("message", "정상적으로 삭제되었습니다.");
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", (BaseUtil.isEmpty(zvl.getString("outMessage")) ? "문제가 발생했습니다. 관리자에게 문의하세요." : ""));
			modelAndView.addObject("errCode", e.getMessage());
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/**
	 * 프론트 > 메뉴 관리 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/mngMenuList.do")
	public ModelAndView mngMenuList(HttpServletResponse response, HttpServletRequest request){
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

			ZValue listCntInfo = cmnService.retrieveCommonDetail("system.selectMenuListCnt", zvl);
			modelAndView.addObject("listCntInfo", listCntInfo);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("system.selectMenuList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);

		modelAndView.addObject("pageLevel1", "system");
	    modelAndView.addObject("pageLevel2", "2");
	    modelAndView.addObject("pageName", "메뉴 관리");

		modelAndView.setViewName("admin/system/mngMenuList");
		return modelAndView;
	}

	/**
	 * 프론트 > 메뉴 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/mngMenuWrite.do")
	public ModelAndView mngMenuWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("menuSeq"))) modelAndView.addObject("result", cmnService.retrieveCommonDetail("system.selectMenuInfo", zvl));

			modelAndView.addObject("menuTypeList", cmnService.selectCmnCdList("MENU_GB_CD", zvl));
			modelAndView.addObject("contentsList", cmnService.retrieveCommonList("system.selectContentsList", zvl));
			modelAndView.addObject("boardList", cmnService.retrieveCommonList("system.selectBoardList", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addObject("pageLevel1", "system");
		modelAndView.addObject("pageLevel2", "2");
		modelAndView.addObject("pageName", "메뉴 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/system/mngMenuWrite");
		return modelAndView;
	}

	/**
	 * 프론트 > 메뉴정보 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/saveMenuInfoAjax.do")
	public ModelAndView saveMenuInfo(HttpServletResponse response, MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			systemService.saveMenuInfo(zvl);
			zvl.put("parentSeq", zvl.getString("menuSeq"));
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

	/**
	 * 프론트 > 메뉴정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/deleteMenuInfoAjax.do")
	public ModelAndView deleteMenuInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			systemService.deleteMenuInfo(zvl);
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

	/**
	 * 프론트 > 메뉴 관리 > 상위 메뉴 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/selectParentMenuListAjax.do")
	public ModelAndView selectParentMenuList(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			int pMenuDepth = zvl.getInt("menuDepth") - 1;
			modelAndView.addObject("pMenuList", cmnService.retrieveCommonList("system.selectDepth" + pMenuDepth + "MenuList", zvl));
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
	 * 어드민 > 메뉴 관리 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/mngCmsMenuList.do")
	public ModelAndView mngCmsMenuList(HttpServletResponse response, HttpServletRequest request){
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

			ZValue listCntInfo = cmnService.retrieveCommonDetail("system.selectCmsMenuListCnt", zvl);
			modelAndView.addObject("listCntInfo", listCntInfo);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("system.selectCmsMenuList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);

		modelAndView.addObject("pageLevel1", "system");
	    modelAndView.addObject("pageLevel2", "2");
	    modelAndView.addObject("pageName", "메뉴 관리");

		modelAndView.setViewName("admin/admin/mngCmsMenuList");
		return modelAndView;
	}

	/**
	 * 어드민 > 메뉴 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/mngCmsMenuWrite.do")
	public ModelAndView mngCmsMenuWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("menuSeq"))) modelAndView.addObject("result", cmnService.retrieveCommonDetail("system.selectCmsMenuInfo", zvl));
			modelAndView.addObject("menuTypeList", cmnService.selectCmnCdList("CMS_MENU_GB_CD", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addObject("pageLevel1", "system");
		modelAndView.addObject("pageLevel2", "2");
		modelAndView.addObject("pageName", "메뉴 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/admin/mngCmsMenuWrite");
		return modelAndView;
	}

	/**
	 * 어드민 > 메뉴정보 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/saveCmsMenuInfoAjax.do")
	public ModelAndView saveCmsMenuInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			systemService.saveCmsMenuInfo(zvl);
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
	 * 어드민 > 메뉴정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/deleteCmsMenuInfoAjax.do")
	public ModelAndView deleteCmsMenuInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			systemService.deleteCmsMenuInfo(zvl);
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

	/**
	 * 어드민 > 메뉴 관리 > 상위 메뉴 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/selectCmsParentMenuListAjax.do")
	public ModelAndView selectCmsParentMenuList(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			int pMenuDepth = zvl.getInt("menuDepth") - 1;
			modelAndView.addObject("pMenuList", cmnService.retrieveCommonList("system.selectDepth" + pMenuDepth + "CmsMenuList", zvl));
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
	 * 어드민 > 권한 관리
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/mngAuthPage.do")
	public ModelAndView mngAuthPage(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			modelAndView.addObject("accountGbList", cmnService.selectCmnCdList("AUTH_CD", zvl));
			modelAndView.addObject("menuList", cmnService.retrieveCommonList("system.selectAuthMenuList", zvl));

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);

		}

		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/system/mngAuthPage");

		return modelAndView;
	}

	/**
	 * 어드민 > 권한 관리 > 계정 구분 권한 조회
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/selectAuthMenuListAjax.do")
	public ModelAndView selectAuthMenuList(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			modelAndView.addObject("authMenuList", cmnService.retrieveCommonList("system.selectAuthMenuInfoList", zvl));
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);

			modelAndView.addObject("message", "문제가 발생했습니다. 고객센터에 문의하세요.");

			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/**
	 * 어드민 > 권한 관리 > 권한 정보 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/system/saveAuthInfoAjax.do")
	public ModelAndView saveAuthInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			systemService.saveAuthInfo(zvl);
			modelAndView.addObject("message", "저장되었습니다.");
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 고객센터에 문의하세요.");
			modelAndView.addObject("retcode", "FAIL");
		}
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

}
