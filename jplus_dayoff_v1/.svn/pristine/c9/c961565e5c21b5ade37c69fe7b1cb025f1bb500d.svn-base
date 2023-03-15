package cms.admin.board.web;

import java.util.Locale;

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
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import cms.admin.board.service.BoardService;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import cms.cmn.util.BaseUtil;
import cms.cmn.util.WebFactoryUtil;
import cms.file.service.FileService;

@Controller
public class BoardController {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnService cmnService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private FileService fileService;

	@Autowired
	SessionLocaleResolver localeResolver;

	/**
	 * 게시판 관리 > 게시판 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/mngBoardList.do")
	public ModelAndView mngBoardList(HttpServletResponse response, HttpServletRequest request){
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
			
			ZValue listCntInfo = cmnService.retrieveCommonDetail("board.selectBoardListCnt", zvl);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("listCntInfo", listCntInfo);
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("board.selectBoardList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);

		modelAndView.addObject("pageLevel1", "board");
		modelAndView.addObject("pageLevel2", "1");
	    modelAndView.addObject("pageName", "게시판 관리");

		modelAndView.setViewName("admin/board/mngBoardList");
		return modelAndView;
	}

	/**
	 * 게시판 관리 > 게시판 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/mngBoardWrite.do")
	public ModelAndView mngBoardWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("boardSeq"))) {
				modelAndView.addObject("result", cmnService.retrieveCommonDetail("board.selectBoardInfo", zvl));
				modelAndView.addObject("boardCategoryList", cmnService.retrieveCommonList("board.selectBoardCategoryList", zvl));
			}
			modelAndView.addObject("boardTypeList", cmnService.selectCmnCdList("BOARD_TYPE_CD", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addObject("pageLevel1", "board");
		modelAndView.addObject("pageLevel2", "1");
	    modelAndView.addObject("pageName", "게시판 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/board/mngBoardWrite");
		return modelAndView;
	}

	/**
	 * 게시판 관리 > 게시판 등록/수정 페이지 > 카테고리 설정 모달 팝업
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/showCategoryListModal.do")
	public ModelAndView showCategoryListModal(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			zvl.put("schUseYn", "Y");
			zvl.put("noPaging", "Y");
			modelAndView.addObject("categoryList", cmnService.retrieveCommonList("board.selectCategoryList", zvl));
			modelAndView.addObject("retcode", "SUCC");
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
			modelAndView.addObject("message", "문제가 발생했습니다. 관리자에게 문의하세요.");
			modelAndView.addObject("errCode", e.getMessage());
			modelAndView.addObject("retcode", "FAIL");
		}

		modelAndView.setViewName(BaseUtil.isEmpty(zvl.getString("pagingYn")) ? "admin/board/categoryModal" : "jsonView");
		return modelAndView;
	}

	/**
	 * 게시판 관리 > 게시판 정보 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/saveBoardInfoAjax.do")
	public ModelAndView saveBoardInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			boardService.saveBoardInfo(zvl);
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
	 * 게시판 관리 > 게시판 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/deleteBoardInfoAjax.do")
	public ModelAndView deleteBoardInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			boardService.deleteBoardInfo(zvl);
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
	 * 게시판 관리 > 카테고리 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/mngCategoryList.do")
	public ModelAndView mngCategoryList(Locale locale, HttpServletResponse response, HttpServletRequest request){
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

			paginationInfo.setTotalRecordCount(cmnService.retrieveCommonInteger("board.selectCategoryListCnt", zvl));
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("board.selectCategoryList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);

		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);

		modelAndView.addObject("pageLevel1", "board");
		modelAndView.addObject("pageLevel2", "2");
	    modelAndView.addObject("pageName", "카테고리 관리");

		modelAndView.setViewName("admin/board/mngCategoryList");
		return modelAndView;
	}

	/**
	 * 게시판 관리 > 카테고리 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/mngCategoryWrite.do")
	public ModelAndView mngCategoryWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("categorySeq"))) {
				modelAndView.addObject("result", cmnService.retrieveCommonDetail("board.selectCategoryInfo", zvl));
			}
			modelAndView.addObject("langList", cmnService.selectCmnCdList("LANGUAGE", zvl));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addObject("pageLevel1", "board");
		modelAndView.addObject("pageLevel2", "2");
	    modelAndView.addObject("pageName", "카테고리 관리");
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/board/mngCategoryWrite");
		return modelAndView;
	}

	/**
	 * 게시판 관리 > 카테고리 정보 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/saveCategoryInfoAjax.do")
	public ModelAndView saveCategoryInfo(HttpServletResponse response, MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			boardService.saveCategoryInfo(zvl);
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
	 * 게시판 관리 > 카테고리 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/deleteCategoryInfoAjax.do")
	public ModelAndView deleteCategoryInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try{
			boardService.deleteCategoryInfo(zvl);
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
	 * 게시판 관리 > 게시글 리스트
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/mngPostList.do")
	public ModelAndView mngPostList(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			
			zvl.put("boardSeq", zvl.getValue("nowPostSeq"));

			if (!zvl.containsKey("pageIndex") || BaseUtil.isEmpty(zvl.get("pageIndex"))) zvl.put("pageIndex", 1);

			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(BaseUtil.parseIntDft1(zvl.get("pageIndex")));
			paginationInfo.setRecordCountPerPage(10);
			paginationInfo.setPageSize(10);

			zvl.put("firstIndex", paginationInfo.getFirstRecordIndex());
			zvl.put("lastIndex", paginationInfo.getLastRecordIndex());
			zvl.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
			
			ZValue listCntInfo = cmnService.retrieveCommonDetail("board.selectPostListCnt", zvl);
			paginationInfo.setTotalRecordCount(listCntInfo.getInt("SCH_COUNT"));
			modelAndView.addObject("listCntInfo", listCntInfo);
			modelAndView.addObject("resultList", cmnService.retrieveCommonList("board.selectPostList", zvl));
			modelAndView.addObject("paginationInfo", paginationInfo);

			ZValue boardInfo = cmnService.retrieveCommonDetail("board.selectBoardInfo", zvl);
			if(boardInfo != null && boardInfo.getString("CATE_USE_YN").equals("Y")) {
				zvl.put("schUseYn", "Y");
				modelAndView.addObject("boardCategoryList", cmnService.retrieveCommonList("board.selectBoardCategoryList", zvl));
			}
			modelAndView.addObject("boardInfo", boardInfo);
			modelAndView.addObject("pageName", boardInfo.getString("BOARD_NM"));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addAllObjects(zvl);


		modelAndView.addObject("pageLevel1", "board");
		modelAndView.addObject("pageLevel2", "postMenu_" + zvl.getString("boardSeq"));

		modelAndView.setViewName("admin/board/mngPostList");
		return modelAndView;
	}

	/**
	 * 게시판 관리 > 게시글 등록/수정 페이지
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/mngPostWrite.do")
	public ModelAndView mngPostWrite(HttpServletResponse response, HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);

		try {
			if(!BaseUtil.isEmpty(zvl.get("postSeq"))) {
				modelAndView.addObject("result", cmnService.retrieveCommonDetail("board.selectPostInfo", zvl));
				modelAndView.addObject("postImgList", fileService.selectFileItemList(zvl.getInt("postSeq"), "postImg", zvl));
				modelAndView.addObject("attachFileList", fileService.selectFileItemList(zvl.getInt("postSeq"), "attachFile", zvl));
			}
			ZValue boardInfo = cmnService.retrieveCommonDetail("board.selectBoardInfo", zvl);
			if(boardInfo != null && boardInfo.getString("CATE_USE_YN").equals("Y")) {
				zvl.put("schUseYn", "Y");
				modelAndView.addObject("boardCategoryList", cmnService.retrieveCommonList("board.selectBoardCategoryList", zvl));
			}
			modelAndView.addObject("boardInfo", boardInfo);
			modelAndView.addObject("pageName", boardInfo.getString("BOARD_NM"));
		} catch (Exception e) {
			logger.error("ERROR(" + request.getRequestURI() + ") : " + e);
		}

		modelAndView.addObject("pageLevel1", "board");
		modelAndView.addObject("pageLevel2", "postMenu_" + zvl.getString("boardSeq"));
		modelAndView.addAllObjects(zvl);
		modelAndView.setViewName("admin/board/mngPostWrite");
		return modelAndView;
	}

	/**
	 * 게시판 관리 > 게시글 정보 등록/수정
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/savePostInfoAjax.do")
	public ModelAndView savePostInfo(HttpServletResponse response, MultipartHttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			boardService.savePostInfo(zvl);
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
	
	/**
	 * 게시판 관리 > 게시글 정보 삭제
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/cms/board/deletePostInfoAjax.do")
	public ModelAndView deletePostInfo(HttpServletResponse response, HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ZValue zvl = WebFactoryUtil.getAttributesInit(request);
		HttpSession session = request.getSession();
		zvl.put("sessionId", session.getAttribute("sessionId"));

		try{
			boardService.deletePostInfo(zvl);
			zvl.put("parentSeq", zvl.getString("postSeq"));
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
