<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.zagerbone.util.*"%>
<%--@ page import="com.shenghao.arch.util.*"--%>
<%@ include  file='../identification.jsp' %> 
<%@ page import="sun.jdbc.rowset.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../css/common.css" type="text/css" />
<title>Ͷ�������ѯ</title>

<%
String listMode= Tools.nvl(request.getParameter("listMode")); 
System.out.println("listMode=============================================="+listMode);

%>


</head>
<body>
<div id="man_zone">
<form  name="formHead"  action="../MainServlet_sys?fid=F00.00.00.02&listMode=<%=listMode%>" onsubmit="return testColValue();" method="post" target="_self" >
	<!--<input type="hidden" name="fid" value="F00.00.00.02">-->
  <table width="100%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
  <tr>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	</tr>
    <th colspan="4"><font size="+1">Ͷ�������</font></th>
    <tr>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	</tr>
    <tr> 
    <td align="right" class="left_title_1">Ͷ�������</td>
    <td id="td_work_unit">
        <select name="work_unit" style="width:150px">
					<option value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select work_unit,work_unit from userinfo_tgy group by work_unit","")%>
				</select>
    </td>
    <td align="right" class="left_title_1">Ͷ�������</td>
    <td>
        <select name="usertype" style="width:150px;">
        <option value="">-=��ѡ��=-</option>
        <option value="Ͷ�����">Ͷ�����</option>
        <option value="Ͷ�����Ա">Ͷ�����Ա</option>
        <option value="Ͷ�����Ա">Ͷ�����Ա</option>
        <option value="Ͷ�����">Ͷ�����</option>
        </select>
    </td>
    </tr>
  
  <tr>
      <td width="33%" class="left_title_1"><span class="left-title">�û���</span></td>
      <td width="14%"><label for="textfield"></label><input type="text" name="username" id="username"  value=""/></td>
			<td width="18%" class="left_title_1">Ͷ�����</td>
      <td width="35%"><input type="text" name="realname" id="realname" /></td>
    </tr>	
	<!--	
    <tr>
      <td class="left_title_1"></td>
      <td></td>
            <td class="left_title_1"></td>
      <td></td>
    </tr>
    <tr>
      <td class="left_title_2"></td>
      <td></td>
            <td class="left_title_2"></td>
      <td></td>
    </tr>
    <tr>
      <td class="left_title_2"></td>
      <td></td>
            <td class="left_title_1"></td>
      <td></td>
    </tr>
    <tr>
      <td class="left_title_1"></td>
      <td></td>
            <td class="left_title_2"></td>
      <td></td>
    </tr>
    <tr>
      <td class="left_title_2"></td>
      <td></td>
           <td class="left_title_1"></td>
      <td></td>
    </tr>
    <tr >
      <td class="left_title_2"></td>
      <td></td>
      <td class="left_title_2"></td>
      <td></td>
      
    </tr>-->
  </table>
  <div align="center" style="margin-top:20px;">
  <input type="submit" name="QueryBn" id="button" value="��ѯ" />
  <input type="reset" name="button2" id="button2" value="����" />
  </div>
</form>
</div>
</body>
</html>
<%
if(usertype.equals("Ͷ�����Ա")){//Ͷ�����Ͷ�����Ͷ�����Ͷ�����//||usertype.equals("Ͷ�����Ա")
	;
}
else{
	%>
	<script>
	
	document.getElementById('td_work_unit').innerHTML='<input type="text" name="work_unit" id="work_unit"  readOnly/>';
	document.getElementById('work_unit').value ='<%=work_unit%>'; 
	</script>	
	<%
}
%>

