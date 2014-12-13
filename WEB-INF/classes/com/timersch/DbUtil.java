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
 * 这是中转服务器对数据库的操作
 * @author 李振南
 * 连接mssql首先导入三个JAR包 msbase.jar mssqlserver.jar msutil.jar 
 */
public class DbUtil {
	private static Logger log;
	Connection con=null;
	Statement sql=null;
	ResultSet rs=null;
	final String driver="com.microsoft.jdbc.sqlserver.SQLServerDriver";
 	final String uri="jdbc:sqlserver://localhost:1433;DatabaseName=ajz";
 	/**
 	 * 在构造方法中建立数据库连接
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
 	 * 用查询方法select取得cachedrowset
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
 				System.out.println((new StringBuilder()).append("getResultBySelect出现错误 : ").append(sqle.getMessage()).toString());
 			}
 			catch (Exception ex) {
 					ex.printStackTrace();
 			}
 				return cachedrowset;

 		}
 	/**
 	 * 执行sql语句 如 insert delete update
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
 				//log.error((new StringBuilder()).append("executeSql出现错误：").append(dbexception.getMessage()).toString());
 				System.out.println(new StringBuilder().append("executeSql出现错误：").append( dbexception.getMessage()).toString());
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