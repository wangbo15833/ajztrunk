<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%
try{
String usertype = (String)session.getAttribute("Myusertype");
System.out.println("usertype=============================================="+usertype);

String listMode= Tools.nvl(request.getParameter("listMode")); 
System.out.println("listMode=============================================="+listMode);
String operStyle = "none";
String operStyle_cancal = "none";
if(listMode.equals("")){
	operStyle = "block";
}else if(listMode.equals("cancal")){
	operStyle_cancal = "block"; 
}
  EventResponse eventResponse = (EventResponse)request.getAttribute("result"); 
	Query queryCon = null;
	CachedRowSet crs = null;
	if(eventResponse != null){
		queryCon = (Query)eventResponse.getBody();  
		crs = (CachedRowSet)queryCon.getConditionBody();
	}
%>
<%
String [] col_name = {"id","tp_carproduction","tp_testnum","tp_carname","tp_carnum","tp_testtoolnum","tp_testtime","tp_faultinfo","tp_car_longitude","tp_car_latitude","tp_car_placestate","tp_longitude_dir","tp_latitude_dir","tp_car_watertemp","tp_car_oillevel","tp_car_eginespeed","tp_jlspeed_one","tp_jlspeed_two","tp_workhour","tp_harvesthour","tp_oiltemp","tp_car_speed","tp_tlgt_speed","tp_gtwb_speed","tp_stateinfo","tp_oversign","tp_checkcode","BIT0","BIT1","BIT2","BIT3","BIT4","BIT5","BIT6","BIT7","BIT8","BIT9","BIT10","BIT11","BIT12","BIT13","BIT14","BIT15","BIT16","BIT17","BIT18","tp_st_BIT_one","tp_st_BIT_two","tp_st_BIT_three","tp_st_BIT_four","tp_st_BIT_five","tp_st_BIT_six","tp_st_BIT_seven","tp_st_BIT_eight","tp_st_BIT_nine","tp_st_BIT_ten","tp_st_BIT_eleven","tp_st_BIT_twelve","tp_st_BIT_thirteen","tp_st_BIT_fourteen","tp_st_BIT_fifteen","tp_st_BIT_sixteen","tp_ft_stopMachine","tp_startsign","tp_datacode"};

String [] col_headname 	= {"id","������λ","���Ա��","��������","�������","�����������","����ʱ��","������Ϣ","��������","����γ��","������λ״̬","�������ȷ���","����γ�ȷ���","������ȴˮ��","����ȼ��Һλ","����������ת��","1#����ת��","2#����ת��","��������Сʱ","�����ո�ʱ��","����Һѹ����","��������","����������Ͳת��","������̨β��ת��","����״̬��Ϣ","���Խ�����","����У����","����ѹ����","���ָʾ","�Ĳ�","����","ȼ��Һλ��","������ˮ�¸�","����ͣ��","1#����ת�ٱ���","2#����ת�ٱ���","Һѹ���¸߱���","�����Ͳʧ��","��̨����ʧ��","��̨������","��̨������","��ת�����","��ת�����","1#�Զ���ǳ����","2#�Զ���ǳ����","��������","״̬��Ϣ1","״̬��Ϣ2","״̬��Ϣ3","״̬��Ϣ4","״̬��Ϣ5","״̬��Ϣ6","״̬��Ϣ7","״̬��Ϣ8","״̬��Ϣ9","״̬��Ϣ10","״̬��Ϣ11","״̬��Ϣ12","״̬��Ϣ13","״̬��Ϣ14","״̬��Ϣ15","״̬��Ϣ16","���Գ���ͣ��","������ʼ��","�������ݱ���"};
%>
<head>
<title>������ؼ�¼�б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet"  href="../css/001.css"  							type="text/css" >
<link rel="stylesheet"  href="../css/style1.css" type=text/css>
<link rel="stylesheet"  href="../css/calendar-win2k-cold-1.css"  	type="text/css">
<link rel="stylesheet"  href="css/common.css" type="text/css" />
<script language="JScript" type="text/javascript"  src="js/tools.js"> </script>
<style>
td{font-size:12px; padding-left:3px;padding-right:3px;}
th{font-size:14px; font-weight:bold; margin-bottom:20px;}
</style>
<script>
var preClassName = "man_nav_1";
function list_sub_nav(Id,sortname){
   if(preClassName != ""){
      getObject(preClassName).className="bg_image";
   }
   if(getObject(Id).className == "bg_image"){
      getObject(Id).className="bg_image_onclick";
      preClassName = Id;	//����ȫ�ֱ���
	  //���������Ŀ  MenuObj
	 }
}
function getObject(objectId) {
    if(document.getElementById && document.getElementById(objectId)) {
	// W3C DOM
	return document.getElementById(objectId);
    } else if (document.all && document.all(objectId)) {
	// MSIE 4 DOM
	return document.all(objectId);
    } else if (document.layers && document.layers[objectId]) {
	// NN 4 DOM.. note: this won't find nested layers
	return document.layers[objectId];
    } else {
	return false;
    }
}
function editSubmit_button(){//����ȷ����ť�Ĳ�������
	if(parent.activeIframe == 'listframe'){
		parent.openIframe("listframe");
		parent.closeIframe("editframe");
	}
}
function confirmButton(operationMode, tr_row,id_value){
	var ok = false; 
	alert(tr_row);
	//document.getElementById("tr_"+tr_row).innerHTML="";
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
		//for(int jk=0; jk<1; jk++){
			%>
			document.getElementById("tr_"+tr_row+"_<%= col_name[jk]%>").innerHTML="";
			<%
		}
	%>
	//alert(document.getElementById("tr_1_id").innerHTML);
	document.getElementById("tr_"+tr_row+"_edit").innerHTML="&nbsp;";
	submitframe.location = "MainServlet_sys?fid=FCL00.00.01.05&id="+id_value;
	return ok;
}
</script> 
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<%
/*
usertype = "ϵͳ����Ա";
usertype = "���վ��Ա";
usertype = "������λ";
usertype = "������Ա";
*/
//ͨ����ɫ��������ж� 
if(usertype.equals("ϵͳ����Ա")||usertype.equals("���վ��Ա")){
	operStyle = "block";
}
else{
	operStyle = "none";
}
%>
<div id="man_zone" style="padding-top:20px;">
  <table width='100%' border='0' align='center' cellpadding='1' cellspacing='1' bordercolor='#bdd7d6' bgcolor='#bdd7d6'  rules='none' style="font-size:12px; display:block;">
    <tr id='sub_title'>
      <th align="center"><font size="+1">������ز�ѯ��¼�б�</font></th>
    </tr>
  </table>
  <div style="width:100%; overflow-x:scroll">
    <table width='101%' border='0' cellspacing='0' cellpadding='0'>
      <tr>
        <td bgcolor='#dedfd7'><table width="100%" border="0" cellpadding="0" cellspacing="1"  class="table_style">
          <tr   style="font-size:13px" >
           
            <td width="80px" align="center" class="left_title_1" style="display:<%=operStyle_cancal%>">����</td>
            <%
		for(int jk=0; jk<col_name.length; jk++){
			%>
            <td width="10%" align="center" nowrap="nowrap" style="padding-left:2px; padding-right:2px;" class="left_title_1"><span class="left_title_2" ><%=col_headname[jk]%></span></td>
            <%
		}
		%>
          </tr>
          <tr   style="font-size:13px" >
            
            <td width="20%" align="center" class="left_title_1" style="display:<%=operStyle_cancal%>"></td>
            <%
		for(int jk=0; jk<col_name.length; jk++){
			%>
            <td width="10%" align="center" nowrap="nowrap" class="left_title_1"><span class="left_title_2" ><%=col_name[jk]%></span></td>
            <%
		}
		%>
          </tr>
          <%
	if(crs==null||crs.size()==0)
	{
%>
          <script>alert('û�����ݼ�¼');</script>
          <%
		for(int ik=1; ik<=15; ik++){
			%>
          <tr  bgcolor='FFFFFF' class='font_px12'>
            
            <%
			for(int jk=0; jk<col_name.length; jk++){
				%>
            <td align="center"  style="font-size:12px" nowrap="nowrap" >&nbsp;</td>
            <%
			}
			%>
          </tr>
          <%
		}
		%>
          <%
	}
	else
	{
		int i_row = 1;
		while(crs.next())
		{
			%>
          <tr bgcolor='FFFFFF' class='font_px12' id="tr_<%=i_row%>" onmouseover="javascript:this.style.background= '#ECF2FC';" onmouseout="javascript:this.style.background= '#FFFFFF';">
            <td align="center"  nowrap="nowrap" id="tr_<%=i_row%>_edit" style="display:<%=operStyle_cancal%>"><a href="MainServlet_sys?fid=FCL00.00.00.13&id=<%=crs.getString("id")%>" target="_self"><font color="#ff0000" class="tdrecord" style="font-size:12px" >���</font></a> </td>
            <%
		String col_value = null;
		for(int jk=0; jk<col_name.length; jk++){
			col_value = Tools.nvl(crs.getString(col_name[jk]));
			if(col_name[jk].equals("CMonitorStatus")){
				if(col_value.equals("0")){
					col_value = "<div style='color:red;'>������</div>";
				}
				else if(col_value.equals("1")){
					col_value = "<div style='color:blue;'>���</div>";
				}
			}
			else if(col_name[jk].equals("CReoportStatus")){	
				if(col_value.equals("0")){
					col_value = "<div style='color:red;'>δ������</div>";
				}
				else if(col_value.equals("1")){
					col_value = "<div style='color:blue;'>�ѳ�����</div>";
				}	
			}
			else if(col_name[jk].equals("Couttime") || col_name[jk].equals("Cjtime") || col_name[jk].equals("tp_testtime")|| col_name[jk].equals("dataCreateTime")){
				col_value = Tools.formatDateToString_hms(col_value);
			}
			%>
            <td align="center"  nowrap="nowrap" id="tr_<%=i_row%>_<%= col_name[jk]%>"><%= col_value%></td>
            <%
		}
		%>
          </tr>
          <%
		i_row++;
		}
		for(int ik=i_row; ik<=15; ik++){
			%>
          <tr  bgcolor='FFFFFF' class='font_px12'>
           
            <td align="center"  nowrap="nowrap" style="display:<%=operStyle%>"></td>
            <%
			for(int jk=0; jk<col_name.length; jk++){
				%>
            <td align="center"  style="font-size:12px" nowrap="nowrap" >&nbsp;</td>
            <%
			}
			%>
          </tr>
          <%
		}
	}
