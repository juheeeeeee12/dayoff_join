package cms.admin.board.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cms.admin.board.service.BoardService;
import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;
import cms.cmn.util.BaseUtil;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class BoardServiceImpl implements BoardService {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private CmnDAO cmnDao;

	@Override
	public void saveBoardInfo(ZValue zvl) throws Exception {

		if(zvl.getString("isModify").equals("Y")) { // 수정
			cmnDao.update("board.updateBoardInfo", zvl);

			// 삭제
			String delCateList = zvl.getString("delCateList");
			if(!BaseUtil.isEmpty(delCateList) && delCateList.length() > 0) {
				ObjectMapper mapper = new ObjectMapper();
			    List<ZValue> deleteList = mapper.readValue(delCateList, new TypeReference<ArrayList<ZValue>>(){});
			    zvl.put("deleteList", deleteList);
				cmnDao.delete("board.deleteBoardCategoryInfo", zvl);
			}
		} else { // 등록
			cmnDao.insert("board.insertBoardInfo", zvl);
		}

		String selCateList = zvl.getString("selCateList");
		if(!BaseUtil.isEmpty(selCateList) && selCateList.length() > 0) {
			ObjectMapper mapper = new ObjectMapper();
		    List<ZValue> insertList = mapper.readValue(selCateList, new TypeReference<ArrayList<ZValue>>(){});
		    zvl.put("insertList", insertList);
		    cmnDao.insert("board.insertBoardCategoryInfo", zvl);
		}

	}

	@Override
	public void deleteBoardInfo(ZValue zvl) throws Exception {
		 cmnDao.delete("board.deleteBoardInfo", zvl);
		 cmnDao.delete("board.deleteBoardCategoryAll", zvl);
	}

	@Override
	public void saveCategoryInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) cmnDao.update("board.updateCategoryInfo", zvl); // 수정
		else cmnDao.insert("board.insertCategoryInfo", zvl);  // 등록
	}

	@Override
	public void deleteCategoryInfo(ZValue zvl) throws Exception {
		 cmnDao.delete("board.deleteCategoryInfo", zvl);
	}

	@Override
	public void savePostInfo(ZValue zvl) throws Exception {
		if(zvl.getString("isModify").equals("Y")) {
			cmnDao.update("board.updatePostInfo", zvl); // 수정

			// 슬라이드 이미지 순서 변경
			if(!BaseUtil.isEmpty(zvl.getString("reOrderArr"))) {
				ObjectMapper mapper = new ObjectMapper();
				List<ZValue> reOrderList = mapper.readValue(zvl.getString("reOrderArr"), new TypeReference<ArrayList<ZValue>>(){});
				if(reOrderList != null && reOrderList.size() > 0) {
					for(ZValue z : reOrderList) {
						cmnDao.update("file.reOrderFile", z);
					}
				}
			}
		}
		else cmnDao.insert("board.insertPostInfo", zvl);  // 등록
	}

	@Override
	public void deletePostInfo(ZValue zvl) throws Exception {
		 cmnDao.update("board.deletePostInfo", zvl);
	}

}
