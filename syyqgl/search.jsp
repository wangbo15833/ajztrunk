<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>����������ѯ</title>
<%
String listMode= Tools.nvl(request.getParameter("listMode")); 
System.out.println("listMode=============================================="+listMode);
String titleName= Tools.nvl(request.getParameter("titleName")); 
System.out.println("titleName=============================================="+titleName);
if(titleName.equals("")){
	titleName = "����������ѯ";
}
%>
</head>
<body>
<div id="man_zone">
<form  name="formHead"  action="../MainServlet_sys?listMode=<%=listMode%>" onsubmit="return testColValue();" method="post" target="_self" >
	<input type="hidden" name="fid" value="FCL00.00.08.02">
  <table width="100%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
   <tr>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	</tr>
  <th colspan="4"><font size="+1"><%=titleName%></font></th>
  <tr>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	</tr>
    <tr>
      <td width="34%" class="left_title_1"><span class="left-title">�����������</span></td>
      <td width="13%"><label for="textfield"></label>
        <select name="tp_testtoolnum" style="width:250 ">
          <option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
          <%=com.zagerbone.util.Tools.popListWithSelect("select distinct tp_testtoolnum,tp_testtoolnum from TCSyyq order by tp_testtoolnum desc","")%>
        </select></td>
      <td width="13%" class="left_title_1">���������ͺ�</td>
      <td width="40%"><label for="textfield"></label>
	  <select name="tp_testtooltypenum" style="width:250 ">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct tp_testtooltypenum,tp_testtooltypenum from TCSyyq","")%>
		</select></td>
    </tr>
    <tr>
      <td class="left_title_2">��Ӧ���Ժ�</td>
      <td><label for="textfield"></label>
	  <select name="tp_testnum" style="width:250 ">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct tp_testnum,tp_testnum from TCSyyq order by tp_testnum desc","")%>
		</select></td>
            <td class="left_title_2">���Կ�ʼʱ��</td>
      <td><input type="text" name="tp_teststarttime" id="tp_teststarttime" /></td>
    </tr>
    <tr>
      <td colspan="4" align="center" class="left_title_3"><font color="blue">*�޲�ѯ��������ʾ�������ݡ�</font></td>
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
