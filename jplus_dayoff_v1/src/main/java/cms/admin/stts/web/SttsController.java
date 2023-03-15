package cms.admin.stts.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cms.admin.stts.service.SttsService;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.BaseUtil;
import cms.cmn.util.WebFactoryUtil;

@Controller
public class SttsController {
	
	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnService cmnService;
	
	@Autowired
	private static SttsService sttsService;
	
	/**
	 * 접속자 통계
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/stts/mngAccessorStats.do")
	public ModelAndView adminLoginView(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAllAttributes(request);
		
		try {
			  if (!zvl.containsKey("pageIndex") || BaseUtil.isEmpty(zvl.get("pageIndex"))) {
				  zvl.put("pageIndex", 1);
			  }
			  
			  PaginationInfo paginationInfo = new PaginationInfo();
			  paginationInfo.setCurrentPageNo(BaseUtil.parseIntDft1(zvl.get("pageIndex")));
			  paginationInfo.setRecordCountPerPage(10); paginationInfo.setPageSize(10);
			  
			  zvl.put("firstIndex", paginationInfo.getFirstRecordIndex());
			  zvl.put("lastIndex", paginationInfo.getLastRecordIndex());
			  zvl.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
			  
			  ZValue listCntInfo = cmnService.retrieveCommonDetail("stts.selectAccessorListCnt", zvl);
			  paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			  modelAndView.addObject("listCntInfo", listCntInfo);
			  modelAndView.addObject("resultList", cmnService.retrieveCommonList("stts.selectAccessorList", zvl));
			  modelAndView.addObject("paginationInfo", paginationInfo);
			 			
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}
		
		modelAndView.addAllObjects(zvl);

		modelAndView.addObject("pageLevel1", "stts");
		modelAndView.addObject("pageLevel2", "1");
		modelAndView.addObject("pageNam", "접속자 통계");
		
		modelAndView.setViewName("admin/stts/mngAccessorStats");
		return modelAndView;
	}
	
	/**
	 * 가입자 통계
	 * @param response
	 * @param request
	 * @return
	 */
//	@RequestMapping("/cms/main.do")
//	public ModelAndView adminMainView(HttpServletResponse response, HttpServletRequest request){
//		ModelAndView modelAndView = new ModelAndView();
//		
//		modelAndView.setViewName("admin/main");
//		return modelAndView;
//	}
	
	
}
