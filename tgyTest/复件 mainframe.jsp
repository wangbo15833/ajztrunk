<%@ page contentType = "text/html; charset=GBK" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.zagerbone.util.DBTrans"%>
<%@ page import="com.zagerbone.util.Tools"%>
<%
String usertype = null;
/*
EventResponse 	eventResponse 	= (EventResponse)request.getAttribute("result");  
if(eventResponse.isSuccessFlag()){ 
	HashMap hp_general = (HashMap)eventResponse.getGeneralBody();
	HashMap hp_user = null;
	hp_user = (HashMap)hp_general.get("hp_user");
	System.out.println("hp_user======***======"+hp_user);
	usertype = (String)hp_user.get("usertype");
	//request.getSession();
	session.setAttribute("Myusertype", usertype);
}
*/	
HashMap hp_user = (HashMap)session.getAttribute("hp_user");
String 	username = (String)hp_user.get("realname");
String 	work_unit = (String)hp_user.get("work_unit");
System.out.println("hp_user====="+hp_user);
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
			window.top.indexFrame.frames['leftFrame'].MenuObj.getdefaultnav(sortname);
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
	switch(switchId){
	   	case 1:
		   showText =  "���蹤�̰�ȫ�������ϵͳ��Ӧ����ʾ������";
		   break;
	   	case 2:
		   showText =  "���蹤�̰�ȫ�������ϵͳ���蹤�̰�ȫ�������ϵͳ�޸ġ�ɾ����";
		   break;
	   	case 3:
		   showText =  "���蹤�̰�ȫ�������ϵͳ���Ȼ�����Ϣ��";
		   break;		   
	   	case 4:
		   showText =  "���蹤�̰�ȫ�������ϵͳ���蹤�̰�ȫ�������ϵͳ���в�ѯ��";
		   break;	
	   	case 5:
		   showText =  "���蹤�̰�ȫ�������ϵͳ���޸ı�׼����";
		   break;	
		case 6:
		   showText =  "���蹤�̰�ȫ�������ϵͳȨ�����ã�";
		   break;		
		case 7:
		   showText =  "���蹤�̰�ȫ�������ϵͳ�����⣡";
		   break;
		case 8:
		   showText =  "";
		case 9:
		   showText =  "���蹤�̰�ȫ�������ϵͳʹ�ã�";
		   break;
		case 10:
		   showText =  "���蹤�̰�ȫ�������ϵͳʹ�ã�";
		   break;
		case 11:
		   showText =  "���蹤�̰�ȫ�������ϵͳ��־������ά����";
		   break;
		case 12:
		   showText =  "���蹤�̰�ȫ�������ϵͳʹ�ã�";
		   break;
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
    <ul>
      <li id="man_nav_01" onclick="list_sub_nav(id,'��վ��ҳ')"  class="bg_image_onclick">��վ��ҳ</li>
      <li id="man_nav_02" onclick="list_sub_nav(id,'��ɫ����')"  class="bg_image">��ɫ����</li>
      <li id="man_nav_03" onclick="list_sub_nav(id,'������Ϣ')"  class="bg_image">������Ϣ</li>
      <li id="man_nav_04" onclick="list_sub_nav(id,'�û�����')"  class="bg_image">�û�����</li>
      <li id="man_nav_05" onclick="list_sub_nav(id,'�ල����')"  class="bg_image">�ල����</li>
	  <li id="man_nav_06" onclick="list_sub_nav(id,'��ѯ����')"  class="bg_image">��ѯ����</li>
      <li id="man_nav_07" onclick="list_sub_nav(id,'��ȫ����')"  class="bg_image">��ȫ����</li>
      <li id="man_nav_08" onclick="list_sub_nav(id,'֪ͨ����')"  class="bg_image">֪ͨ����</li>
      <li id="man_nav_09" onclick="list_sub_nav(id,'��Ϣ����')"  class="bg_image">��Ϣ����</li>
      <li id="man_nav_10" onclick="list_sub_nav(id,'ǩ������')"  class="bg_image">ǩ������</li>
      <li id="man_nav_11" onclick="list_sub_nav(id,'ϵͳά��')"  class="bg_image">ϵͳά��</li>
      <li id="man_nav_12" onclick="list_sub_nav(id,'�ֵ�����')"  class="bg_image">�ֵ�����</li>
  </ul>
  
  <div style="float:right;" ><font onclick="my_quit();"   style="cursor:pointer;" >�˳�ϵͳ</font>&nbsp;&nbsp;&nbsp;&nbsp;</div>
</div>
<script>
function my_quit(){
	top.location ='../login/login_quit.jsp?sessionkill=1';
}
</script>
<div style="float:left;width:" id="sub_info">&nbsp;��¼��:<%=work_unit%>,<%=username%>&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;<span id="show_text">���蹤�̰�ȫ�������ϵͳ��Ϣϵͳ!</span></div>
</body>
</html>
