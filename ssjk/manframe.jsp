<%@ page contentType = "text/html; charset=GBK" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include  file='../identification.jsp' %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String tp_carname 	= Tools.GBK(request.getParameter("tp_carname"));
String Tnum 	= Tools.nvl(request.getParameter("Tnum"));

  EventResponse eventResponse = (EventResponse)request.getAttribute("result"); 
	Query queryCon = null;
	CachedRowSet crs = null;
	if(eventResponse != null){
		queryCon = (Query)eventResponse.getBody();  
		crs = (CachedRowSet)queryCon.getConditionBody();
		
	}
	
	
%>
<%
HashMap [] ary_hp = new HashMap[10];
for(int jk=0; jk<10; jk++){
	ary_hp[jk] = new HashMap();
}

int i=0;
while(crs.next()){
	HashMap hp = ChangeCrsToHashMap(crs);
	ary_hp[i] = hp;
	i++;
}
%>
<%!
public static String getHMS(String stime){
	
	if(stime.length()<17){
		return stime;
	}
	else{
		int spaceIndex = stime.indexOf(" ");
		stime = stime.substring(spaceIndex,spaceIndex+9);
	}
	return stime;
}
public static String getYMD(String stime){
	
	if(stime.length()<10){
		return stime;
	}
	else{
		stime = stime.substring(0,10);
	}
	return stime;
}
%>
<%!
public static HashMap ChangeCrsToHashMap(CachedRowSet  crs)
			throws Exception
	{
		HashMap 	hp = new HashMap();
		try{
			ResultSetMetaData 	md 	= crs.getMetaData();
      int cols = md.getColumnCount();
      for(int i=1;i<=cols;i++){
				//sys_display.setProp(md.getColumnName(i).toLowerCase(),Tools.nvl(crs.getString(i)));
				//if(!md.getColumnName(i).equals("id")){
					hp.put(md.getColumnName(i), Tools.nvl(crs.getString(i)));
					//System.out.println("md.getColumnName(i)=================================="+md.getColumnName(i));
				//}
			}
     
		}catch(Exception be ){
				be.printStackTrace();
				//returnValue.setErrorMessage(be.getMessage().replace('\n', ' '));
				throw (new Exception(be.getMessage()));
    }
    return hp;
	}



%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="refresh"	   content="66;url=MainServlet_sys?fid=FCL00.00.01.02&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>">
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>ʵʱ�������</title>
<style>
.left_title_1_LowHeight {
	background-color: #F3F8F7;
	color:#73938E;
	font-weight:bold;
	text-align:right
}
.left_title_2_LowHeight {
	background-color: #fff;
	color:#73938E;
	font-weight:bold;
	line-height:15px;
	text-align:right;
}

#man_zone_full_ {
    height: 480px;
	width: 100%;
	border: 1px solid #B4C9C6;
	margin: 6px 0 0 0;
	background-color:#FFFFFF;
	padding: 5px 0 5px 10px;
	overflow:auto;
	
}
</style>
</head>

<body rightmargin="5px" leftmargin="5px"  topmargin="5px"  style="background-color:#FFFFFF"  >
<div  style="overflow:hidden;width:99.8%;height: 505px; border: 1px solid #B4C9C6;margin: 6px 0 0 0;padding: 5px 0 0px 0px; ">
  <div style="width:100%;height: 485px; overflow:scroll;border: 0px solid #B4C9C6;background-color:#FFFFFF;    " > 
  <table width='98%' border='0' cellspacing='0' cellpadding='0'      bgcolor="#ffffff" style="padding: 5px 0px 5px 5px;">
    <tr>
      <td bgcolor='#FFFFFF'><form action="#" onsubmit="">
