<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%@ page import="com.zagerbone.util.Query"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
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
  CachedRowSet crs_cols = (CachedRowSet)request.getAttribute("crs_cols");
  if(queryCon!=null)
  {
    crs = (CachedRowSet)queryCon.getConditionBody();
  }
%>
<%
ArrayList al_colname = new ArrayList();
ArrayList al_colnamec = new ArrayList();
while(crs_cols.next()){
	al_colname.add(crs_cols.getString("colname"));	
	al_colnamec.add(crs_cols.getString("colnamec"));
}
%>
<head>
<title>ǩ����Ϣ�б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet"  href="../css/001.css"  							type="text/css" >
<link rel="stylesheet"  href="../css/style1.css" type=text/css>
<link rel="stylesheet"  href="../css/calendar-win2k-cold-1.css"  	type="text/css">
<link rel="stylesheet"  href="css/common.css" type="text/css" />
<script language="JScript" type="text/javascript"  src="js/tools.js"> </script>
<script> 
function confirmButton(operationMode, tr_row,id_value){
	var ok = false; 
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
		for(int jk=0; jk<al_colname.size(); jk++){
			%>
			if(document.getElementById("tr_"+tr_row+"_<%= al_colname.get(jk)%>") != undefined){
				document.getElementById("tr_"+tr_row+"_<%= al_colname.get(jk)%>").innerHTML="";
			}
			<%
		}
	%>
	document.getElementById("tr_"+tr_row+"_edit2").innerHTML="&nbsp;";
	submitframe.location = "MainServlet_sys?fid=UII00.09.02.02&id="+id_value;
	return ok;
}
</script> 
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="15">
<iframe id="submitframe" name="submitframe" width="100%" height="100" src="" frameborder="NONE" style="display:none"></iframe>
<div id="man_zone" style="padding-top:30px; height:1000px;">
<table width='100%' border='0' align='center' cellpadding='1' cellspacing='1' bordercolor='#bdd7d6' bgcolor='#bdd7d6'  rules='none' style="font-size:12px;">
	<tr id='sub_title'><td align="center"><font size="+1">ǩ����Ϣ�б�</font></td></tr>
</table>
<div style="width:100%; overflow-x:scroll; height:400px;">
<table width='100%' border='0' cellspacing='0' cellpadding='0'>
	<tr>
		<td bgcolor='#dedfd7'>
			<table border="0" cellspacing="1" cellpadding="0"  align="center" width="100%">
			<form name="frmList" target="submitframe"></form>
				<tr style="width:100%;">
				<%
					for(int jk=0; jk<al_colname.size(); jk++){
						if (((String)al_colname.get(jk)).equals("id")){
						%><td style="width :40px" align="left" class="center_title_1" nowrap="nowrap">&nbsp;&nbsp;<%=(String)al_colnamec.get(jk)%></TD>
						<%
						}else{
						%><td align="left" class="center_title_1" nowrap="nowrap">&nbsp;&nbsp;<%=(String)al_colnamec.get(jk)%></TD>
						<%}
					}
				%>
				<%
				//ͨ��ǩ����Ϣ��������ж� 
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
					<td height="15" colspan="<%=al_colname.size()+1%>"><p align="center" class="text2">δ��ѯ��ǩ����Ϣ</p></td>
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
					<%
					for(int jk=0; jk<al_colname.size(); jk++){
						%>
						<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_work_unit">&nbsp;&nbsp;<%=Tools.nvl(crs.getString((String)al_colname.get(jk)))%></td>
						<%
					}
					%>
					<%
					//ͨ��ǩ����Ϣ��������ж� 
					if(usertype.equals("ϵͳ����Ա")){
					%>
					<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_edit2">
						<a href="#" onclick="modify('MainServlet_sys?fid=UII00.09.02.04&id=<%=crs.getString("id")%>&mode=before')"><font color="#053080">�޸�</font></a>
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
function modify(s)
  {
	  window.top.indexFrame.frames['manFrame'].location = s

	}
</script>
<%
crs_cols.close();
crs.close();
System.out.println(queryCon.getQueryString());
}
catch (Exception exception4)
{
exception4.printStackTrace();
}

%>