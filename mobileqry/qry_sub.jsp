<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312"
import="com.shenghao.arch.util.*"
import="java.util.*"
import="sun.jdbc.rowset.*"
import="java.text.DateFormat"
import="com.zagerbone.util.DBTrans"
import="com.zagerbone.util.Tools"
import="java.text.*"
import="org.json.*"
import="java.util.Iterator"
import="java.util.Map.Entry"
import="java.util.Set" %><%
System.out.println("��ѯ��Ŀ��Ϣ");
try{
	String subname = new String(request.getParameter("subname").getBytes("ISO-8859-1"),"utf-8");
	DBTrans dbtrans = new DBTrans(); 
	CachedRowSet crs = null;
	CachedRowSet crs_asso = null;
	CachedRowSet tempcrs = null;
	String sql= "select * from subinfo where gcname like'%"+subname+"%'";
	System.out.println("===�ֻ��˲�ѯ��Ŀ��Ϣ==="+sql);
	crs = dbtrans.getResultBySelect(sql);
	
	String 	sgzbdw ="";
	String	sgfbdw ="";
	String	kcdw ="";
	String	sjdw ="";
	String	jldw ="";
	String	jsdw ="";
%>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".sub_title").each(function(i){
		var keyword = "<%=subname%>";
		var str = $(this).find("span").html();
		str = str.replace(new RegExp(keyword,"g"),"<font color='darkorange'>"+keyword+"</font>");
		$(this).find("span").html(str);
	});
	$(".sub_title").click(function(){
		$(this).siblings(".sub_cont").slideToggle("fast");
	});
});
</script>
<style>
a{text-decoration:none;}
li{list-style-type:none;
//circle
}
ul{padding:0;margin:0;}
.main_nav{text-align:center;background:#eeaaaa;color:#aa55ee;font-size:20px;margin-bottom:30px;}
.noinfo{width:100%;text-align:center;}
.noinfo div{width:50%;color:darkorange;font-size:30px;display:inline-block;}
.sub{margin-bottom:10px;}
.sub_title{background:lightgray;font-color:darkblue;font-size:24px;text-align:center;}
.sub_cont{width:100%;text-align:left;margin-bottom:20px;display:none;}
.sub_item{width:100%;display:inline-block;background:#aaaaee;margin-top:5px;}
</style>
<!--��text-align:center �� �� display:inline-block;����ʹdiv����-->
</head>
<body bgcolor="#dddddd" width=100% height=100%>
<div class="main_nav" >
	<span><a href="mainqry.jsp">��ݲ�ѯ<a></span>
	<span><a>&gt;&gt;<a></span>
	<span><a >��Ŀ��ѯ<a></span>
</div>
<%
 if(crs.size()==0){
 %><div class="noinfo"><div>û�в�ѯ����Ӧ����Ϣ</div></div><%
 }
 String parname="";
 String xqzg="";
 String tgzg="";
 while(crs.next()){
	sql="select count(id) as exp from xmzg where xmcode='"+crs.getString("sub_code")+"' and zglb='��������' ";
	tempcrs= dbtrans.getResultBySelect(sql);
	tempcrs.next();
	xqzg = tempcrs.getString("exp");
	
	sql="select count(id) as exp from xmzg where xmcode='"+crs.getString("sub_code")+"' and zglb='ͣ������' ";
	tempcrs= dbtrans.getResultBySelect(sql);
	tempcrs.next();
	tgzg = tempcrs.getString("exp");
	
	sql="select * from subinfoasso where sub_code='"+crs.getString("sub_code")+"'";
	crs_asso = dbtrans.getResultBySelect(sql);
	
	
	while(crs_asso.next()){
		parname = crs_asso.getString("parname");
		if(parname.equals("sjdw")){
			sjdw=crs_asso.getString("parvalue");
		}else if(parname.equals("jsdw")){
			jsdw=crs_asso.getString("parvalue");
		}else if(parname.equals("kcdw")){
			kcdw=crs_asso.getString("parvalue");
		}else if(parname.equals("jldw")){
			jldw=crs_asso.getString("parvalue");
		}else if(parname.equals("sgzbdw")){
			sgzbdw=crs_asso.getString("parvalue");
		}else if(parname.equals("sgfbdw")){
			sgfbdw=crs_asso.getString("parvalue");
		}
	}
	
 %>
 
<div class="sub">
	<div class="sub_title"><span><%=crs.getString("gcname")%></span></div>
	<div class="sub_cont">
		<div class="sub_item"><span>���̵�ַ��</span><span><%=crs.getString("gcdz")%></span></div>
		<div class="sub_item"><span>����ʱ�䣺</span><span><%=crs.getString("kgsj")%></span></div>
		<div class="sub_item"><span>����ʱ�䣺</span><span><%=crs.getString("jgsj")%></span></div>
		<div class="sub_item"><span>���赥λ��</span><span><%=jsdw%></span></div>
		<div class="sub_item"><span>���쵥λ��</span><span><%=kcdw%></span></div>
		<div class="sub_item"><span>��Ƶ�λ��</span><span><%=sjdw%></span></div>
		<div class="sub_item"><span>ʩ���ܰ���λ��</span><span><%=sgzbdw%></span></div>
		<div class="sub_item"><span>ʩ���ְ���λ��</span><span><%=sgfbdw%></span></div>
		<div class="sub_item"><span>����λ��</span><span><%=jldw%></span></div>
		<div class="sub_item"><span>�������Ĵ�����</span><span><%=xqzg%></span></div>
		<div class="sub_item"><span>ͣ�����Ĵ�����</span><span><%=tgzg%></span></div>
	</div>
</div>
<%}%>
</body>
</html>
<%}catch(Exception e){e.printStackTrace();}%>