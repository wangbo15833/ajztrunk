<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%@ page import="com.zagerbone.util.Query"%>
<%@ page import="com.zagerbone.util.Tools"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ include  file='../identification.jsp' %> 
<%
try{
//System.out.println("hp_user=***="+hp_user.toString());
String listMode= Tools.nvl(request.getParameter("listMode")); 
//System.out.println("listMode==="+listMode);
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
  HashMap hp_pri = (HashMap)request.getAttribute("hp_pri");
  String mypri = (String)(hp_pri.get("mypri"));
  if(queryCon!=null)
  {
    crs = (CachedRowSet)queryCon.getConditionBody();
  }
%>
<%
	String titleName = "��λ��Ϣ�б�";
	ArrayList al_colname = new ArrayList();
	ArrayList al_colnamec = new ArrayList();
	ArrayList al_colomit = new ArrayList();
	while(crs_cols.next()){
		if(Tools.nvl(crs_cols.getString("list_disp")).equals("1")){	
			al_colname.add(crs_cols.getString("colname"));	
			al_colnamec.add(crs_cols.getString("colnamec"));
			al_colomit.add(crs_cols.getString("omit"));
		}
	}
%>
<head>
<title><%=titleName%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet"  href="../css/001.css"  							type="text/css" >
<link rel="stylesheet"  href="../css/style1.css" type=text/css>
<link rel="stylesheet"  href="css/common.css" type="text/css" />
<script language="JScript" type="text/javascript"  src="js/tools.js"> </script>
<script language="JScript" type="text/javascript"  src="js/jq1-4-1.js"> </script>
<script language="JScript" type="text/javascript"  src="js/jquery.contextmenu.r2.packed.js"> </script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="15">
<iframe name="submitframe" width="100%" height="100" src="" frameborder="NONE" style="display:none"></iframe>
<div id="man_zone" >
	<TABLE class=table style="BORDER-COLLAPSE: collapse; " borderColor=#dedfd7 cellSpacing=0 cellPadding=3 width="100%" align=center bgColor=#ffffff  border=1>
	<tr>
		<td id="maintitle" bgColor=#f0f0f0 height=25 colspan="4" align="center" class="text2" ><font size="+1"><%=titleName%></font></td>
	</tr>
</table>
<div style="width:100%; overflow-x:scroll; height:415px;">
<table width='100%' border='0' cellspacing='0' cellpadding='0'>
	<tr>
		<td bgcolor='#dedfd7'>
			<table border="0" cellspacing="1" cellpadding="0"  align="center" width="100%">
			<form name="frmList" target="submitframe" ></form>
				<tr style="width:100%;" class="colnamec">
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
				//ͨ����λ��Ϣ���������ж� 
				if(Integer.parseInt(mypri)>1){
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
					<td height="15" colspan="<%=Integer.parseInt(mypri)>1?al_colname.size()+1:al_colname.size()%>"><p align="center" class="text2">δ��ѯ����λ��Ϣ</p></td>
				</tr>
				<%
				}
				else
				{
					int i_row = 1;
					while(crs.next())
					{
				%>
				<tr bgcolor='FFFFFF' class='font_px12_menu' id="tr_<%=crs.getString("deptid")%>" onMouseOver="javascript:this.style.background= '#ECF2FC';" onMouseOut="javascript:this.style.background= '#FFFFFF';">
					<%
					for(int jk=0; jk<al_colname.size(); jk++){
						%>
						<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_work_unit">&nbsp;&nbsp;<%=Tools.omit(crs.getString((String)al_colname.get(jk)),(String)al_colomit.get(jk))%></td>
						<%
					}
					%>
					<%
					//ͨ����λ��Ϣ���������ж� 
					if(Integer.parseInt(mypri)>1){
					%>
					<td height="2" align="center" class="text3" nowrap="nowrap" id="tr_<%=i_row%>_edit2">
						<a href="#" onclick="show('MainServlet_sys?fid=UII00.00.02.05&id=<%=crs.getString("id")%>&deptid=<%=crs.getString("deptid")%>')"><font color="#053080">��ϸ</font></a>
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
<div class="contextMenu" id="myMenu1" style="">
  <ul>
	<li id="see"><img src="./image2/icons/newspaper.png" />��ϸ</li>
  </ul>
</div>
<script>
$('.font_px12_menu').contextMenu('myMenu1', {
  bindings: {
	'see': function(t) {
	  //alert('Trigger was '+t.id+'\nAction was see');
	  show('MainServlet_sys?fid=UII00.00.02.08&deptid='+ t.id.split("_")[1])
	}
  }
});
</script>
<div class="contextMenu" id="myMenu2" style="">
  <ul>
	<li id="query"><img src="./image2/icons/binocular.png" />����</li>
  </ul>
</div>
<script>
$('#maintitle,.colnamec').contextMenu('myMenu2', {
  bindings: {
	'query': function(t) {
	  //alert('Trigger was '+t.id+'\nAction was see');
	  show('MainServlet_sys?fid=UII00.00.02.06&mode=before')
	}
  }
});
</script>
</html>
<script language="javascript">
function refrh(){
	location.reload();
	}
function modify(s)
  {
	  window.top.indexFrame.frames['manFrame'].location = s;

	}
function show(s)
  {
	  window.top.indexFrame.frames['manFrame'].location = s;

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