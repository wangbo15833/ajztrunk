<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%@ page import="com.zagerbone.util.Query"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ page import ="java.util.Iterator"%>
<%@ page import ="java.util.Map.Entry"%>
<%@ page import ="java.util.Set"%>
<%
System.out.println("�ͻ��˽����ѯҳ��");
%>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".sub_title").click(function(){
		$(this).find("~.sub_cont").slideToggle("fast");
	});
});
</script>
<style>
a{
text-decoration:none;
}
li{
list-style-type:none;
//circle
}
ul{
padding:0;
margin:0;
}
.main_nav{
text-align:center;
background:#eeaaaa;
color:#aa55ee;
font-size:24px;
margin-bottom:30px;
}
.logo{
width:24px;
height:24px;
}
.sub_nav{
height:500px;
overflow:scroll;
}


.sub_nav_ul li{
	text-align:left;
	background:#aaaaee;
	color:#5555aa;
	font-size:24px;
	padding-left:20px;
	margin-bottom:10px;
}
.forin{
	width:60%;
	font-size:18px;
}
.qrybtn{
	font-size:18px;
}
.sub_cont{
	display:none;
}
.hint{
	font-size:14px;
	color:#555555;
	text-align:center;
}
</style>
</head>
<body bgcolor="#dddddd" width=100% height=100%>
<div class="main_nav" >
	<span><img class="logo" src="image/logo.png"/></span>
	<span>��ݲ�ѯ</span>
</div>
<div class="sub_nav">
	<ul class="sub_nav_ul">
		<li>
			<div class="sub_title">��ѯ��Ŀ��Ϣ</div>
			<div class="sub_cont">
				<div><input type = "input" class="forin" value="" ><input id="subqry" class="qrybtn" type="button" value="��ѯ"></div>
				<div class="hint">��ʾ�������������Ϣ����Ŀ���ƽ��й���</div>
			</div>
		</li>
		<li>
			<div class="sub_title">��ѯ��λ��Ϣ</div>
			<div class="sub_cont">
				<div><input type = "input" class="forin" value="" ><input id="deptqry" class="qrybtn" type="button" value="��ѯ"></div>
				<div class="hint">��ʾ�������������Ϣ�Ե�λ���ƽ��й���</div>
			</div>
		</li>
		<li>
			<div class="sub_title">��ѯ�ල�ƻ�</div>
			<div class="sub_cont">
				<input type = "input" class="forin" value="" ><span class="hint">��Ŀ����</span><br/>
				<select class="forin" >
					<option selected="selected" value="�������">�������</option>
					<option value="������">������</option>
					<option value="װ�޼��">װ�޼��</option>
					<option value="������">������</option>
				</select>
				<span class="hint">�ල������</span><br/>
				<input type = "input" class="forin" value="" ><span class="hint">�ƻ����ʱ��,��ʽ��2010-01</span><br/>
				<input id="jdjhqry" class="qrybtn" type="button" value="��ѯ">
			</div>
		</li>
		<li>
			<div class="sub_title">��ѯ����¼</div>
			<div class="sub_cont">
				<input type = "input" class="forin" value="" ><input id="jdjlqry" class="qrybtn" type="button" value="��ѯ">
			</div>
		</li>
		<li>
			<div class="sub_title">��ѯ�豸������Ϣ</div>
			<div class="sub_cont">
				<input type = "input" class="forin" value="" ><input id="qzbaqry" class="qrybtn" type="button" value="��ѯ">
			</div>
		</li>
		<li>
			<div class="sub_title">��ѯ��ȫ�������ݿ�</div>
			<div class="sub_cont">
				<input type = "input" class="forin" value="" ><input id="jcbzqry" class="qrybtn" type="button" value="��ѯ">
			</div>
		</li>
	</ul>
</div>
</body>
<script>
$(document).ready(function(){
	$(".qrybtn").click(function(){
		var thisid = $(this).attr("id");
		if(thisid=="subqry"){//--��Ŀ��ѯ
			var qrystr = $(this).siblings(".forin").val();
			qrystr = encodeURI(qrystr);
			location = "qry_sub.jsp?subname="+qrystr;
		}else if(thisid=="deptqry"){//��λ��ѯ
			var qrystr = $(this).siblings(".forin").val();
			qrystr = encodeURI(qrystr);
			location = "qry_dept.jsp?deptname="+qrystr;
		}else if(thisid=="jdjhqry"){//�ල�ƻ���ѯ
			var gcname;
			var jdlb;
			var jhtime;
			$(this).prevAll(".forin").each(function(i){
				switch(i){
				case 0:
					jhtime=encodeURI($(this).val());
				break;
				case 1:
					jdlb=encodeURI($(this).val());
				break;
				case 2:
					gcname=encodeURI($(this).val());
				break;
				}
			});
			alert(gcname+"--"+jdlb+"--"+jhtime);
			//qrystr = encodeURI(qrystr);
			//location = "qry_dept.jsp?deptname="+qrystr;
		}else if(thisid=="jdjlqry"){//�ල��¼��ѯ
		
		}else if(thisid=="qzbaqry"){//���ر������豸��Ϣ��ѯ
		
		}else if(thisid=="jcbzqry"){//����׼��ѯ
		
		}
		
	});
});
</script>
</html>