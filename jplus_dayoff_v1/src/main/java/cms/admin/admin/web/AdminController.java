package cms.admin.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cms.admin.admin.service.AdminService;
import cms.admin.member.service.MemberService;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.BaseUtil;
import cms.cmn.util.WebFactoryUtil;

@Controller
public class AdminController {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnService cmnService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;


	/**
	 * 관리자 로그인 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/login.do")
	public ModelAndView adminLoginView(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/login");
		return modelAndView;
	}

	/**
	 * 관리자 로그아웃
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/logout.do")
	public ModelAndView adminLogout(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		try{
//			zvl.put("loginId", session.getAttribute("sessionId"));
//			zvl.put("logGb", "O");
//			accountService.insertLoginLog(zvl);
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		session.invalidate();
		modelAndView.setViewName("redirect:/cms/login.do");
		return modelAndView;
	}

	/**
	 * 관리자 로그인
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/adminLogin.do")
	public ModelAndView adminLogin(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{

			modelAndView.addObject("success", false);
			ZValue member = cmnService.retrieveCommonDetail("admin.selectAdminLogin", zvl);
			BCryptPasswordEncoder bp = new BCryptPasswordEncoder();

			if(member != null ) {
				Boolean pwChk = bp.matches(zvl.getString("adminPwd"), (String) member.get("PASSWORD"));
				if(!pwChk) {
					zvl.put("outMessage", "아이디 또는 비밀번호를 잘못 입력하셨습니다.");
					throw new Exception((String) zvl.get("outMessage"));
				}
				if(pwChk) {
					if(!member.getString("JOIN_STATUS_CD").equals("02")) {
						if(member.getString("JOIN_STATUS_CD").equals("01")) zvl.put("outMessage", "승인 신청중인 계정입니다.");
						else if(member.getString("JOIN_STATUS_CD").equals("03")) zvl.put("outMessage", "사용중지된 계정입니다.");
						throw new Exception((String) zvl.get("outMessage"));
					}
					modelAndView.addObject("success", true);
					memberService.insertLoginLog(member.getString("ADMIN_ID"), "ADMIN", zvl);
					session.setAttribute("sessionId", member.get("ADMIN_ID"));
					session.setAttribute("sessionAuthCd", member.get("AUTH_CD"));
				}
			} else {
				zvl.put("outMessage", "아이디 또는 비밀번호를 잘못 입력하셨습니다.");
				throw new Exception((String) zvl.get("outMessage"));
			}

		}catch (Exception e) {
			logger.error("error ::: ", e);
			modelAndView.addObject("message", (BaseUtil.isEmpty(zvl.getString("outMessage")) ? "문제가 발생했습니다. 고객센터에 문의하세요." : zvl.getString("outMessage")));
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/**
	 * 관리자 메인 페이지 (대시보드)
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/main.do")
	public ModelAndView adminMainView(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		
		try {
			
		} catch (Exception e){
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 관리자에게 문의하세요.");
		}
		
		modelAndView.addAllObjects(zvl);
		modelAndView.addObject("nowMenuSeq", "22");
		modelAndView.setViewName("admin/main");
		return modelAndView;
	}
	
	/**
	 * 대시보드 연차 캘린더 정보
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/vacationCalenderInfo.do")
	public ModelAndView vacationCalenderInfo(HttpServletResponse response, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
//		zvl.put("cmpnyCd", session.getAttribute("cmpnyCd"));
		zvl.put("cmpnyCd", "123456"); // 테스트 용도
		
		try {
			modelAndView.addObject("vacationList", cmnService.retrieveCommonList("vacation.selectVacationCalender", zvl));
			
		} catch (Exception e){
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 관리자에게 문의하세요.");
		}
		
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}
	
	
	

	/**
	 * 관리자 권한 메뉴 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/selectAccountAuthMenuListAjax.do")
	public ModelAndView selectAccountAuthMenuList(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionAuthCd", session.getAttribute("sessionAuthCd"));

		try{
			modelAndView.addObject("retcode", "SUCC");
			modelAndView.addObject("postMenuList", cmnService.retrieveCommonList("CommonSql.selectPostMenuList", zvl));
			modelAndView.addObject("accountAuthMenuList", cmnService.retrieveCommonList("CommonSql.selectAccountAuthMenuList", zvl));
			modelAndView.addObject("accountRegistAuthList", cmnService.retrieveCommonString("CommonSql.selectAccountRegistAuthList", zvl));
		}catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);

			modelAndView.addObject("message", "문제가 발생했습니다. 고객센터에 문의하세요.");

			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/**
	 * 개인 정보 수정 팝업
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/openModifyAccountInfoPopup.do")
	public ModelAndView openModifyAccountInfoPopup(HttpServletResponse response, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		String sessionAuthCd = "";

		try {
			if (!BaseUtil.isEmpty(session.getAttribute("sessionAuthCd"))) {
				sessionAuthCd = (String) session.getAttribute("sessionAuthCd");
			}
			zvl.put("adminId", session.getAttribute("adminId"));
			modelAndView.addObject("myAccountInfo", cmnService.retrieveCommonDetail("admin.selectAdminLogin", zvl));

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 관리자에게 문의하세요.");
		}

		modelAndView.setViewName("admin/account/modifyAccountInfoPopup");
		return modelAndView;
	}

	/**
	 * 비밀번호 수정 팝업
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/openModifyPasswordPopup.do")
	public ModelAndView openModifyPasswordPopup(HttpServletResponse response, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/account/modifyPasswordPopup");
		return modelAndView;
	}

	/**
	 * 비밀번호 수정
	 * @param response
	 * @param request
	 * @return
	 */

	@RequestMapping("/cms/chgLoginPwdAjax.do")
	public ModelAndView chgLoginPwd(HttpServletResponse response, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			adminService.chgLoginPwd(zvl);
			modelAndView.addObject("message", "비밀번호 변경이 완료되었습니다. 다시 로그인 후 이용 가능합니다.");
			modelAndView.addObject("retcode", "SUCC");
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 고객센터에 문의하세요.");
			modelAndView.addObject("errCode", e.getMessage());
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

}
