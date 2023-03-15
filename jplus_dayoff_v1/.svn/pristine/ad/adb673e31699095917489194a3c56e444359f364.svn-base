package cms.admin.member.web;

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

import cms.admin.member.service.MemberService;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.BaseUtil;
import cms.cmn.util.WebFactoryUtil;
//import cms.file.service.FileService;
import cms.file.service.FileService;

@Controller
public class MemberController {
	
	protected Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private CmnService cmnService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 회원 관리 > 사용자 관리 > 사용자 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/mngMemberList.do")
	public ModelAndView mngMemberList(HttpServletResponse response, HttpServletRequest request){
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
			
			ZValue listCntInfo = cmnService.retrieveCommonDetail("member.selectMemberListCnt", zvl);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("listCntInfo", listCntInfo);
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("member.selectMemberList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);
			
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addAllObjects(zvl);
		
		modelAndView.addObject("pageLevel1", "member");
		modelAndView.addObject("pageLevel2", "1");
	    modelAndView.addObject("pageName", "회원 관리");
	    
		modelAndView.setViewName("admin/member/mngMemberList");
		return modelAndView;
	}

	/**
	 * 회원 관리 > 사용자 관리 > 사용자 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/mngMemberWrite.do")
	public ModelAndView mngMemberWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try {
			if(!BaseUtil.isEmpty(zvl.get("memberId"))) {
				modelAndView.addObject("result", cmnService.retrieveCommonDetail("member.selectMemberInfo", zvl));
			}
			
			modelAndView.addObject("joinStatusCdList", cmnService.selectCmnCdList("JOIN_STATUS_CD", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addObject("pageLevel1", "member");
		modelAndView.addObject("pageLevel2", "1");
	    modelAndView.addObject("pageName", "회원 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/member/mngMemberWrite");
		return modelAndView;
	}
	
	/**
	 * 회원 관리 > 사용자 관리 > 사용자 정보 등록/수정 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/saveMemberInfoAjax.do")
	public ModelAndView saveMemberInfo(HttpServletResponse response, HttpServletRequest request){
		
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("sessionId"));
		
		try{
			memberService.saveMemberInfo(zvl);
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
	 * 회원 관리 > 사용자 관리 > 사용자 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/deleteMemberInfoAjax.do")
	public ModelAndView deleteMemberInfo(HttpServletResponse response, HttpServletRequest request){
		
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try{
			memberService.deleteMemberInfo(zvl);
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
	 * 회원 관리 > 관리자 관리 > 관리자 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/mngAdminList.do")
	public ModelAndView mngAdminList(HttpServletResponse response, HttpServletRequest request){
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
			
			ZValue listCntInfo = cmnService.retrieveCommonDetail("member.selectAdminListCnt", zvl);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("listCntInfo", listCntInfo);
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("member.selectAdminList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);
			
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addAllObjects(zvl);
		
		modelAndView.addObject("pageLevel1", "member");
		modelAndView.addObject("pageLevel2", "2");
	    modelAndView.addObject("pageName", "관리자 관리");
	    
		modelAndView.setViewName("admin/member/mngAdminList");
		return modelAndView;
	}
	
	/**
	 * 회원 관리 > 관리자 관리 > 관리자 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/mngAdminWrite.do")
	public ModelAndView mngAdminWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try {
			if(!BaseUtil.isEmpty(zvl.get("adminId"))) {
				modelAndView.addObject("result", cmnService.retrieveCommonDetail("member.selectAdminInfo", zvl));
			}
			modelAndView.addObject("authList", cmnService.selectCmnCdList("AUTH_CD", zvl));
			modelAndView.addObject("joinStatusCdList", cmnService.selectCmnCdList("JOIN_STATUS_CD", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addObject("pageLevel1", "member");
		modelAndView.addObject("pageLevel2", "2");
	    modelAndView.addObject("pageName", "관리자 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/member/mngAdminWrite");
		return modelAndView;
	}
	
	/**
	 * 회원 관리 > 관리자 관리 > 관리자 정보 등록/수정 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/saveAdminInfoAjax.do")
	public ModelAndView saveAdminInfo(HttpServletResponse response, HttpServletRequest request){
		
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("adminId"));
		
		try{
			memberService.saveAdminInfo(zvl);
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
	 * 회원 관리 > 관리자 관리 > 관리자 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/deleteAdminInfoAjax.do")
	public ModelAndView deleteAdminInfo(HttpServletResponse response, HttpServletRequest request){
		
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try{
			memberService.deleteAdminInfo(zvl);
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
	 * 회원 관리 > 고객문의 관리 > 고객문의 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/mngInqryList.do")
	public ModelAndView mngInqryList(HttpServletResponse response, HttpServletRequest request){
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
			
			ZValue listCntInfo = cmnService.retrieveCommonDetail("member.selectInqryListCnt", zvl);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("listCntInfo", listCntInfo);
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("member.selectInqryList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);
			modelAndView.addObject("inqryCategoryList", cmnService.selectCmnCdList("INQRY_CATEGORY", zvl));
			
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addAllObjects(zvl);
		
		modelAndView.addObject("pageLevel1", "member");
		modelAndView.addObject("pageLevel2", "3");
		modelAndView.addObject("pageName", "고객문의 관리");
	    
		modelAndView.setViewName("admin/member/mngInqryList");
		return modelAndView;
	}
	
	/**
	 * 회원 관리 > 고객문의 관리 > 고객문의 작성 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/mngInqryWrite.do")
	public ModelAndView mngInqryWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try {
			modelAndView.addObject("inqryCategoryList", cmnService.selectCmnCdList("INQRY_CATEGORY", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addObject("pageLevel1", "member");
		modelAndView.addObject("pageLevel2", "3");
		modelAndView.addObject("pageName", "고객문의 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/member/mngInqryWrite");
		return modelAndView;
	}
	
	/**
	 * 회원 관리 > 고객문의 관리 > 고객문의 답변 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/mngInqryAnswer.do")
	public ModelAndView mngInqryAnswer(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try {
			modelAndView.addObject("result", cmnService.retrieveCommonDetail("member.selectInqryInfo", zvl));
			modelAndView.addObject("inqryCategoryList", cmnService.selectCmnCdList("INQRY_CATEGORY", zvl));
			modelAndView.addObject("inqryFileList", fileService.selectFileItemList(zvl.getInt("inqrySeq"), "inqryFile", zvl));
			modelAndView.addObject("answerFileList", fileService.selectFileItemList(zvl.getInt("inqrySeq"), "answerFile", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addObject("pageLevel1", "member");
		modelAndView.addObject("pageLevel2", "3");
		modelAndView.addObject("pageName", "고객문의 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/member/mngInqryAnswer");
		return modelAndView;
	}
	
	/**
	 * 회원 관리 > 고객문의 관리 > 고객문의 등록/수정 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/saveInqryInfoAjax.do")
	public ModelAndView saveInqryInfo(HttpServletResponse response, MultipartHttpServletRequest request){
		
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("sessionId"));
		
		try{
			memberService.saveInqryInfo(zvl);
			zvl.put("parentSeq", zvl.getString("inqrySeq"));
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
	 * 회원 관리 > 고객문의 관리 > 고객문의 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/member/deleteInqryInfoAjax.do")
	public ModelAndView deleteInqryInfo(HttpServletResponse response, HttpServletRequest request){
		
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try{
			memberService.deleteInqryInfo(zvl);
			zvl.put("parentSeq", zvl.getString("inqrySeq"));
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
