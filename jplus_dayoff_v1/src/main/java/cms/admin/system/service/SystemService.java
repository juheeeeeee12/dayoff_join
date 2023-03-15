package cms.admin.system.service;

import cms.cmn.model.ZValue;

public interface SystemService {

	// 공통코드 등록/수정
	void saveCmnCode(ZValue zvl) throws Exception;

	// 공통코드 삭제
	void deleteCmnCode(ZValue zvl) throws Exception;

	// 메뉴정보 등록/수정
	void saveMenuInfo(ZValue zvl) throws Exception;

	// 메뉴정보 삭제
	void deleteMenuInfo(ZValue zvl) throws Exception;

	// CMS 메뉴정보 등록/수정
	void saveCmsMenuInfo(ZValue zvl) throws Exception;

	// CMS 메뉴정보 삭제
	void deleteCmsMenuInfo(ZValue zvl) throws Exception;

	// 권한정보 등록/수정
	void saveAuthInfo(ZValue zvl) throws Exception;

	// 권한정보 삭제
	void deleteAuthInfo(ZValue zvl) throws Exception;

}
