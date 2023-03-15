package cms.file.service.impl;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cms.cmn.dao.CmnDAO;
import cms.cmn.model.ZValue;
import cms.file.dao.FileDAO;
import cms.file.service.FileService;

@Service
public class FileServiceImpl implements FileService{
	
	protected Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired 
	private CmnDAO cmnDao;
	
	@Autowired 
	private FileDAO fileDao;
	
	@Override
	public List<ZValue> selectFileItemList(int parentSeq, String fileItem, ZValue zvl) throws Exception {
		return fileDao.selectFileItemList(parentSeq, fileItem, zvl);
	}
	
	@Override
	public void insertFileInfo(MultipartHttpServletRequest request, ZValue zvl) throws Exception {
		fileDao.insertFileInfo(request, zvl);
	}
	
	@Override
	public void deleteAttachFiles(ZValue zvl) throws Exception {
		fileDao.deleteAttachFiles(zvl);
	}

	@Override
	public void updateFileInfo(MultipartHttpServletRequest request, ZValue zvl) throws Exception {
		fileDao.updateFileInfo(zvl);
	}
}
