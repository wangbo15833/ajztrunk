<%@ page import="com.shenghao.arch.event.*"%>
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%@ page import="java.util.HashMap"%>
<%@ include  file='../identification.jsp' %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>��ؼ�¼��ѯ</title>
<style>
th{font-size:14px; font-weight:bold; margin-bottom:20px;}
</style>
<%
String listMode= Tools.nvl(request.getParameter("listMode")); 
System.out.println("listMode=============================================="+listMode);
%>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<div id="man_zone">
<form  name="formHead"  action="../MainServlet_sys?listMode=<%=listMode%>" onsubmit="return testColValue();" method="post" target="_self" >
	<input type="hidden" name="fid" value="FCL00.00.01.22">
  <table width="100%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
	   <td width="26%">&nbsp;</td>
	   <td>&nbsp;</td>
	   <td width="15%">&nbsp;</td>
	   <td width="37%">&nbsp;</td>
	</tr>
    <th colspan="4"><font size="+1">������ؼ�¼��ѯ</font></th>
			
	<tr>
	<td class="left_title_1">���Ա��</td>
		<td width="22%"><select name="tp_testnum" style="width:250 ">
					<option value="">&nbsp;=&nbsp;��&nbsp;&nbsp;ѡ&nbsp;&nbsp;��&nbsp;&nbsp;=&nbsp;&nbsp;</option>
					<%=com.zagerbone.util.Tools.popListWithSelect("select distinct tp_testnum,tp_testnum from TCfaultinfo","")%>
		</select></td>
	<td class="left_title_1"></td>
	<td></td>
	</tr>


	<tr>
		<td class="left_title_1">������λ</td>
		<td id="td_tp_carproduction"><select name="tp_carproduction" style="width:152px">
			<option value="">&nbsp;=&nbsp;��&nbsp;&nbsp;ѡ&nbsp;&nbsp;��&nbsp;&nbsp;=&nbsp;&nbsp;</option>
			<%=com.zagerbone.util.Tools.popListWithSelect("select work_unit,work_unit from userinfo_tgy group by work_unit","")%>
			</select>
		</td>
		<td class="left_title_1"><span class="left-title">��������</span></td>
		<td><select name="tp_carname" style="width:250 ">
			<option value="">&nbsp;=&nbsp;��&nbsp;&nbsp;ѡ&nbsp;&nbsp;��&nbsp;&nbsp;=&nbsp;&nbsp;</option>
			<%=com.zagerbone.util.Tools.popListWithSelect("select tp_carname,tp_carname from TCfaultinfo group by tp_carname","")%>
			</select>
		</td>
	</tr>

	  <tr>
		<td class="left_title_1">�������</td>
		<td><select name="tp_carnum" style="width:250 ">
			<option value="">&nbsp;=&nbsp;��&nbsp;&nbsp;ѡ&nbsp;&nbsp;��&nbsp;&nbsp;=&nbsp;&nbsp;</option>
			<%=com.zagerbone.util.Tools.popListWithSelect("select distinct tp_carnum,tp_carnum from TCfaultinfo order by tp_carnum desc","")%>
			</select></td>
		<td class="left_title_1">�����������</td>
		<td><select name="tp_testtoolnum" style="width:250 ">
			<option value="">&nbsp;=&nbsp;��&nbsp;&nbsp;ѡ&nbsp;&nbsp;��&nbsp;&nbsp;=&nbsp;&nbsp;</option>
			<%=com.zagerbone.util.Tools.popListWithSelect("select distinct tp_testtoolnum,tp_testtoolnum from TCfaultinfo order by tp_testtoolnum desc","")%>
			</select></td>
	  </tr>
      <!--<tr>
        <td class="left_title_2">����ʱ��</td>
        <td><input type="text" name="tp_testtime" id="tp_testtime" /></td>
        <td class="left_title_2">���Գ����ո�ʱ��</td>
        <td><input type="text" name="tp_harvesthour" id="tp_harvesthour"     value=""  /></td>
      </tr>
      <tr>
        <td class="left_title_1">���Թ�����Ϣ</td>
        <td><input type="text" name="tp_faultinfo" id="tp_faultinfo" value="" /></td>
        <td class="left_title_1">���Գ���״̬��Ϣ</td>
        <td><input type="text" name="tp_stateinfo" id="tp_stateinfo"  value=""/></td>
      </tr>
      <tr>
        <td class="left_title_2">���Գ�������</td>
        <td><input type="text" name="tp_car_longitude" id="tp_car_longitude" value="" /></td>
        <td class="left_title_2">���Գ���γ��</td>
        <td><input type="text" name="tp_car_latitude" id="tp_car_latitude"  /></td>
      </tr>
      <tr>
        <td class="left_title_1">���Գ������ȷ���</td>
        <td><input type="text" name="tp_longitude_dir" id="tp_longitude_dir" /></td>
        <td class="left_title_1">���Գ���γ�ȷ���</td>
        <td><input type="text" name="tp_latitude_dir" id="tp_latitude_dir" /></td>
      </tr>
      <tr>
        <td class="left_title_2" nowrap="nowrap">���Գ���������ת��</td>
        <td><input type="text" name="tp_car_eginespeed" id="tp_car_eginespeed" /></td>
        <td class="left_title_2">���Գ���ȼ��Һλ</td>
        <td><input type="text" name="tp_car_oillevel" id="tp_car_oillevel" /></td>
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
if(usertype.equals("ϵͳ����Ա")){//||usertype.equals("���վ��Ա")
	;
}
else{
	%>
	<script>
	
	document.getElementById('td_tp_carproduction').innerHTML='<input type="text" name="tp_carproduction" id="tp_carproduction"  readOnly />';
	document.getElementById('tp_carproduction').value ='<%=work_unit%>'; 
	</script>	
	<%
}
%>