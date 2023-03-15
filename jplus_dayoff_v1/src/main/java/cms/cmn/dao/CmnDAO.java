package cms.cmn.dao;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import cms.cmn.model.ZValue;

@Repository
public class CmnDAO extends CmnSupportDAO {
	
	protected Logger logger = LogManager.getLogger(this.getClass());
	
	/**
	 * 공통 int 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	public int retrieveCommonInteger(ZValue zvl) throws Exception {
		return (Integer) selectCnt((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 int 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	public int retrieveCommonInteger(String sqlId, ZValue zvl) throws Exception {
		return (Integer) selectCnt(sqlId, zvl);
	}
	
	/**
	 * 공통 String 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	public String retrieveCommonString(ZValue zvl) throws Exception {
		return selectString((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 String 조회 
	 * @param zvl
	 * @return int
	 * @throws Exception
	 */
	public String retrieveCommonString(String sqlId, ZValue zvl) throws Exception {
		return selectString(sqlId, zvl);
	}
	
	/**
	 * 공통 List 조회 
	 * @param zvl
	 * @return List<ZValue>
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<ZValue> retrieveCommonList(ZValue zvl) throws Exception {
		return (List<ZValue>) selectList((String)zvl.get("sqlId"), zvl);
	}

	/**
	 * 공통 List 조회 
	 * @param zvl
	 * @return List<ZValue>
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<ZValue> retrieveCommonList(String sqlId, ZValue zvl) throws Exception {
		return (List<ZValue>) selectList(sqlId, zvl);
	}
	
	/**
	 * 공통 상세 조회 
	 * @param zvl
	 * @return ZValue
	 * @throws Exception
	 */
	public ZValue retrieveCommonDetail(ZValue zvl) throws Exception {
		return (ZValue) selectOne((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 상세 조회 
	 * @param zvl
	 * @return ZValue
	 * @throws Exception
	 */
	public ZValue retrieveCommonDetail(String sqlId, ZValue zvl) throws Exception {
		return (ZValue) selectOne(sqlId, zvl);
	}
	
	/**
	 * 공통 등록 처리 
	 * @param zvl
	 * @throws Exception
	 */
	public void createCommonInfo(ZValue zvl) throws Exception {
		insert((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 등록 처리 
	 * @param zvl
	 * @throws Exception
	 */
	public void createCommonInfo(String sqlId, ZValue zvl) throws Exception {
		insert(sqlId, zvl);
	}
	
	/**
	 * 공통 수정 처리 
	 * @param zvl
	 * @throws Exception
	 */
	public void modifyCommonInfo(ZValue zvl) throws Exception {
		update((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 수정 처리 
	 * @param zvl
	 * @throws Exception
	 */
	public void modifyCommonInfo(String sqlId, ZValue zvl) throws Exception {
		update(sqlId, zvl);
	}

	/**
	 * 공통 삭제 처리 
	 * @param zvl
	 * @throws Exception
	 */
	public void removeCommonInfo(ZValue zvl) throws Exception {
		delete((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 삭제 처리 
	 * @param zvl
	 * @throws Exception
	 */
	public void removeCommonInfo(String sqlId, ZValue zvl) throws Exception {
		delete(sqlId, zvl);
	}
	
	/**
	 * 공통 등록 처리  return int
	 * @param zvl
	 * @throws Exception
	 */
	public int createCommonInfoRtnInt(ZValue zvl) throws Exception {
		return (int) insert((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 수정 처리 return int
	 * @param zvl
	 * @throws Exception
	 */
	public int modifyCommonInfoRtnInt(ZValue zvl) throws Exception {
		return (int) update((String)zvl.get("sqlId"), zvl);
	}
	
	/**
	 * 공통 삭제 처리 return int
	 * @param zvl
	 * @throws Exception
	 */
	public int removeCommonInfoRtnInt(ZValue zvl) throws Exception {
		return (int) delete((String)zvl.get("sqlId"), zvl);
	}

	/**
	 * 공통 코드 리스트
	 * @param zvl
	 * @throws Exception
	 */
	public List<ZValue> selectCmnCdList(String grpCd, ZValue zvl) throws Exception {
		zvl.put("grpCd", grpCd);
		return (List<ZValue>) selectList("CommonSql.selectCmnCdList", zvl);
	}
	
}
