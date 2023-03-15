package cms.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import cms.cmn.model.ZValue;
import cms.cmn.util.BaseUtil;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

@SuppressWarnings("deprecation")
public class Interceptor extends HandlerInterceptorAdapter {

	protected Logger logger = LogManager.getLogger(this.getClass());

	ZValue zvl = new ZValue();

	@Autowired
	SessionLocaleResolver localeResolver;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession();
 		String sessionId = (String) session.getAttribute("sessionId");
/*
 		if(BaseUtil.isEmpty(sessionId)) {
 			session.setAttribute("sessionId", "admin");
 			session.setAttribute("sessionAuthCd", "00"); // 슈퍼관리자
 		}
*/
 		if(BaseUtil.isEmpty(sessionId)) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter outs = response.getWriter();
			outs.print("<script>alert('로그인 후 이용해주세요.'); location.href='/cms/login.do'</script>");
			outs.flush();
    	    EgovResourceCloseHelper.close(outs);
			return false;
		} else {
			return true;
		}
// 		return true;
	}

}
