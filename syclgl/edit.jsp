<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType = "text/html; charset=GBK" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%
  EventResponse eventResponse = (EventResponse)request.getAttribute("result"); 
	Query queryCon = null;
	CachedRowSet crs = null;
	if(eventResponse != null){
  queryCon = (Query)eventResponse.getBody();  
  crs = (CachedRowSet)queryCon.getConditionBody();
	}
%>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet"  href="../css/001.css"  							type="text/css" >
<link rel="stylesheet"  href="../css/style1.css" type=text/css>
<link rel="stylesheet"  href="css/calendar-win2k-cold-1.css"  	type="text/css">
<link rel="stylesheet"  href="css/common.css" type="text/css" />
<script language="JScript" type="text/javascript"  src="js/calendar.js"> </script>
<script language="JScript" type="text/javascript"  src="js/calendar-setup.js"> </script>
<script language="JScript" type="text/javascript"  src="js/calendar-zh.js"> </script>
<script>
function editSubmit_button(){//����ȷ����ť�Ĳ�������
	if(parent.activeIframe == 'listframe'){
		parent.openIframe("listframe");
		parent.closeIframe("editframe");
	}
}
</script>  
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<div id="man_zone">
<div id="nav" style="display:none">
    <ul>
      <li id="man_nav_1" onclick="location = 'syclgl/search.jsp'"  class="bg_image">���ݲ�ѯ</li>
			<li id="man_nav_1" onclick="location = 'syclgl/add.jsp'" class="bg_image">��������</li>
      <li id="man_nav_2" onclick="list_sub_nav(id,'�����б�')"  class="bg_image"><font style="color:#aaaaaa">�����б�</font></li>
      <li id="man_nav_3" onclick="														"   class="bg_image_onclick">���ݱ༭</li>
      <li id="man_nav_4" onclick="alert('������鿴ר�ŵ�ҳ��!');"  class="bg_image">���߰���</li>     
  </ul>
</div>
 <%
String [] col_name 		= {"id","tp_carname","tp_cartype","tp_carnum","tp_carproduction","tp_carouttime","tp_carcheckdate","tp_carcheckmeb","tp_carcheckmebphone","tp_testnum","tp_testtooltypenum","Tyqnum","tp_teststarttime","tp_testtotaltime","tp_operatemeb","tp_testmebphone","dataCreateTime","dataOperman"};
String [] col_headname 	= {"id","��������","�����ͺ�","�������","�������쵥λ","tp_carouttime","tp_carcheckdate","tp_carcheckmeb","tp_carcheckmebphone","tp_testnum","tp_testtooltypenum","Tyqnum","tp_teststarttime","tp_testtotaltime","tp_operatemeb","tp_testmebphone","dataCreateTime","dataOperman"};
%>
  <%
	crs.next();
