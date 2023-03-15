package cms.file.dao;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cms.cmn.dao.CmnSupportDAO;
import cms.cmn.model.ZValue;
import cms.cmn.util.BaseUtil;
import egovframework.com.cmm.service.EgovProperties;

@Repository
public class FileDAO extends CmnSupportDAO {

	protected Logger logger = LogManager.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<ZValue> selectFileItemList(int parentSeq, String fileItem, ZValue zvl) throws Exception {
		zvl.put("parentSeq", parentSeq);
		zvl.put("fileItem", fileItem);
		return (List<ZValue>) selectList("file.selectFileList", zvl);
	}

	@SuppressWarnings("unchecked")
	public void insertFileInfo(MultipartHttpServletRequest request, ZValue zvl) throws Exception {
		/*
		 * 1. 파일 업로드 시 submit 할 때 realFilePath, parentSeq 넘겨주기
		 * 2. 파일 등록 시 쌓이는 파일이 아니라 수정되어야하는 파일이라면 input file change event에서 해당 fileSeq를 deleteFileArr에 담기
		 * */

		String isModify = zvl.getString("isModify");
		String realFilePath = zvl.getString("realFilePath");
		String uploadPath = EgovProperties.getProperty(realFilePath);

		String deleteFileArr = zvl.getString("deleteFileArr");
		 if(!BaseUtil.isEmpty(deleteFileArr)  && isModify.equals("Y")) {
			if(!BaseUtil.isEmpty(deleteFileArr)) {

				JSONArray deleteFileJsonArr = new JSONArray(deleteFileArr);
				List<Object> deleteFileSeqList = deleteFileJsonArr.toList();

	         	if(deleteFileSeqList.size() > 0) {
	         		zvl.put("deleteFileSeqList", deleteFileSeqList);
	         		List<ZValue> delFileInfoList = (List<ZValue>) selectList("file.selectDeleteFileList", zvl);
	         		for(ZValue z : delFileInfoList){
	    				deleteRealFile(EgovProperties.getProperty(realFilePath), z.getString("SYSTEM_FILE_NM"));
	    				zvl.put("fileSeq", z.get("FILE_SEQ"));
	    				delete("file.deleteFileInfo", zvl);
	    			}
	         	}
			}
     	}

    	Iterator<String> iterator = request.getFileNames();

		File file = File.createTempFile("temp_image-", ".jpg");

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		File Folder = new File(uploadPath);
		if (!Folder.exists()) Folder.mkdir();

		while(iterator.hasNext()){
			multipartFile = request.getFile(iterator.next());
			if(!multipartFile.isEmpty()){

        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        		storedFileName = UUID.randomUUID().toString() + "." + originalFileExtension;

        		file = new File(uploadPath + storedFileName);
        		multipartFile.transferTo(file);

        		zvl.put("parentGb", realFilePath);
        		zvl.put("fileNm", originalFileName);
        		zvl.put("systemFileNm", storedFileName);
        		zvl.put("filePath", realFilePath.toLowerCase());
        		zvl.put("fileType", originalFileExtension);
        		zvl.put("fileSize", file.length());

        		String fileIptNm = multipartFile.getName();
        		if(fileIptNm.contains("_")) {
        			zvl.put("fileItem", fileIptNm.split("_")[0]);
        			zvl.put("fileOrder", fileIptNm.split("_")[1]);
        		}
        		else if (fileIptNm.contains("[") && fileIptNm.contains("]")) {
        			fileIptNm = fileIptNm.replaceAll("\\[\\d+\\]", "");
        			zvl.put("fileItem", fileIptNm);
        		}
        		else {
        			zvl.put("fileItem", fileIptNm);
        		}

        		 insert("file.insertFileInfo", zvl);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public void deleteAttachFiles(ZValue zvl) throws Exception {
		String realFilePath = zvl.getString("realFilePath");
		zvl.put("parentGb", realFilePath);

		List<ZValue> delFileInfoList = (List<ZValue>) selectList("file.selectFileList", zvl);
 		for(ZValue z : delFileInfoList){
			deleteRealFile(EgovProperties.getProperty(realFilePath), z.getString("SYSTEM_FILE_NM"));
			zvl.put("fileSeq", z.get("FILE_SEQ"));
			delete("file.deleteFileInfo", zvl);
		}
	}

	public void deleteRealFile(String file_path, String system_fileName){
		File file = new File(file_path, system_fileName);
		if( file.exists() ){
			if(file.delete()) logger.debug("파일삭제 성공");
			else logger.debug("파일삭제 실패");
		}
		else logger.debug("파일이 존재하지 않습니다.");
	}
	
	public void updateFileInfo(ZValue zvl) throws Exception {
		
		String fileIptNm = zvl.getString("fileName");
		if(fileIptNm.contains("_")) {
			zvl.put("fileItem", fileIptNm.split("_")[0]);
			zvl.put("fileOrder", fileIptNm.split("_")[1]);
		}else {
			zvl.put("fileItem", fileIptNm);
			zvl.put("fileOrder", 1);
		}
		update("file.updateFileInfo", zvl);
	}
}
