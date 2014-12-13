package com.zagerbone.mobileserver;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.zagerbone.mobileserver.constant.Config;

public class FileUtil {
	public static final String WORK_IMG_PATH="E:\\T5.0\\ajz\\uploadfile\\images";
	public static final String WORK_AUDIO_PATH="E:\\T5.0\\ajz\\uploadfile\\Audio";
	public static final String WORK_HEAD_PATH="E:\\T5.0\\ajz\\uploadfile\\Head";
	public static File createFile() {
		String nowTime = TimeUtil.getAbsoluteTime();
		String filePath="";
		filePath=WORK_IMG_PATH;
		File fileParent = new File(filePath);
		if (fileParent.exists() == false) {
			fileParent.mkdirs();
		}
		File file = new File(filePath + "\\" + nowTime + ".jpg");
		try {
			file.createNewFile();
			System.out.println("---FileUtil---"+file.getPath()+":"+file.getName());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return file;
	}
	public static File createFile(String selfId, int fileType) {
		String nowTime = TimeUtil.getAbsoluteTime();
		String filePath="";
		if(fileType==Config.MESSAGE_TYPE_IMG){
			filePath =WORK_IMG_PATH + selfId;
		}else{
			filePath =WORK_AUDIO_PATH + selfId;
		}
		
		File fileParent = new File(filePath);
		if (fileParent.exists() == false) {
			fileParent.mkdirs();
		}
		File file = null;
		if (fileType == Config.MESSAGE_TYPE_IMG) {
			file = new File(filePath + "\\" + nowTime + ".jpg");
		} else if (fileType == Config.MESSAGE_TYPE_AUDIO) {
			file = new File(filePath + "\\" + nowTime + ".3gp");
		}

		try {
			file.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return file;
	}
	public static File createHeadFile(int userId){
        File fileParent = new File(WORK_HEAD_PATH);
        if (fileParent.exists() == false) {
            fileParent.mkdirs();
        }
        File file = null;
        file = new File(WORK_HEAD_PATH + "\\" + userId+ ".jpg");

        try {
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return file;
	}
}
