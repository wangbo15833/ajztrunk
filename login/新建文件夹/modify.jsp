<%request.setCharacterEncoding("gb2312");%>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.shenghao.arch.util.DBTransUtil" %>
<HTML><HEAD><TITLE>����ѧ����Ƽ�����</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<BODY >
<p>
<p align="center">�޸����ݿ������</p>
<form action="modify.jsp" method="post">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TR><input type="hidden" name="fid" value="F00.00.00.05">
	  <td align="center">SQL��䣺<input type="text" name="strSql" size="100"> </td>
	</TR>
	
	<TR>
		<td align="center"><input type="submit" value="ȷ��"></td>	
	</TR>
  </TABLE>
</form>
<%
	String strSql =request.getParameter("strSql");
	if(strSql!=null&&!strSql.equals("")){
		strSql = new String(strSql.getBytes(),"GBK");;
	}
	if(strSql != null)
	{
		DBTransUtil transUtil = new DBTransUtil();
		try
		{
		  transUtil.addSql(strSql);
		  transUtil.executeSql();
		  out.println("It's ok!");
		}
		catch(Exception e)
		{
		  out.println(e);
		}
	}
%>
  </BODY>
  </HTML>
