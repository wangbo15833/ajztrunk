<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%@ page import="com.zagerbone.util.Query"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>

<%@ include  file='../identification.jsp' %> 
<%
try{
String listMode= Tools.nvl(request.getParameter("listMode")); 
System.out.println("listMode==="+listMode);
String operStyle = "none";
String operStyle_cancal = "none";
if(listMode.equals("")){
	operStyle = "block";
}else if(listMode.equals("cancal")){

	operStyle_cancal = "block"; 
}
  EventResponse eventResponse = (EventResponse)request.getAttribute("result");  
  Query queryCon = (Query)eventResponse.getBody(); 
  CachedRowSet crs = null;
  if(queryCon!=null)
  {
    crs = (CachedRowSet)queryCon.getConditionBody();
  }
%>
<%
String [] col_name 	= {"id","role_name","role_view_right","role_all_right","role_bz"};
String [] col_headname 	= {"id","role_name","role_view_right","role_all_right","role_bz"};
%>
<head>
<title>��ɫ�б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet"  href="../css/001.css"  							type="text/css" >
<link rel="stylesheet"  href="../css/style1.css" type=text/css>
<link rel="stylesheet"  href="../css/calendar-win2k-cold-1.css"  	type="text/css">
<link rel="stylesheet"  href="css/common.css" type="text/css" />
<script language="JScript" type="text/javascript"  src="js/tools.js"> </script>
<script> 
function editSubmit_button(){//����ȷ����ť�Ĳ�������
	if(parent.activeIframe == 'listframe'){
		parent.openIframe("listframe");
		parent.closeIframe("editframe");
	}
}
function confirmButton(operationMode, tr_row,id_value){
	var ok = false; 
	if(parseInt(id_value)<=3){
		ok= window.confirm('������ɫ���Ͳ���ɾ����')
		return false;
	}
	if(operationMode== 'input' ){ 
		ok= window.confirm('����Ҫ��������,\n'+'��ȷ����?')	
	}	
	else if(operationMode== 'update' ){ 
		ok= window.confirm('����Ҫ�޸�����,\n'+'��ȷ����?')	
	}	
	else if(operationMode== 'delete' ){ 
		ok= window.confirm('����Ҫɾ������,\n'+'��ȷ����?')	
	}	
	if(ok==false){
		return false;
	}
	<%
		for(int jk=0; jk<col_name.length; jk++){
			%>
			if(document.getElementById("tr_"+tr_row+"_<%= col_name[jk]%>") != undefined){
				document.getElementById("tr_"+tr_row+"_<%= col_name[jk]%>").innerHTML="";
			}
			<%
		}
	%>
	document.getElementById("tr_"+tr_row+"_edit2").innerHTML="&nbsp;";
	submitframe.location = "MainServlet_sys?fid=UII00.00.00.02&id="+id_value;
	return ok;
}
</script> 
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="15">
<iframe id="submitframe" name="submitframe" width="100%" height="100" src="" frameborder="NONE" style="display:none"></iframe>
<div id="man_zone" style="padding-top:10px;"  >
<table class=table style="BORDER-COLLAPSE: collapse; " borderColor=#dedfd7 cellSpacing=0 cellPadding=3 width="100%" align=center bgColor=#ffffff  border=1>
	<tr><td  bgColor="#f0f0f0" height=25 colspan="4" align="center" class="text2"><font size="+1">��ɫ��Ϣ�б�</font></td></tr>
</table>
<div style="width:100%; overflow-x:scroll; height:400px;">
<table width='101%' border='0' cellspacing='0' cellpadding='0'>
	<tr>
		<td bgcolor='#dedfd7'>
			<table border="0" cellspacing="1" cellpadding="0"  align="center" width="100%">
			<form name="frmList" target="submitframe"></form>
				<tr style="width:101%;">
                <td align="left" style="width:60px;" class="center_title_1" nowrap="nowrap">&nbsp;&nbsp;��ɫ���</TD>
					<td align="left" width="13%" class="center_title_1" nowrap="nowrap">&nbsp;&nbsp;��ɫ����</TD>
					<td align="center"  class="center_title_1" nowrap="nowrap">��ɫ��ע</TD>
				   <%
				//ͨ����ɫ��������ж� 
				if(usertype.equals("ϵͳ����Ա")){
				%>
				   <td align="center" width="18%" class="center_title_1" nowrap="nowrap">��&nbsp;&nbsp;��</td>
				   <%
				   }%>
				</tr>
				<%
				if(crs==null||crs.size()==0)
				{
				%>
				<tr align="center"> 
					<td height="15" colspan="6"><p align="center" class="text2">δ��ѯ����ɫ</td>
				</tr>
				<%
				}
				else
				{
					int i_row = 1;
					while(crs.next())
					{
				%>
				<tr bgcolor='FFFFFF' class='font_px12' id="tr_<%=i_row%>" onMouseOver="javascript:this.style.background= '#ECF2FC';" onMouseOut="javascript:this.style.background= '#FFFFFF';">
					<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_work_unit">&nbsp;&nbsp;<%=Tools.nvl(crs.getString("id"))%></td>
					<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_username">&nbsp;&nbsp;<%=Tools.nvl(crs.getString("role_name"))%></td>
					<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_flag"><%=Tools.nvl(crs.getString("role_bz"))%></td>
					<%
					//ͨ����ɫ��������ж� 
					if(usertype.equals("ϵͳ����Ա")){//||usertype.equals("���վ��Ա")
					%>
					<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_edit2">
						<a href="#" onclick="modify('MainServlet_sys?fid=UII00.00.00.04&id=<%=crs.getString("id")%>&mode=before',<%=crs.getString("id")%>)"><font color="#053080">�޸�</font></a>
						<a href="#" onclick="modifypri('MainServlet_sys?fid=UII00.01.03.05&id=<%=crs.getString("id")%>&mode=before',<%=crs.getString("id")%>)"><font color="#053080">Ȩ��</font></a>
						<a href="#" onclick="return confirmButton('delete', <%=i_row%>, <%=crs.getString("id")%>);" target="submitframe"><font color="#ff0000" class="tdrecord" style="font-size:12px" >ɾ��</font></a>
					</td>
					<%
					}
					%>
				</tr>
					<%
						i_row++;
						}
					}
					%>
			</table>
		</td>
	</tr>
</table>
</div>
<div id='queryConTable_id' style='display:block;'>
<table width='100%' border='0' align='center' cellpadding='1' cellspacing='1' bordercolor='#bdd7d6' bgcolor='#bdd7d6'  rules='none' style="font-size:12px;">
	<tr id='sub_title'>
		<td width='55%' scope='col' align='left' id='listTitle' style="background-color:#F3F8F7;">�����б���ʾ��(ȫ����¼)</td>
		<td width='13%' align='right' nowrap>&nbsp;&nbsp;�ϼ�<%=queryCon.getTotalNum()%>��</td>
		<td width='14%' align='right' nowrap>��<%=queryCon.getCurrentPageNum()%>ҳ/��<%=queryCon.getMaxPageNum()%>ҳ&nbsp;</td>
		<td width='18%' align='right' nowrap >
		<a href='MainServlet_sys?<%=queryCon.getMinPage()%>' 			target='_self' id='queryConTable_beginPage'>��ҳ</a>&nbsp;
		<a href='MainServlet_sys?<%=queryCon.getPreviousPage()%>' target='_self' id='queryConTable_lastPage'>ǰһҳ</a>&nbsp;
		<a href='MainServlet_sys?<%=queryCon.getNextPage()%>' 		target='_self' id='queryConTable_nextPage'>��һҳ</a>&nbsp;
		<a href='MainServlet_sys?<%=queryCon.getMaxPage()%>' 			target='_self' id='queryConTable_endPage'>βҳ</a>&nbsp;
		<a title='����ҳ����س�'>ת<input type='text' name='CurPageNum' 	id='CurPageNum' value='<%=queryCon.getCurrentPageNum()%>' class='tex2' style='width:30px; height:15px; vertical-align:middle; padding:0px; font-size:12px' onKeyDown='lxl();'>ҳ</a>
		</td>
		<script> 	
		function lxl(){	
			if(event.keyCode==13){			
			var pageNum = document.getElementById('CurPageNum').value;	
				if(!judgeDigtal(pageNum)){	
					alert('�Ƿ�ҳ��!');	
					return;		
				}		
				if(pageNum < <%=queryCon.getMinPageNum()%> || pageNum><%=queryCon.getMaxPageNum()%>){		
					alert('ҳ����˷�Χ!');	
					return;		
				}	
				location ='MainServlet_sys?<%=queryCon.getQueryString()%>&page='+pageNum ; 
			}		
		}			
		</script>
	</tr>
</table>
</div>
</div>
</body>
</html>
<script language="javascript">
function  fuquan(userid,username)
{
 	var theUrl ="../user/user_role.jsp?userid="+userid+"&username="+username;
    var style="status:no;help:no;dialogWidth:40;dialogHeight:25;dialogTop:150;dialogLeft:200";
    theValue=window.showModalDialog(theUrl,null,style);
	if(theValue==null){
	  theValue="";
	}
	if(theValue.length==0||theValue=="undefined"){
	}
	else{
	  location = location;
	}
}
function refrh(){
	location.reload();
	}
function modify(s,ids)
  {
	  if(parseInt(ids)<=3){
		alert('������ɫ���Ͳ����޸ģ�');
		return;
	  }
	  window.top.indexFrame.frames['manFrame'].location = s

	}
	function modifypri(s,ids)
  {
	  
	  window.top.indexFrame.frames['manFrame'].location = s

	}
</script>
<%
}
catch (Exception exception4)
{
exception4.printStackTrace();
}

%>