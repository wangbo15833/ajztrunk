<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.zagerbone.user.User"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.*"%>
<%@ include  file='../identification.jsp' %> 
<head>
<title>������ɫ��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/index.css" type="text/css">
<link href="../css/login/style.css" type=text/css rel=stylesheet>
<link href="../css/calendar-win2k-cold-1.css" rel=stylesheet type=text/css>

<link rel="stylesheet"  href="../css/common.css" type="text/css" />
<link rel="stylesheet"  href="css/001.css" type="text/css" >
<link rel="stylesheet"  href="css/style1.css" type=text/css>
<link rel="stylesheet"  href="css/calendar-win2k-cold-1.css" type="text/css">


<script language="JavaScript" src="../share/js/utils.js"></script>
<script language="JScript" type="text/javascript"  src="../js/calendar.js"> </script>
<script language="JScript" type="text/javascript"  src="../js/calendar-setup.js"> </script>
<script language="JScript" type="text/javascript"  src="../js/calendar-zh.js"> </script>
</head>
<%
	User user = new User();
	user = (User)session.getAttribute("curUser");
	String titleName = "������ɫ";
%>

<%
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
%><script type="text/javascript">
var xmlhttp;
function loadXMLDoc(url,cfunc)
{
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=cfunc;
xmlhttp.open("post",url,true);
xmlhttp.send();
}
function myFunction(s)
{
	//alert("onblur"+s);
	if(s=='')
	{
		return false;
	}
	
	loadXMLDoc("../ajax/check.jsp?_="+Math.round(Math.random()*100000)+"&mode=rolename&name="+s,function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			var str = (xmlhttp.responseText);
			str=(str).replace(/[\r|\n]/gm,'');
			if (str.indexOf( "repeat")>-1)
			{
				alert("���Ѵ��ڵĽ�ɫ����������������ɫ��");
				document.getElementById("button1").disabled="disabled";
			}else
			{
				document.getElementById("button1").disabled="";
			}
		}
	  });
}
</script>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0"  >
<div id="man_zone">
<form name="formHead" action="../MainServlet_sys" target="sframe" onKeyDown="if(event.keyCode==13)event.keyCode=9" style="padding-top:5px;">
    <input type="hidden" name="fid" value="UII00.00.00.03">
	<TABLE class=table style="BORDER-COLLAPSE: collapse" borderColor=#dedfd7 cellSpacing=0 cellPadding=3 width="100%" align=center bgColor=#ffffff border=1>
	<tr>
		<td bgColor=#f0f0f0 height=25 colspan="4" align="center" class="text2"><font size="+1"><%=titleName%></font></td>
	</tr>
	
   <tr>
		<td height="20"width="15%" align="right" nowrap="nowrap"class="text2">&nbsp;&nbsp;��ɫ����</td>
		<td >
		<input type="text" name="role_name" size="25" onblur="myFunction(this.value)"  value="" />
		</td> 
		
	</tr>
  <tr> 
    <td height="20" align="right" class="text2" >��ע��</td><td ><textarea name="role_bz" cols="81" rows="8"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
  	<td align="center" colspan="4">
		<input type="button" name="button" id="button1" value="ȷ ��" style="width:80;height:23 " disabled="disabled" onClick="doSave();">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" name="button" value="�� ��" style="width:80;height:23 ">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="button" value="�� ��" style="width:80;height:23 " onClick="javascript:history.go(-1);">
	</td>
  </tr>
</table>
</form>

</div>
</body>
</html>
<iframe id="submitframe" name="submitframe" width="100%" height="100" src="" frameborder="NONE" style="display:none"></iframe>
</iframe> 
<script language=javascript>
  function doSave()
  {
    formHead.target = "submitframe";
	formHead.submit();
  }
  function doClose()
  {
  	parent.returnValue="";
    this.close();
  }
</script>
<%
if(usertype.equals("ϵͳ����Ա")){//���վ��ԱҲֻ�ܲ鿴����λ������//||usertype.equals("���վ��Ա")
	;
}
else{
	%>
	<script>
	document.getElementById('td_work_unit').innerHTML='<input type="text" name="work_unit" id="work_unit"  readOnly />';
	document.getElementById('work_unit').value ='<%=work_unit%>'; 
	</script>	
	<%
}
%>


