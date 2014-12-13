package com.zagerbone.mobileserver;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class LogUtil {
	public static void record(String content){
		File file=new File("E:\\T5.0\\ajz\\ajzMobileLog.txt");
		if(file.exists()==false){
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		DataOutputStream dos=null;
		try {
			dos=new DataOutputStream(new FileOutputStream(file, true));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss  ");
			String time=sdf.format(new Date());
			

			System.out.println(time+" : "+content);
			dos.writeUTF(time);
			dos.writeUTF(content+"\r\n");
			dos.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(dos!=null){
				try {
					dos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				dos=null;
			}
		}
		
	}
}
