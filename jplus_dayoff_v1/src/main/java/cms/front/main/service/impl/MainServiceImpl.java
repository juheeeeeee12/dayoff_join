package cms.front.main.service.impl;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;
import cms.cmn.util.BaseUtil;
import cms.front.main.service.MainService;

@Service
public class MainServiceImpl implements MainService {

	protected Logger logger = LogManager.getLogger(this.getClass());

	BCryptPasswordEncoder bp = new BCryptPasswordEncoder();

	@Autowired
	private CmnDAO cmnDao;

	@Override
	public void saveMemberInfo(ZValue zvl) throws Exception {
		if(!BaseUtil.isEmpty(zvl.get("loginPwd"))) zvl.put("loginPwd", bp.encode(zvl.get("loginPwd").toString()));
		if(cmnDao.retrieveCommonInteger("member.selectMemberIdCnt", zvl) > 0) {
			zvl.put("outMessage", "이미 등록된 아이디입니다.");
			throw new Exception((String) zvl.get("outMessage"));
		}
		zvl.put("joinStatusCd", "02"); // 승인 상태로 가입
		cmnDao.insert("member.insertMemberInfo", zvl);
	}

	@Override
	public int emailCheck(ZValue zvl) throws Exception {
		int result = cmnDao.retrieveCommonInteger("member.selectMemberIdCnt", zvl);
		
		return result;
	}

}
