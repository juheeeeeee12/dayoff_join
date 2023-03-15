package cms.cmn.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cms.cmn.model.ZValue;


public interface CmnService {
	
	/**
	 * 공통 int 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	int retrieveCommonInteger(ZValue zvl) throws Exception;
	
	/**
	 * 공통 int 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	int retrieveCommonInteger(String sqlId, ZValue zvl) throws Exception;
	
	/**
	 * 공통 String 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	String retrieveCommonString(ZValue zvl) throws Exception;
	
	/**
	 * 공통 String 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	String retrieveCommonString(String sqlId, ZValue zvl) throws Exception;
	
	/**
	 * 공통 List 조회 
	 * @param zvl
	 * @return List<ZValue>
	 * @throws Exception
	 */
	List<ZValue> retrieveCommonList(ZValue zvl) throws Exception;
	
	/**
	 * 공통 List 조회 
	 * @param zvl
	 * @return List<ZValue>
	 * @throws Exception
	 */
	List<ZValue> retrieveCommonList(String sqlId, ZValue zvl) throws Exception;
	
	/**
	 * 공통 상세 조회 
	 * @param zvl
	 * @return ZValue
	 * @throws Exception
	 */
	ZValue retrieveCommonDetail(ZValue zvl) throws Exception; 
	
	/**
	 * 공통 상세 조회 
	 * @param zvl
	 * @return ZValue
	 * @throws Exception
	 */
	ZValue retrieveCommonDetail(String sqlId, ZValue zvl) throws Exception;
		
	/**
	 * 공통 수정 처리 
	 * @param zvl
	 * @throws Exception
	 */
	void modifyCommonInfo(ZValue zvl) throws Exception; 
	
	/**
	 * 공통 수정 처리 
	 * @param zvl
	 * @throws Exception
	 */
	void modifyCommonInfo(String sqlId, ZValue zvl) throws Exception; 
	
	/**
	 * 공통 등록 처리 
	 * @param zvl
	 * @throws Exception
	 */
	void createCommonInfo(ZValue zvl) throws Exception; 
	
	/**
	 * 공통 등록 처리 
	 * @param zvl
	 * @throws Exception
	 */
	void createCommonInfo(String sqlId, ZValue zvl) throws Exception; 
	
	/**
	 * 공통 처리 
	 * @param zvl
	 * @throws Exception
	 */
	void removeCommonInfo(ZValue zvl) throws Exception; 
	
	/**
	 * 공통 처리 
	 * @param zvl
	 * @throws Exception
	 */
	void removeCommonInfo(String sqlId, ZValue zvl) throws Exception;

	/**
	 * 공통 등록 처리 
	 * @param zvl
	 * @throws Exception
	 */

	int createCommonInfoRtnInt(ZValue zvl) throws Exception;

	/**
	 * 공통 삭제 처리 
	 * @param zvl
	 * @throws Exception
	 */
	int removeCommonInfoRtnInt(ZValue zvl) throws Exception;
	
	/**
	 * 공통코드 리스트
	 * @param zvl
	 * @throws Exception
	 */
	List<ZValue> selectCmnCdList(String grpCd, ZValue zvl) throws Exception;
	
}