package cms.admin.admin.service.impl;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import cms.admin.admin.service.AdminService;
import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;

@Service
public class AdminServiceImpl implements AdminService {
	protected Logger logger = LogManager.getLogger(this.getClass());
	
	BCryptPasswordEncoder bp = new BCryptPasswordEncoder();
	
	@Autowired
	private CmnDAO cmnDao;

	@Override
	public void chgLoginPwd(ZValue zvl) throws Exception {
//		Boolean pwChk = bp.matches(zvl.getString("nowPwd"), cmnDao.retrieveCommonDetail("admin.selectAccountLoginInfo", zvl).getString("login_pwd"));
		Boolean pwChk = zvl.getString("nowPwd").equals(cmnDao.retrieveCommonDetail("admin.selectAdminLogin", zvl).getString("PASSWORD"));
		if(!pwChk) {
			zvl.put("outMessage", "현재 비밀번호가 일치하지 않습니다.");
			throw new IllegalAccessException((String) zvl.get("outMessage"));
		}
//		zvl.put("newPwd", bp.encode(zvl.get("newPwd").toString()));
		zvl.put("newPwd", zvl.get("newPwd").toString());
		cmnDao.update("admin.chgLoginPwd", zvl); 
	}
	
}