%>
        </table></td>
      </tr>
    </table>
  </div>
  <iframe id='submitframe' name='submitframe' width='100%' height='200' src='' frameborder='NONE' style='display:none'></iframe>
  <div id='queryConTable_id' style='display:block;'>
    <table width='100%' border='0' align='center' cellpadding='1' cellspacing='1' bordercolor='#bdd7d6' bgcolor='#bdd7d6'  rules='none' style="font-size:12px;">
      <tr id='sub_title'>
        <td width='55%' scope='col' align='left' id='listTitle' style="background-color:#F3F8F7;">�����б���ʾ��(ȫ����¼)</td>
        <td width='13%' align='right' nowrap>&nbsp;&nbsp;�ϼ�<%=queryCon.getTotalNum()%>��</td>
        <td width='14%' align='right' nowrap>��<%=queryCon.getCurrentPageNum()%>ҳ/��<%=queryCon.getMaxPageNum()%>ҳ&nbsp;</td>
        <td width='18%' align='right' nowrap ><a href='MainServlet_sys?<%=queryCon.getMinPage()%>' 			target='_self' id='queryConTable_beginPage'>��ҳ</a>&nbsp; <a href='MainServlet_sys?<%=queryCon.getPreviousPage()%>'       target='_self' id='queryConTable_lastPage'>ǰһҳ</a>&nbsp; <a href='MainServlet_sys?<%=queryCon.getNextPage()%>' 		    target='_self' id='queryConTable_nextPage'>��һҳ</a>&nbsp; <a href='MainServlet_sys?<%=queryCon.getMaxPage()%>' 			target='_self' id='queryConTable_endPage'>βҳ</a>&nbsp; 
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
        <td width='0%' align='right'	style='display:none;height:15px;vertical-align:top'><input type='text' name='totalNum' 	style='height:18px;width:20px;font-size:12px'		id='totalNum' value='5' /></td>
        <td width='0%' align='right'	style='display:none;height:15px;vertical-align:top'><input type='text' name='CurLineNum' 	style='height:18px;width:20px;font-size:12px'	id='CurLineNum' value='' /></td>
        <td width='0%' align='right'	style='display:none;height:15px;vertical-align:top'><input type='text' name='CurLineCheck' style='height:18px;width:20px;font-size:12px'	id='CurLineNum' value='' /></td>
      </tr>
    </table>
  </div>
</div>
</body>
</html>
<%
}catch(Exception ex){
	ex.printStackTrace();
}
%>
