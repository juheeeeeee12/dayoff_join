package cms.file.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import cms.cmn.model.ZValue;

public interface FileService {
	
	/**
	 * 파일 리스트 
	 * @param zvl
	 * @throws Exception
	 */
	List<ZValue> selectFileItemList(int parentSeq, String fileItem, ZValue zvl) throws Exception;
	
	/**
	 * 공통 파일 업로드 
	 * @param zvl
	 * @throws Exception
	 */
	void insertFileInfo(MultipartHttpServletRequest request, ZValue zvl) throws Exception;
	
	/**
	 * 데이터 삭제시 첨부된 파일 삭제 
	 * @param zvl
	 * @throws Exception
	 */
	void deleteAttachFiles(ZValue zvl) throws Exception;
	
	/**
	 * 공통 파일 수정
	 * @param request
	 * @param zvl
	 * @throws Exception
	 */
	void updateFileInfo(MultipartHttpServletRequest request, ZValue zvl) throws Exception;

}
