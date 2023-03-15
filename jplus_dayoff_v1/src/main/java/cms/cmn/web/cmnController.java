package cms.cmn.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.WebFactoryUtil;

@Controller
public class cmnController {

protected Log log = LogFactory.getLog(this.getClass());

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnService cmnService;

	/**
	 * 에러 페이지 이동
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/exception/error.do")
	public ModelAndView error(
						HttpServletRequest request,
						ModelMap model
						) throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		String retPage = "exception/error";
		logger.debug("retPage : " + retPage);

		return modelAndView;
	}

}