package cms.admin.contents.service;

import cms.cmn.model.ZValue;

public interface ContentsService {

	// 컨텐츠 정보 등록/수정
	void saveContentsInfo(ZValue zvl) throws Exception;
	
	// 컨텐츠 정보 삭제
	void deleteContentsInfo(ZValue zvl) throws Exception;
	
}
