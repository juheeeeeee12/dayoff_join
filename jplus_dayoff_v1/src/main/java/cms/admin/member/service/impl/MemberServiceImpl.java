package cms.admin.member.service.impl;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import cms.admin.member.service.MemberService;
import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;
import cms.cmn.util.BaseUtil;

@Service
public class MemberServiceImpl implements MemberService {

	protected Logger logger = LogManager.getLogger(this.getClass());

	BCryptPasswordEncoder bp = new BCryptPasswordEncoder();

	@Autowired
	private CmnDAO cmnDao;

	@Override
	public void saveMemberInfo(ZValue zvl) throws Exception {
		if(!BaseUtil.isEmpty(zvl.get("loginPwd"))) zvl.put("loginPwd", bp.encode(zvl.get("loginPwd").toString()));
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("member.updateMemberInfo", zvl); // 수정
		else {  // 등록
			if(cmnDao.retrieveCommonInteger("member.selectMemberIdCnt", zvl) > 0) {
				zvl.put("outMessage", "이미 등록된 아이디입니다.");
				throw new Exception((String) zvl.get("outMessage"));
			}
			cmnDao.insert("member.insertMemberInfo", zvl);
		}
	}

	@Override
	public void deleteMemberInfo(ZValue zvl) throws Exception {
		cmnDao.update("member.deleteMemberInfo", zvl); // 수정
	}

	@Override
	public void saveAdminInfo(ZValue zvl) throws Exception {
		if(!BaseUtil.isEmpty(zvl.get("loginPwd"))) zvl.put("loginPwd", bp.encode(zvl.get("loginPwd").toString()));
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("member.updateAdminInfo", zvl); // 수정
		else {  // 등록
			if(cmnDao.retrieveCommonInteger("member.selectAdminIdCnt", zvl) > 0) {
				zvl.put("outMessage", "이미 등록된 아이디입니다.");
				throw new Exception((String) zvl.get("outMessage"));
			}
			cmnDao.insert("member.insertAdminInfo", zvl);
		}

	}

	@Override
	public void deleteAdminInfo(ZValue zvl) throws Exception {
		cmnDao.delete("member.deleteAdminInfo", zvl);
	}

	@Override
	public void saveInqryInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("member.updateAnswerInfo", zvl); // 답변
		else cmnDao.insert("member.insertInqryInfo", zvl); // 등록
	}

	@Override
	public void deleteInqryInfo(ZValue zvl) throws Exception {
		cmnDao.delete("member.deleteInqryInfo", zvl);
	}
	
	@Override
	public void insertLoginLog(String loginId, String loginGb, ZValue zvl) throws Exception {
		zvl.put("loginId", loginId);
		zvl.put("loginGb", loginGb);
		zvl.put("loginIp", BaseUtil.getUserIp());
		cmnDao.insert("member.insertLoginLog", zvl);
	}

}
