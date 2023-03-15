package egovframework.com.cmm;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스

 * </pre>
 */
public class CmsPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public CmsPaginationRenderer() {

	}

	public void initVariables(){
		firstPageLabel    = "<li class=\"footable-page-arrow first\" onclick=\"{0}({1});return false; \"><a href=\"?pageIndex={1}\" >«</a></li>";
        previousPageLabel = "<li class=\"footable-page-arrow prev\" onclick=\"{0}({1});return false; \"><a href=\"?pageIndex={1}\" >‹</a></li>";
        currentPageLabel  = "<li class=\"footable-page active\"><a href=\"#\"><strong>{0}</strong></a></il>";
        otherPageLabel    = "<li class=\"footable-page\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a></li>";
        nextPageLabel     = "<li class=\"footable-page-arrow next\" onclick=\"{0}({1});return false; \"><a href=\"?pageIndex={1}\" >›</a></li>";
        lastPageLabel     = "<li class=\"footable-page-arrow last\" onclick=\"{0}({1});return false; \"><a href=\"?pageIndex={1}\" >»</a></li>";
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
