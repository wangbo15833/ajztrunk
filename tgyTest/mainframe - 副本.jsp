<%@ page contentType = "text/html; charset=GBK" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.zagerbone.util.DBTrans"%>
<%@ page import="com.zagerbone.util.Tools"%>
<%@ page import="sun.jdbc.rowset.*"%>

<%
/*
EventResponse 	eventResponse 	= (EventResponse)request.getAttribute("result");  
if(eventResponse.isSuccessFlag()){ 
	HashMap hp_general = (HashMap)eventResponse.getGeneralBody();
	System.out.println("========hp_general====="+hp_general.toString());
	HashMap hp_user = null;
	hp_user = (HashMap)hp_general.get("hp_user");
	System.out.println("hp_user======***======"+hp_user);
	usertype = (String)hp_general.get("usertype");
	//request.getSession();
	session.setAttribute("Myusertype", usertype);
}
*/	
HashMap hp_user = (HashMap)session.getAttribute("hp_user");
String 	username = (String)hp_user.get("realname");
String 	work_unit = (String)hp_user.get("work_unit");
String  usertype = (String)hp_user.get("usertype");
System.out.println("hp_user====="+hp_user);
try{
	DBTrans dbtrans = new DBTrans();
	CachedRowSet crs_menu = dbtrans.getResultBySelect("select  menu1,bz,order1 from ( select distinct (m.menu1),m.bz,m.order1  from menulist m  join pritab p on m.tabname=p.tabname and cast(m.needpri as int)<=cast(p.prilevel as int) and role_name='"+usertype+"' and disp='on') t order by cast(order1 as int)");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>������</title>

<style type="text/css">
#my_sub_info {
	width: 100%;
	float:left;
	background-image: url(../images/manage_r3_c11.jpg);
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 2px;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-right-color: #B4C9C6;
	border-bottom-color: #B4C9C6;
	border-left-color: #f1f1f1;
	height: 27px;
	background-repeat: repeat-x;
	padding: 5px 0 0 0;
	color:#ffffff;
}
</style>
</head>
<script  type="text/javascript">
/**
*   COPYRIGHT NOTICE
*   Copyright (c) 2013, ������ (��Ȩ����)
*   All rights reserved.
*
*   @file   mainframe.html
*   @function  list_sub_nav
*   @brief
*		�����ʱ��ı� ����
*		����ߴ��ݲ���
*   @retval 
*
*   @version    1.0
*   @author floatsnowflakes(floatsnowflakes@hotmail.com)
*   @date   2013-3-25
*
*   @NOTE
*/
var preClassName = "man_nav_01";
function list_sub_nav(Id,sortname){
   if(preClassName != ""){
      getObject(preClassName).className="bg_image";
   }
   
   if(getObject(Id).className == "bg_image"){
      getObject(Id).className="bg_image_onclick";
      preClassName = Id;	//����ȫ�ֱ���
			showInnerText(Id);	//������ʾ
			//���������Ŀ  MenuObj
			window.top.indexFrame.frames['leftFrame'].MenuObj.getbytitle(sortname);
			if(Id=="man_nav_01"){
			//window.top.indexFrame.frames['leftFrame'].MenuObj.backtofirst();
			}
	}
}

