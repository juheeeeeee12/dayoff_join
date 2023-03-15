package cms.admin.contents.service.impl;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cms.admin.contents.service.ContentsService;
import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;

@Service
public class ContentsServiceImpl implements ContentsService {
	
	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnDAO cmnDao;
	
	@Override
	public void saveContentsInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("contents.updateContentsInfo", zvl); // 수정
		else cmnDao.insert("contents.insertContentsInfo", zvl);  // 등록
	}

	@Override
	public void deleteContentsInfo(ZValue zvl) throws Exception {
		 cmnDao.delete("contents.deleteContentsInfo", zvl);
	}
	
}
