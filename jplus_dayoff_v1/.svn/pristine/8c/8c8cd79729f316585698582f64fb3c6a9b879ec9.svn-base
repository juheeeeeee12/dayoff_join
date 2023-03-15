package cms.admin.visual.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cms.admin.visual.service.VisualService;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.BaseUtil;
import cms.cmn.util.WebFactoryUtil;
import cms.file.service.FileService;

@Controller
public class VisualController {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnService cmnService;

	@Autowired
	private VisualService visualService;

	@Autowired
	private FileService fileService;

	/**
	 * 비주얼 관리 > 메인 배너 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/mainBannerList.do")
	public ModelAndView mainBannerList(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("visual.selectMainBannerList", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/visual/mainBannerList");
		return modelAndView;
	}

	/**
	 * 비주얼 관리 > 메인 배너 상세
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/mainBannerWrite.do")
	public ModelAndView mainBannerWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("bannerSeq"))) {
				modelAndView.addObject("result", cmnService.retrieveCommonDetail("visual.selectMainBannerInfo", zvl));
			}
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);

		}
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/visual/mainBannerWrite");
		return modelAndView;
	}

	/**
	 * 비주얼 관리 > 메인 배너 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/saveMainBannerInfoAjax.do")
	public ModelAndView saveMainBannerInfo(HttpServletResponse response, MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			visualService.saveMainBannerInfo(zvl);
			zvl.put("parentSeq", zvl.getString("bannerSeq"));
			fileService.insertFileInfo(request, zvl);
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

	/**
	 * 비주얼 관리 > 메인 배너 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/deleteMainBannerInfoAjax.do")
	public ModelAndView deleteMainBannerInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			visualService.deleteMainBannerInfo(zvl);
			zvl.put("parentSeq", zvl.getString("bannerSeq"));
			fileService.deleteAttachFiles(zvl);
			modelAndView.addObject("message", "삭제되었습니다.");
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
	 * 전시 > 메인 배너 관리 > 배너 순서 변경
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/reOrderBannerOrderAjax.do")
	public ModelAndView reOrderBannerOrder(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			visualService.reOrderBannerOrder(zvl);
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", (BaseUtil.isEmpty(zvl.getString("outMessage")) ? "문제가 발생했습니다. 고객센터에 문의하세요." : zvl.getString("outMessage")));
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/**
	 * 비주얼 관리 > 팝업 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/mngPopupList.do")
	public ModelAndView mngPopupList(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("visual.selectPopupList", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/visual/mngPopupList");
		return modelAndView;
	}

	/**
	 * 비주얼 관리 > 팝업 상세
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/mngPopupWrite.do")
	public ModelAndView mngPopupWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("popupSeq"))) {
				modelAndView.addObject("result", cmnService.retrieveCommonDetail("visual.selectPopupInfo", zvl));
			}
			modelAndView.addObject("popupGbList", cmnService.selectCmnCdList("POPUP_GB_CD", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);

		}
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/visual/mngPopupWrite");
		return modelAndView;
	}

	/**
	 * 비주얼 관리 > 팝업 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/savePopupInfoAjax.do")
	public ModelAndView savePopupInfo(HttpServletResponse response, MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			visualService.savePopupInfo(zvl);
			zvl.put("parentSeq", zvl.getString("popupSeq"));
			fileService.insertFileInfo(request, zvl);
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

	/**
	 * 비주얼 관리 > 팝업 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/deletePopupInfoAjax.do")
	public ModelAndView deletePopupInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			visualService.deletePopupInfo(zvl);
			zvl.put("parentSeq", zvl.getString("popupSeq"));
			fileService.deleteAttachFiles(zvl);
			modelAndView.addObject("message", "삭제되었습니다.");
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
	 * 전시 > 팝업 관리 > 팝업 순서 변경
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/visual/reOrderPopupOrderAjax.do")
	public ModelAndView reOrderPopupOrder(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			visualService.reOrderPopupOrder(zvl);
			modelAndView.addObject("retcode", "SUCC");
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", (BaseUtil.isEmpty(zvl.getString("outMessage")) ? "문제가 발생했습니다. 고객센터에 문의하세요." : zvl.getString("outMessage")));
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}
}
