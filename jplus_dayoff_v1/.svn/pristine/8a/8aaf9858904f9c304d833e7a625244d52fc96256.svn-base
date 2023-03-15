package cms.cmn.service.impl;

import java.util.List;

import cms.cmn.dao.CmnDAO;
import cms.cmn.dao.CmnSupportDAO;
import cms.cmn.model.ZValue;
import cms.cmn.service.CmnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CmnServiceImpl extends CmnSupportDAO implements CmnService  {
	
	 
	@Autowired 
	private CmnDAO CmnDAO;
	
	@Override
	public int retrieveCommonInteger(ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonInteger(zvl);
	}
	
	@Override
	public int retrieveCommonInteger(String sqlId, ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonInteger(sqlId, zvl);
	}
	
	@Override
	public String retrieveCommonString(ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonString(zvl);
	}
	
	@Override
	public String retrieveCommonString(String sqlId, ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonString(sqlId, zvl);
	}
	
	@Override
	public List<ZValue> retrieveCommonList(ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonList(zvl);
	}
	
	@Override
	public List<ZValue> retrieveCommonList(String sqlId, ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonList(sqlId, zvl);
	}
	
	@Override
	public 	ZValue retrieveCommonDetail(ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonDetail(zvl);
	}
	
	@Override
	public 	ZValue retrieveCommonDetail(String sqlId, ZValue zvl) throws Exception {
		return CmnDAO.retrieveCommonDetail(sqlId, zvl);
	}
		
	@Override
	public void createCommonInfo(ZValue zvl) throws Exception {
		CmnDAO.createCommonInfo(zvl);
	}
	
	@Override
	public void createCommonInfo(String sqlId, ZValue zvl) throws Exception {
		CmnDAO.createCommonInfo(sqlId, zvl);
	}
	
	@Override
	public void modifyCommonInfo(ZValue zvl) throws Exception {
		CmnDAO.modifyCommonInfo(zvl);
	}
	
	@Override
	public void modifyCommonInfo(String sqlId, ZValue zvl) throws Exception {
		CmnDAO.modifyCommonInfo(sqlId, zvl);
	}
		
	@Override
	public 	void removeCommonInfo(ZValue zvl) throws Exception {
		CmnDAO.removeCommonInfo(zvl);
	}
	
	@Override
	public 	void removeCommonInfo(String sqlId, ZValue zvl) throws Exception {
		CmnDAO.removeCommonInfo(sqlId, zvl);
	}

	@Override
	public int createCommonInfoRtnInt(ZValue zvl) throws Exception {
		return CmnDAO.createCommonInfoRtnInt(zvl);
	}

	@Override
	public int removeCommonInfoRtnInt(ZValue zvl) throws Exception {
		return CmnDAO.removeCommonInfoRtnInt(zvl);
	}
	
	@Override
	public List<ZValue> selectCmnCdList(String grpCd, ZValue zvl) throws Exception {
		return CmnDAO.selectCmnCdList(grpCd, zvl);
	}
	
}
