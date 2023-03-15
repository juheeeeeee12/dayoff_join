package cms.admin.visual.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import cms.admin.admin.service.AdminService;
import cms.admin.visual.service.VisualService;
import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;
import cms.cmn.util.BaseUtil;

@Service
public class VisualServiceImpl implements VisualService {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnDAO cmnDao;

	@Override
	public void saveMainBannerInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("visual.updateMainBannerInfo", zvl); // 수정
		else cmnDao.insert("visual.insertMainBannerInfo", zvl);  // 등록
	}

	@Override
	public void deleteMainBannerInfo(ZValue zvl) throws Exception {
		 cmnDao.delete("visual.deleteMainBannerInfo", zvl);
	}

	@Override
	public void reOrderBannerOrder(ZValue zvl) throws Exception {
		if(!BaseUtil.isEmpty(zvl.getString("reOrderArr"))) {
			ObjectMapper mapper = new ObjectMapper();
			List<ZValue> reOrderList = mapper.readValue(zvl.getString("reOrderArr"), new TypeReference<ArrayList<ZValue>>(){});
			if(reOrderList != null && reOrderList.size() > 0) {
				for(ZValue z : reOrderList) {
					cmnDao.update("visual.reOrderBannerOrder", z);
				}
			}
		}
	}

	@Override
	public void savePopupInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("visual.updatePopupInfo", zvl); // 수정
		else cmnDao.insert("visual.insertPopupInfo", zvl);  // 등록
	}

	@Override
	public void deletePopupInfo(ZValue zvl) throws Exception {
		cmnDao.delete("visual.deletePopupInfo", zvl);
	}

	@Override
	public void reOrderPopupOrder(ZValue zvl) throws Exception {
		if(!BaseUtil.isEmpty(zvl.getString("reOrderArr"))) {
			ObjectMapper mapper = new ObjectMapper();
			List<ZValue> reOrderList = mapper.readValue(zvl.getString("reOrderArr"), new TypeReference<ArrayList<ZValue>>(){});
			if(reOrderList != null && reOrderList.size() > 0) {
				for(ZValue z : reOrderList) {
					cmnDao.update("visual.reOrderPopupOrder", z);
				}
			}
		}
	}

}
