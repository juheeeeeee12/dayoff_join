package cms.admin.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cms.admin.system.service.SystemService;
import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;
import cms.cmn.util.BaseUtil;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class SystemServiceImpl implements SystemService {
	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnDAO cmnDao;

	@Override
	public void saveCmnCode(ZValue zvl) throws Exception {

		String isModify = zvl.getString("isModify");

		if(isModify.equals("Y")) { // 수정
			cmnDao.update("system.updateGrpCdInfo", zvl);
			cmnDao.update("system.deleteCmnCdInfo", zvl);
		} else { // 등록
			if(cmnDao.retrieveCommonInteger("system.selectGrpCdCnt", zvl) > 0) {
				zvl.put("outMessage", "이미 등록된 그룹코드입니다.");
				throw new Exception((String) zvl.get("outMessage"));
			}
			cmnDao.insert("system.insertGrpCdInfo", zvl);
		}

		String cmnCdInfoJson = zvl.getString("cmnCdInfoList");
		if(cmnCdInfoJson.length() > 0) {
		    ObjectMapper mapper = new ObjectMapper();
		    List<ZValue> cmnCdInfoList = mapper.readValue(cmnCdInfoJson, new TypeReference<ArrayList<ZValue>>(){});
		    if(cmnCdInfoList.size() > 0) {
		    	List<String> keyList = new ArrayList<String>(cmnCdInfoList.get(0).keySet());
			    for(int i = 0; i < cmnCdInfoList.size(); i++) {
			    	for(int k = 0; k < keyList.size(); k++) {
			    		zvl.put(keyList.get(k), cmnCdInfoList.get(i).get(keyList.get(k)));
			    	}
			    	cmnDao.insert("system.insertCmnCdInfo", zvl);
			    }
		    }
		}
	}

	@Override
	public void deleteCmnCode(ZValue zvl) throws Exception {
		cmnDao.delete("system.deleteGrpCdInfo", zvl);
	}

	@Override
	public void saveMenuInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("system.updateMenuInfo", zvl); // 수정
		else cmnDao.insert("system.insertMenuInfo", zvl);  // 등록
	}

	@Override
	public void deleteMenuInfo(ZValue zvl) throws Exception {
		 cmnDao.delete("system.deleteMenuInfo", zvl);
	}

	@Override
	public void saveCmsMenuInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("system.updateCmsMenuInfo", zvl); // 수정
		else cmnDao.insert("system.insertCmsMenuInfo", zvl);  // 등록
	}

	@Override
	public void deleteCmsMenuInfo(ZValue zvl) throws Exception {
		 cmnDao.delete("system.deleteCmsMenuInfo", zvl);
	}

	@Override
	public void saveAuthInfo(ZValue zvl) throws Exception {
		cmnDao.delete("system.deleteAuthMenuInfo", zvl);

		// auth menu insert
		String menuAuthList = zvl.getString("menuAuthList");
		if(!BaseUtil.isEmpty(menuAuthList)) {
			ObjectMapper mapper = new ObjectMapper();
		    List<ZValue> insertMenuAuthList = mapper.readValue(menuAuthList, new TypeReference<ArrayList<ZValue>>(){});
		    zvl.put("insertMenuAuthList", insertMenuAuthList);
		    cmnDao.insert("system.insertAuthMenuInfo", zvl);
		}
		/*if(zvl.getString("isModify").equals("Y")) { // 수정
			cmnDao.update("system.updateAuthInfo", zvl);
			cmnDao.delete("system.deleteAuthMenuInfo", zvl);
		}
		else cmnDao.insert("system.insertAuthInfo", zvl);  // 등록
		// auth menu insert

		String menuAuthList = zvl.getString("menuAuthList");
		if(!BaseUtil.isEmpty(menuAuthList)) {
			ObjectMapper mapper = new ObjectMapper();
		    List<ZValue> insertMenuAuthList = mapper.readValue(menuAuthList, new TypeReference<ArrayList<ZValue>>(){});
		    zvl.put("insertMenuAuthList", insertMenuAuthList);
		    cmnDao.insert("system.insertAuthMenuInfo", zvl);
		}*/
	}

	@Override
	public void deleteAuthInfo(ZValue zvl) throws Exception {
		cmnDao.delete("system.deleteAuthInfo", zvl);
	}

}
