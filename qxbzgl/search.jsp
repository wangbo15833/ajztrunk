<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>���鳵����ѯ</title>
<%
String listMode= Tools.nvl(request.getParameter("listMode")); 
System.out.println("listMode=============================================="+listMode);
%>
<%
String [] col_name 			= {"id","parameteName","configYPerValue","configYMinValue","configYValueCount"};
String [] col_headname 	= {"id","��������","Y�ᵥλ���","Y����С��λ","Y�᳤��"};
%>
</head>

<body>
<div id="man_zone">
<form  name="formHead"  action="../MainServlet_sys?listMode=<%=listMode%>" onsubmit="return testColValue();" method="post" target="_self" >
	<input type="hidden" name="fid" value="FCL00.00.07.02">
  <table width="100%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
  <tr>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	</tr>
  <th colspan="4"><font size="+1">���߲�����ѯ</font></th>
  <tr>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	</tr>
    <tr>
      <td width="33%" class="left_title_1"><span class="left-title">��������</span></td>
      <td width="15%"><label for="textfield"></label><select name="parameteName" style="width:250 ">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct parameteName,parameteName from TCParaCureStand ","")%>
		</select></td>
	  <td width="16%" class="left_title_1">������������</td>
	  <td width="36%"><select name="parameteChName" style="width:250 ">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct parameteChName,parameteChName from TCParaCureStand ","")%>
		</select></td>
    </tr>
    <tr>
      <td class="left_title_2">Y�ᵥλ���</td>
      <td><select name="configYPerValue" style="width:250 ">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct configYPerValue,configYPerValue from TCParaCureStand ","")%>
		</select></td>
            <td class="left_title_2">Y����С��λ</td>
      <td><select name="configYMinValue" style="width:250 ">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct configYMinValue,configYMinValue from TCParaCureStand ","")%>
		</select></td>
    </tr>
    <tr>
      <td class="left_title_1">Y�᳤��</td>
      <td><select name="configYValueCount" style="width:250 ">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct configYValueCount,configYValueCount from TCParaCureStand ","")%>
		</select></td>
            <td class="left_title_1">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <div align="center" style="margin-top:20px;">
  <input type="submit" name="QueryBn" id="button" value="��ѯ" />
  <input type="reset" name="button2" id="button2" value="����" />
  </div>
</form>
</div>
</body>
</html>
