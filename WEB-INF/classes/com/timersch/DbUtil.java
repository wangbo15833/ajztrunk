package com.timersch;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import sun.jdbc.rowset.CachedRowSet;


/**
 * ������ת�����������ݿ�Ĳ���
 * @author ������
 * ����mssql���ȵ�������JAR�� msbase.jar mssqlserver.jar msutil.jar 
 */
public class DbUtil {
	private static Logger log;
	Connection con=null;
	Statement sql=null;
	ResultSet rs=null;
	final String driver="com.microsoft.jdbc.sqlserver.SQLServerDriver";
 	final String uri="jdbc:sqlserver://localhost:1433;DatabaseName=ajz";
 	/**
 	 * �ڹ��췽���н������ݿ�����
 	 */
 	public DbUtil(){
 		try {
			Class.forName(driver);
			con=DriverManager.getConnection(uri, "weixun", "aJz456$%^");
			sql=con.createStatement();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
 	}
 	
 	/**
 	 * �ò�ѯ����selectȡ��cachedrowset
 	 * @param String
 	 * @return CachedRowSet 
 	 */
 	public CachedRowSet getResultBySelect(String s)
 		{
 			CachedRowSet cachedrowset=null;
 			try
 			{	
 				cachedrowset=new CachedRowSet();
	 			System.out.println("***===current sql is==="+s);
	 			rs = sql.executeQuery(s);
	 			cachedrowset.populate(rs);
	 			System.out.println("the crs.size() is :"+cachedrowset.size());
 			}
 			catch (SQLException sqle) { 
 				System.out.println((new StringBuilder()).append("getResultBySelect���ִ��� : ").append(sqle.getMessage()).toString());
 			}
 			catch (Exception ex) {
 					ex.printStackTrace();
 			}
 				return cachedrowset;

 		}
 	/**
 	 * ִ��sql��� �� insert delete update
 	 * @param String
 	 * @return boolean
 	 */
 	public boolean executeSql(String s)
 		{
 			boolean flag = false;
 			try
 			{
 				System.out.println("***===current sql is==="+s);
 				sql.executeUpdate(s);
 				flag = true;
 			}catch (SQLException dbexception)
 			{
 				//log.error((new StringBuilder()).append("executeSql���ִ���").append(dbexception.getMessage()).toString());
 				System.out.println(new StringBuilder().append("executeSql���ִ���").append( dbexception.getMessage()).toString());
 			}catch (Exception exception) {
 				exception.printStackTrace();
 			}
 			return flag;
 		}
 //////////////////////////////////////////////////////
 
  	public void close(){
 		try {
 			if(con!=null)
 				con.close();
 			if(sql!=null)
 				sql.close();
 			if(rs!=null)
 				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
 	}
 }