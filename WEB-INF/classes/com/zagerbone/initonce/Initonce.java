package com.zagerbone.initonce;

import com.shenghao.arch.baseobject.BasicObject;
import com.shenghao.arch.util.DBTransUtil;
import com.zagerbone.util.DBTrans;
import com.zagerbone.initonce.myT;
import java.util.HashMap;
import org.apache.log4j.Logger;
import java.lang.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.zagerbone.syslog.*;
import com.zagerbone.mobileserver.*;//�ֻ�������
import com.zagerbone.exception.DBException;
import java.sql.*;
import java.util.*;
import javax.sql.DataSource;
import org.apache.log4j.Logger;

public class Initonce extends HttpServlet
{
	private static Thread mobileServer ;
	private static Thread mobileServerShuter ;
	public void init(ServletConfig servletconfig)
	{
		mobileServer = new AjzMobileServer();
		mobileServerShuter=new AjzMobileServerShutDown();
		
		DBTrans dbtrans = new DBTrans();
		try
		{
			SyslogDAO syslogdao = SyslogDAOFactory.getDAO();
			HashMap hp_op = new HashMap();
			hp_op.put("event","����");
			hp_op.put("tabname","--");
			hp_op.put("cent","--");
			syslogdao.logact2(hp_op,dbtrans);
			System.out.println("===Initonce is start!===");
			myT.activeT();
			System.out.println("=========================================================================");
			System.out.println("========================                         ========================");
			System.out.println("========================      �ֻ�����������     ========================");
			System.out.println("========================                         ========================");
			System.out.println("=========================================================================");
			
			mobileServer.start();
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
	}
	public void destroy(){
		try{
			try{     
				Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver") ;    
			}catch(ClassNotFoundException e){
				System.out.println("�Ҳ������������� ����������ʧ�ܣ�"); 
				e.printStackTrace();
			}
			
			 String url = "jdbc:sqlserver://localhost:1433;DatabaseName=ajz";
			 String username = "weixun";
			 String password = "aJz456$%^";
			 Connection con = null;
			try{
				con =DriverManager.getConnection(url , username , password );
			 }catch(SQLException se){
				System.out.println("���ݿ�����ʧ�ܣ�"); 
				se.printStackTrace();
			 }
			 
			 Statement stmt = con.createStatement();
			int rows = stmt.executeUpdate("insert into syslog(event,e_datetime,e_operator,e_account,e_work_unit,tabname,cent) values('�ر�',getdate(),'ϵͳ','--','--','--','--')");
			System.out.println("insert into syslog(event,e_datetime,e_operator,e_account,e_work_unit,tabname,cent) values('�ر�',getdate(),'ϵͳ','--','--','--','--')");

		 if(stmt != null){ 
			try{
				stmt.close();
			}catch(SQLException e){ 
				e.printStackTrace();
			}
		}
		 if(con != null){ 
			try{
			con.close();
			}catch(SQLException e){   
			   e.printStackTrace();
			}
		}
			myT.destroy();
		}catch (Exception exception){
			exception.printStackTrace();
		}
		System.out.println("==================================================================");
		System.out.println("=================                         ========================");
		System.out.println("=================      �ֻ��������ر�     ========================");
		System.out.println("=================                         ========================");
		System.out.println("==================================================================");
		
		((AjzMobileServer)mobileServer).closeSocketServer();
		//mobileServerShuter.start();
		mobileServer.stop();
		//mobileServerShuter.stop();
		
	}

}