%>
  <form  name="formHead"  action="MainServlet_sys" onsubmit="return testColValue();" method="post" target="submitframe">
    <input type="hidden" name="fid" value="FCL00.00.00.04" />
    <table width="100%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
	<tr>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	   <td>&nbsp;</td>
	</tr>
      <th colspan="4"><font size="+1">���鳵�����ñ��޸�</font></th>
      <tr style="display:none;">
        <td width="17%" class="left_title_1"><span class="left-title">id</span></td>
        <td width="30%"><label for="tp_carname"></label>
            <input type="text" name="id" id="id"  value="<%= Tools.nvl(crs.getString("id"))%>"/></td>
        <td width="17%" class="left_title_1"></td>
        <td width="36%"></td>
      </tr>
      <tr>
        <td colspan="4" align="right" ><span class="left-title" style=" color:red">�����ţ�
              <input type="text" name="tp_testnum" id="tp_testnum"  disabled="disabled" readonly="true"  value="<%= Tools.nvl(crs.getString("tp_testnum"))%>" style="border:0px blue solid; border-bottom:1px blue;"/>
        </span></td>
      </tr>
      <tr>
        <td width="17%" class="left_title_1"><span class="left-title">��������</span></td>
        <td width="30%"><label for="tp_carname"></label>
            <input type="text" name="tp_carname" id="tp_carname"  value="<%= Tools.nvl(crs.getString("tp_carname"))%>"/></td>
        <td width="17%" class="left_title_1" >������ʼʱ��</td>
        <td width="36%"><input type="text" name="tp_teststarttime" id="tp_teststarttime" disabled="disabled" value="<%= Tools.nvl(crs.getString("tp_teststarttime"))%>" /></td>
      </tr>
      <tr>
        <td class="left_title_2">�����ͺ�</td>
        <td><input type="text" name="tp_cartype" id="tp_cartype"  value="<%= Tools.nvl(crs.getString("tp_cartype"))%>"/></td>
        <td class="left_title_2">�������ͺ�</td>
        <td><input type="text" name="tp_testtooltypenum" id="tp_testtooltypenum" disabled="disabled" readonly="true" value="<%= Tools.nvl(crs.getString("tp_testtooltypenum"))%>" /></td>
      </tr>
      <tr>
        <td class="left_title_1">�������</td>
        <td><input type="text" name="tp_carnum" id="tp_carnum" readonly="true" disabled="disabled" value="<%= Tools.nvl(crs.getString("tp_carnum"))%>" /></td>
        <td class="left_title_1">�����Ǳ��</td>
        <td><input type="text" name="tp_testtoolnum" id="tp_testtoolnum" readonly="true" disabled="disabled" value="<%= Tools.nvl(crs.getString("tp_testtoolnum"))%>"/></td>
      </tr>
      <tr>
        <td class="left_title_2">������λ</td>
        <td><input type="text" name="tp_carproduction" id="tp_carproduction"  disabled="disabled" value="<%= Tools.nvl(crs.getString("tp_carproduction"))%>" /></td>
        <td class="left_title_2">�����ʼ�ո�ʱ��</td>
        <td><input type="text" name="Tharvesttime" id="Tharvesttime" value="<%= Tools.nvl(crs.getString("Tharvesttime"))%>"  /></td>
      </tr>
      <tr>
        <td class="left_title_1">��������</td>
        <td><input type="text" name="tp_carouttime" id="tp_carouttime"   readonly="true" value="<%= Tools.nvl(crs.getString("tp_carouttime"))%>" /></td>
        <td class="left_title_1">������ʱ����Сʱ��</td>
        <td><input type="text" name="tp_testtotaltime" id="tp_testtotaltime"  value="<%= Tools.nvl(crs.getString("tp_testtotaltime"))%>"/></td>
      </tr>
      <tr>
        <td class="left_title_2">�������</td>
        <td><input type="text" name="tp_carcheckdate" id="tp_carcheckdate"  readonly="true" value="<%= Tools.nvl(crs.getString("tp_carcheckdate"))%>" /></td>
        <td class="left_title_2">��ʽ��ؽ���ʱ��</td>
        <td><input type="text" name="TCjk_endTime" id="TCjk_endTime"  readonly="true"   value="<%= Tools.nvl(crs.getString("TCjk_endTime"))%>"/></td>
      </tr>
      <tr>
        <td class="left_title_1">���������鸺����</td>
        <td><input type="text" name="tp_carcheckmeb" id="tp_carcheckmeb" value="<%= Tools.nvl(crs.getString("tp_carcheckmeb"))%>"/></td>
        <td class="left_title_1">����վ���鸺����</td>
        <td><input type="text" name="tp_testmeb" id="tp_testmeb" value="<%= Tools.nvl(crs.getString("tp_testmeb"))%>"/></td>
      </tr>
      <tr>
        <td class="left_title_2" nowrap="nowrap">�������鸺������ϵ�绰(�ֻ�)</td>
        <td><input type="text" name="tp_carcheckmebphone" id="tp_carcheckmebphone" value="<%= Tools.nvl(crs.getString("tp_carcheckmebphone"))%>"/></td>
        <td class="left_title_2">����վ���鸺������ϵ�绰(�ֻ�)</td>
        <td><input type="text" name="tp_testmebphone" id="tp_testmebphone" value="<%= Tools.nvl(crs.getString("tp_testmebphone"))%>" /></td>
      </tr>
      <tr style="display:none">
        <td class="left_title_2">���״̬</td>
        <td><input type="text" name="CMonitorStatus" id="CMonitorStatus"  readonly="true" value="<%= Tools.nvl(crs.getString("CMonitorStatus"))%>"/></td>
        <td class="left_title_2">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <div align="center" style="margin-top:5px;">
      <input type="submit" name="button" id="button" value="�ύ" />
      <input type="reset" name="button2" id="button2" value="����" />
	  <input type="submit" name="button" id="button" value="����"   onclick="history.go(-1);"/>
    </div>
  </form>
  <iframe id='submitframe' name='submitframe' width='100%' height='200' src='' frameborder='NONE' style='display:none'></iframe>
</div>
</body>
</html>