<table width="100%" border="0" cellpadding="0" cellspacing="1"  bgcolor="#B4C9C6" class="table_style">
          <tr bgcolor="#FFFFFF">
            <th colspan="11">&nbsp;<%=tp_carname%>ʵʱ�������</th>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" align="right" nowrap="nowrap">��������(����)</td>
            <td><%=getYMD(Tools.nvl((String)ary_hp[9].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[9].get("tp_testtime")))%></td>
            <td><%=getYMD(Tools.nvl((String)ary_hp[8].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[8].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[7].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[7].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[6].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[6].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[5].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[5].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[4].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[4].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[3].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[3].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[2].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[2].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[1].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[1].get("tp_testtime")))%></td>
			<td><%=getYMD(Tools.nvl((String)ary_hp[0].get("tp_testtime")))%><br /><%=getHMS(Tools.nvl((String)ary_hp[0].get("tp_testtime")))%></td>
          </tr>
          <tr bgcolor="#FFFFFF" style='display:block' >
            <td class="left_title_1" nowrap="nowrap">����<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_car_longitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_car_longitude"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF" style='display:block'>
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">γ��</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_car_latitude"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_car_latitude"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">��λ״̬<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_car_placestate"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_car_placestate"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF" style='display:none'>
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">���ȷ���</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_longitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_longitude_dir"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF" style='display:none'>
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">γ�ȷ���</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_latitude_dir"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_latitude_dir"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">��ȴˮ��<a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=��ȴˮ��&StatusCol=tp_car_watertemp&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a><br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_car_watertemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_car_watertemp"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">ȼ��Һλ</span><a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=ȼ��Һλ&StatusCol=tp_car_oillevel&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_car_oillevel"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_car_oillevel"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">������ת��<a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=������ת��&StatusCol=tp_car_eginespeed&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a><br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_car_eginespeed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_car_eginespeed"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
					<!--
            <td class="left_title_2" nowrap="nowrap">1#����ת��<a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=1#����ת��&StatusCol=tp_jlspeed_one&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a><br/></td>-->
						
						<td class="left_title_1" nowrap="nowrap">1����ת��<a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=1����ת��&StatusCol=tp_jlspeed_one&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a><br /></td>
						
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_jlspeed_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_jlspeed_one"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">2����ת��<a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=2����ת��&StatusCol=tp_jlspeed_two&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a><br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_jlspeed_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_jlspeed_two"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">����Сʱ</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_workhour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_workhour"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">�ո�ʱ��<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_harvesthour"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_harvesthour"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">Һѹ����</span><a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=Һѹ����&StatusCol=tp_oiltemp&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_oiltemp"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_oiltemp"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">����<a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=����&StatusCol=tp_car_speed&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" heght="16" alt="��������ͼ"  /></a><br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_car_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_car_speed"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">������Ͳת��</span><a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=������Ͳת��&StatusCol=tp_tlgt_speed&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_tlgt_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_tlgt_speed"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">��̨β��ת��<a href="MainServlet_sys?fid=FCL00.00.01.12&StatusName=��̨β��ת��&StatusCol=tp_gtwb_speed&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>"><img src="images/b_unique.png" width="16" height="16" alt="��������ͼ"  /></a></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_gtwb_speed"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_gtwb_speed"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">����ѹ����</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT0"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT0"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">���ָʾ</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT1"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT1"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">�Ų�</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT2"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT2"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">����</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT3"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT3"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">ȼ��Һλ��</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT4"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT4"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">������ˮ�¸�</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT5"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT5"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">����ͣ��</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT6"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT6"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">1#����ת�ٱ���</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT7"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT7"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">2#����ת�ٱ���</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT8"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT8"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">Һѹ���¸߱���</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT9"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT9"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">������Ͳʧ��</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT10"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT10"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">��̨����ʧ��</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT11"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT11"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">��̨������</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT12"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT12"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">��̨������</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT13"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT13"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">��ת�����</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT14"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT14"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">��ת�����</td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT15"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT15"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap">�Զ���ǳ����<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT16"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT16"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">�Զ���ǳ����</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT17"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT17"))%></td>
          </tr>
		  <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">��������</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT18"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT18"))%></td>
          </tr>
		  <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap"><span class="left_title_1">ͣ��</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("BIT20"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("BIT20"))%></td>
          </tr>
		  <tr bgcolor="#FFFFFF">
          <td class="left_title_2" nowrap="nowrap">S1״̬<br /></td>
                <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_one"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_one"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap"><span class="left_title_2">S2״̬</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_two"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_two"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">S3״̬<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_three"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_three"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap"><span class="left_title_2">�ֶ�/�Զ�״̬</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_four"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_four"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">������Ͽ���<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_five"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_five"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap"><span class="left_title_2">��ǳ�ֶ�������</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_six"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_six"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">��ǳ�ֶ�������<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_seven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_seven"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap"><span class="left_title_2">��̨������</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_eight"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_eight"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">��̨������<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_nine"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_nine"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap"><span class="left_title_2">��ת����</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_ten"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_ten"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">��ת����<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_eleven"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_eleven"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap"><span class="left_title_2">ת��ѹ������</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_twelve"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_twelve"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2" nowrap="nowrap">��̨��ѹ������<br /></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_thirteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_thirteen"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_1" nowrap="nowrap"><span class="left_title_2">��̨��ѹ������</span></td>
            <td><%=Tools.nvl((String)ary_hp[9].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[8].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[7].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[6].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[5].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[4].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[3].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[2].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[1].get("tp_st_BIT_fourteen"))%></td>
            <td><%=Tools.nvl((String)ary_hp[0].get("tp_st_BIT_fourteen"))%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td class="left_title_2">&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </table>
      </form></td>
    </tr>
  </table>
  </div>
</div>
<!--
<div style=" float:right;" align="right"  >
  <a href="graphView.html"><img src="images/realtime.gif" /></a>&nbsp;
  <a href="javascript:createJCBG('<%=tp_carname%>');"><img src="images/textreport.gif" /></a>&nbsp;
  <a href="elcMap.html"><img src="images/elcmap.gif" /></a>
</div>
-->
</body>

</html>
<script>
function createJCBG(tp_carname){
	alert('�����������ƣ�'+tp_carname+'�ļ�ⱨ�棡');
	location = "ssjk/report.html";
}
</script>