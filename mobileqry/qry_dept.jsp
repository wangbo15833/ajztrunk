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
	String deptname = new String(request.getParameter("deptname").getBytes("ISO-8859-1"),"utf-8");
	DBTrans dbtrans = new DBTrans(); 
	CachedRowSet crs = null;
	CachedRowSet tempcrs = null;
	String sql= "select * from dept where dept_name like'%"+deptname+"%'";
	System.out.println("===�ֻ��˲�ѯ��λ��Ϣ==="+sql);
	crs = dbtrans.getResultBySelect(sql);
%>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".sub_title").each(function(i){
		var keyword = "<%=deptname%>";
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
	<span><a >��λ��ѯ<a></span>
</div>
<%
 if(crs.size()==0){
 %><div class="noinfo"><div>û�в�ѯ����Ӧ����Ϣ</div></div><%
 }
Map<String,Integer> mapxq = new HashMap<String ,Integer>();
Map<String,Integer> maptg = new HashMap<String ,Integer>();
String gcname="";
String zglb ="";
int tempi=0;
 while(crs.next()){
 mapxq.clear();
 maptg.clear();
 %>
 
<div class="sub">
	<div class="sub_title"><span><%=crs.getString("dept_name")%></span></div>
	<div class="sub_cont">
		<div class="sub_item"><span>��λ���ͣ�</span><span><%=crs.getString("dept_dwlx")%></span></div>
		<div class="sub_item"><span>��λ��ַ���ʱࣩ��</span><span><%=crs.getString("dept_addr")%></span></div>
		<div class="sub_item"><span>��ϵ�绰��</span><span><%=crs.getString("con_phone")%></span></div>
		<div class="sub_item"><span>����ʱ�䣺</span><span><%=crs.getString("est_date")%></span></div>
		<div class="sub_item"><span>�������ͣ�</span><span><%=crs.getString("com_type")%></span></div>
		<%
		String sqlstr= "select distinct(s.id),s.gcname,s.sub_code,zg.id as zgid, zg.zglb from subinfo as s "+
			"left join subinfoasso as ao "+
			"on  s.sub_code = ao.sub_code "+
			"left join xmzg as zg "+
			"on  zg.xmcode = s.sub_code "+
			"where (ao.parname='sgzbdw' or ao.parname='sgfbdw'  or ao.parname='jldw' "+
			" or ao.parname='kcdw'  or ao.parname='sjdw'  or ao.parname='jsdw' ) "+
			"and ao.parvalue='"+crs.getString("dept_name")+"' order by s.sub_code";
		System.out.println(sqlstr);
		tempcrs = dbtrans.getResultBySelect(sqlstr);
		while(tempcrs.next()){
			gcname = tempcrs.getString("gcname");
			zglb = Tools.nvl(tempcrs.getString("zglb"));
			if(!mapxq.containsKey(gcname) && !maptg.containsKey(gcname)){
				mapxq.put(gcname,0);
				maptg.put(gcname,0);
			}
			
			if(zglb.equals("��������")){
				tempi =mapxq.get(gcname);
				tempi++;
				mapxq.put(gcname,tempi);
			}else if (zglb.equals("ͣ������")){
				tempi =mapxq.get(gcname);
				tempi++;
				maptg.put(gcname,tempi);
			}
		}
		for( String key: mapxq.keySet()){
			%>
			<div class="sub_item"><div><span>������Ŀ��</span><span><%=key%></span></div><div><span>�������ģ�</span><span><%=mapxq.get(key)%>��;&nbsp;&nbsp;</span><span>ͣ�����ģ�</span><span><%=maptg.get(key)%>��;&nbsp;&nbsp;</span></div></div><%
		}
		%>
		<%%>
	</div>
</div>
<%}%>
</body>
</html>
<%}catch(Exception e){e.printStackTrace();}%>