/**
*   COPYRIGHT NOTICE
*   Copyright (c) 2013, ������ (��Ȩ����)
*   All rights reserved.
*
*   @file   mainframe.html
*   @function  showInnerText
*   @brief
*		���蹤�̰�ȫ�������ϵͳʾ��Ӧ����ʾ*		
*   @retval 
*		����IDֵ
*   @version    1.0
*   @author floatsnowflakes(floatsnowflakes@hotmail.com)
*   @date   2013-3-25
*
*   @NOTE	��ȥǰ8���蹤�̰�ȫ�������ϵͳΪ����
*/
function showInnerText(Id){
    var switchId = parseInt(Id.substr(8,2),10);
	var showText = "�Բ���û����Ϣ��";
	switch(switchId){<%
	int curcase=0;
	String bz=null;
	while(crs_menu.next()){
		curcase++;
		bz=crs_menu.getString("bz");
	%>
	   	case <%=curcase%>:
		   showText =  "<%=bz%>";
		   break;<%
	}%>
		default:
		break;
	}
	//��id=show_text������������
	getObject('show_text').innerHTML = showText;
}
 
 /**
*   COPYRIGHT NOTICE
*   Copyright (c) 2013, ������ (��Ȩ����)
*   All rights reserved.
*
*   @file   mainframe.html
*   @function  getObject
*   @brief
*		��ȡ��ID�ö���
*   @retval 
*		����IDֵ
*   @version    1.0
*   @author floatsnowflakes(floatsnowflakes@hotmail.com)
*   @date   2013-3-25
*
*   @NOTE	���ݻ�ȡ
*/
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
</script>
<body>
<div id="nav">
    <ul><%
	crs_menu.beforeFirst();
	int curid=0;
	String menu1=null;
	
	while(crs_menu.next()){
		curid++;
		menu1=crs_menu.getString("menu1");
	%>
      <li id="man_nav_<%=curid<10?"0"+curid:curid%>" onclick="list_sub_nav(id,'<%=menu1%>')"  class="bg_image"><%=menu1%></li><%
	}%>
  </ul>
  
  <div style="float:right;" ><img src="../image2/icons/denied.png"></img><font onclick="my_quit();"   style="cursor:pointer;" >�˳�ϵͳ</font>&nbsp;&nbsp;&nbsp;&nbsp;</div>
</div>
<script>
      getObject("man_nav_01").className="bg_image_onclick";
</script>
<script>
function my_quit(){
	top.location ='../login/login_quit.jsp?sessionkill=1';
}
function showman(s)
{
	window.top.indexFrame.frames['manFrame'].location = s;
}
//-----------------------------------------------------------
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
function myFunction()
{
//alert("in setInterval");
loadXMLDoc("../ajax/check.jsp?_="+Math.round(Math.random()*100000)+"&mode=newmsg&rec_name=<%=username%>",function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
		var str = (xmlhttp.responseText);
		str=(str).replace(/[\r|\n]/gm,'');
		var str1 = "<A onclick=\"showman('../MainServlet_sys?fid=UII01.01.02.01&listMode=list&msgtype=֪ͨ&rec_name=<%=username%>')\"><img src='../image2/tranquiliti/file-note-paper.png' border='0' complete='complete'/> ֪ͨ��"+str.split(";")[0]+"��</A> <A onclick=\"showman('../MainServlet_sys?fid=UII01.01.02.01&listMode=list&msgtype=����&rec_name=<%=username%>')\"><img src='../image2/tranquiliti/Mail.png' border='0' complete='complete'/> ���ѣ�"+str.split(";")[1]+"��</A> <A onclick=\"showman('../MainServlet_sys?fid=UII01.01.02.01&listMode=list&msgtype=����&rec_name=<%=username%>')\"><img src='../image2/tranquiliti/file-default.png' border='0' complete='complete'/> ���棨"+str.split(";")[2]+"��</A>"
		document.getElementById("msgnum").innerHTML=str1;
		//alert(str);
		/* if (str == "repeat")
		{
			alert("���Ѵ��ڵ��û�����������������ʶ");
			document.getElementById("button1").disabled="disabled";
		}else
		{
			document.getElementById("button1").disabled="";
		} */
	}
  });
}

var tick=setInterval("myFunction()", 10000);

//-----------------------------------------------------
</script>
<div style="float:left;width:100%" id="sub_info">&nbsp;��¼��:<%=work_unit%>, <%=usertype%>, <%=username%>&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;<span id="show_text">���蹤�̰�ȫ�������ϵͳ��Ϣϵͳ!</span><div style="float:right; "><div id="msgnum" style="float:left;">δ����Ϣ��������</div></div></div>
</body>
</html>
<script><%
if(curid==0){
%>
alert("���蹤�̰�ȫ�������ϵͳ������ϵ����Ա��");
document.getElementById("show_text").innerHTML =document.getElementById("show_text").innerHTML+"  ����ȷ����Ȩ��";
<%}%>
</script>
<%
crs_menu.close();
}catch(Exception ex){ 
	ex.printStackTrace();
}%>
