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
<%@ include  file='../identification.jsp' %> 
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet"  href="./css/common.css" type="text/css" />
<script language="JScript" type="text/javascript"  src="js/jquery.min.js"> </script>
<script type="text/javascript" src="./js/map.js"></script>
 <link rel="stylesheet" href="js/jquery-ui.css">
<script src="js/jquery-ui-src.js"></script>
<script language="JScript" type="text/javascript"  src="js/jquery.ui.datepicker-zh-CN.js"> </script>
<style>
#drag_window{position:absolute; height:300px; width:500px; top:150px; background:#fff; border:1px solid #ccc; font-size:12px; box-shadow:2px 2px 3px #999; -moz-user-select:none;z-index:-10; }
#drag_window_title{background:#eee; border-bottom:1px solid #ccc; line-height:24px;text-align:center;}
#drag_window_title h4{ margin:0px; padding:0px;font-size:20px;}
#drag_window_main{padding:4px;overflow:scroll-y;}
#drag_window_qry{text-align:center;}
</style>
<script>
$(function()
{
	drag("drag_window_title","drag_window");
});
/* ��ק */
	function drag(dragDiv,tagDiv){		//���������
		
		var e,offsetT,offsetL,downX,downY; 
		$("#"+dragDiv).css('cursor','move');		
		$("#"+dragDiv).mousedown(function(e)//����갴�µ�ʱ��
		{
			$('#'+tagDiv).bind('selectstart',function(){return false;});
			e = e||window.event;
			offsetT = $($('#'+tagDiv)).get(0).offsetTop;//���TOP
			offsetL =$($('#'+tagDiv)).get(0).offsetLeft;//���LEFT
			downX = e.clientX;//��������ʱ���TOP
			downY = e.clientY;//�������ʱ���LEFT
			$(document).mousemove (function(e){//����ƶ���ʱ��
				e = e||window.event;
				$('#'+tagDiv).css('top',offsetT + (e.clientY - downY) + "px");
				$('#'+tagDiv).css('left',offsetL + (e.clientX - downX) + "px");
			});
		}).mouseup(function(e){//������ɿ���ʱ��
				$('#'+tagDiv).unbind('selectstart');
				$(document).unbind('mousemove');
			});	
	}
</script>
<script>
function showlist(){
	try{
		if($("#drag_window").css("z-index")!="9" && $("#drag_window").css("z-index")!="-9"){
			var mw = $("#drag_window")[0].clientWidth;
			var mh = $("#drag_window")[0].clientHeight;
			var dh = document.body.clientHeight;
			var dw = document.body.clientWidth;
			var dl = $("#man_zone")[0].scrollLeft;
			var dt = $("#man_zone")[0].scrollTop;
			$("#drag_window").css("top",(dh-dt-mh)/2);
			$("#drag_window").css("left",(dw-dl-mw)/2);
			$("#drag_window").css("z-index",9);
		}else{
			$("#drag_window").css("z-index",$("#drag_window").css("z-index")=="9"?"-9":"9");
		}
	}catch(e){
		alert(e.description );
	}
}
</script>
<script>
//��ֹð�� ��������ط�������ʧ��
$(document).ready(function(){
	$("#rec_named").click(function(){showlist();return false;});
	$(document).click(function(){$("#drag_window").css("z-index",-9);});
	$("#drag_window").click(function(){return false;});
});
</script>
<script>
//--------------------------------------
var xmlhttp;
var json;
function loadXMLDoc(url,cfunc){
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}else{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=cfunc;
	xmlhttp.open("post",url,true);
	xmlhttp.send();
}
function myFunction(dept,realname){
// alert("in my functrion 1 ");
	var mode="getcontact";
	var reqStr="./ajax/getcontact.jsp?_="+Math.round(Math.random()*100000)+"&mode="+mode+"&dept="+encodeURI(dept)+"&realname="+encodeURI(realname);
	//alert(reqStr);
	loadXMLDoc(reqStr,function(){
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			var str = (xmlhttp.responseText);
			var inStr = "";
			str=(str).replace(/[\r|\n]/gm,'');
			json = eval("("+str+")");
			var tempdept;
			var temprealname;
			var tempaccount;
			for ( i=0;i<json.length;i++){
				tempdept = json[i].dept;
				temprealname = json[i].realname;
				tempaccount = json[i].account;
				tempdept = tempdept.replace(new RegExp(dept,"gm"),"<font color='blue'>"+dept+"</font>");
				temprealname = temprealname.replace(new RegExp(realname,"gm"),"<font color='blue'>"+realname+"</font>");
				inStr=inStr +"<li><a onclick=\"filltab('"+ json[i].dept+"','"+ json[i].realname+"','"+ json[i].account+"')\">"+tempdept+"  :  "+temprealname+"</li>\n";
			}
			inStr="<ul>\n"+inStr+"\n</ul>";
			 $("#drag_window_main").html(inStr);
			 $("#drag_window_main").css({"overflow-y":"scroll","height":"240px"});
		}
	  });
}
</script>
<script>
$(document).ready(function(){
	$("#confirmbtn").click(function(){
		myFunction($.trim($("#drag_con_dept").val()),$.trim($("#drag_con_name").val()));
	});
	//$("#rec_name").val("");
	//$("#send").attr("disabled",true);
	
	

	var rec_named="";
	var rec_name = $("#rec_name").val();
	var rec_nameAr = new Array();
	var rec_nameArS = new Array();
	rec_nameAr = rec_name.split(";");
	//alert(rec_nameAr.length );
	for (var i = 0 ; i < rec_nameAr.length ; i++){
		if(rec_nameAr[i]!=""){
			rec_nameArS.push(rec_nameAr[i]);
		}
	}
	for (var i = 0 ; i < rec_nameArS.length ; i++){
		rec_named = rec_named+rec_nameArS[i].split(",")[1]+";";
	}
	$("#rec_named").html(rec_named);
});
</script>
<script>
function filltab(dept,realname,account){
	var rec_named="";
	var rec_name = $("#rec_name").val();
	//alert($("#rec_name").val());
	var rec_nameAr = new Array();
	var rec_nameArS = new Array();
	var isContain = false;
	rec_nameAr = rec_name.split(";");
	//alert(rec_nameAr.length );
	for (var i = 0 ; i < rec_nameAr.length ; i++){
		if (rec_nameAr[i].indexOf(account)>-1){
			isContain = true;
		}else if(rec_nameAr[i]!=""){
			rec_nameArS.push(rec_nameAr[i]);
		}
	}
	if(!isContain){
		rec_nameArS.push(dept+","+realname+","+account);
	}
	rec_name=rec_nameArS.join(";");
	$("#rec_name").val(rec_name);
	
	for (var i = 0 ; i < rec_nameArS.length ; i++){
		rec_named = rec_named+rec_nameArS[i].split(",")[1]+";";
	}
	$("#rec_named").html(rec_named);
	if($("#rec_name").val()==""){
		$("#send").attr("disabled",true);
	}else{
		$("#send").attr("disabled",false);
	}
}
</script>
</head>


<%
String titleName="������Ϣ�޸�";
String flag1 =(String)request.getAttribute("flag1"); 
try{

	HashMap hp_pri = (HashMap)(request.getAttribute("hp_pri"));
	System.out.println(hp_pri.toString());
	String filter_str = Tools.nvl((String)(hp_pri.get("filter_str")));
	String mypri = Tools.nvl((String)(hp_pri.get("mypri")));
	CachedRowSet crs_user = (CachedRowSet)hp_pri.get("crs_user");
  if (flag1==null || flag1.equals(""))
  {  
	 flag1 ="false" ;
	  EventResponse eventResponse = (EventResponse)request.getAttribute("result");  
	  Query queryCon = (Query)eventResponse.getBody(); 
	  CachedRowSet crs = null;
	  if(queryCon!=null)
	  {
		crs = (CachedRowSet)queryCon.getConditionBody();
		crs.next();
	  }
	CachedRowSet crs_cols = (CachedRowSet)request.getAttribute("crs_cols");
	ArrayList al_colname = new ArrayList();
	ArrayList al_colnamec = new ArrayList();
	ArrayList al_datasrc = new ArrayList();
	ArrayList al_datasrctype = new ArrayList();

	
	
	while(crs_cols.next()){
		if(Tools.nvl(crs_cols.getString("edit_disp")).equals("1")){	
			al_colname.add((String)crs_cols.getString("colname"));
			al_colnamec.add((String)crs_cols.getString("colnamec"));
			al_datasrc.add((String)crs_cols.getString("datasrc"));
			al_datasrctype.add((String)crs_cols.getString("datasrctype"));
		}
	}
 %>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0"  >
<div id="man_zone">
<form name="formHead" action="./MainServlet_sys" target="_self" method="post" onKeyDown="if(event.keyCode==13)event.keyCode=9"  >
<!-- <TABLE class=table style="BORDER-COLLAPSE: collapse" borderColor=#6595d6 cellSpacing=0 cellPadding=3 width="90%" align=center bgColor=#ffffff border=1>-->
	<TABLE class=table style="BORDER-COLLAPSE: collapse" borderColor=#dedfd7 cellSpacing=0 cellPadding=3 width="100%" align=center bgColor=#ffffff border=1>
	<tr>
		<td bgColor=#f0f0f0 height=25 colspan="4" align="center" class="text2"><font size="+1"><%=titleName%></font></td>
	</tr>
	<input type="hidden" name="fid" id="fid" value="UII00.07.02.04"><input type="hidden" name="id" id="id" value="<%=crs.getString("id")%>">
		<%
	int ik = 0;
	int jk = 0;
	while(ik<al_colname.size()){
			if(jk%2==0){
		%>
	<tr><%}%>
		
		<%if(((String)al_datasrctype.get(ik)).replaceAll(" ","").equals("") ||((String)al_datasrctype.get(ik)).equals("check")){
		%><td height="20" width="9%" align="right" class="text2"><%=(String)al_colnamec.get(ik)%>��</td><td width="41%"><input type="text" name="<%=al_colname.get(ik).toString()%>" id="<%=al_colname.get(ik).toString()%>"  size="25"<%if (al_colname.get(ik).toString().equals("id")){%> readonly="readonly"  style="background-color:#CCC" <%}%>value="<%=Tools.nvl(crs.getString(al_colname.get(ik).toString()))%>"/>&nbsp;&nbsp;</td>
		<%}else if(((String)al_datasrctype.get(ik)).equals("popList")){
		%><td height="20" width="9%" align="right" class="text2"><%=(String)al_colnamec.get(ik)%>��</td><td width="41%"><select id="<%=al_colname.get(ik).toString()%>"  name="<%=al_colname.get(ik).toString()%>" style="width:190px;">
			<option    value="">&nbsp;&nbsp;-=&nbsp;&nbsp;��ѡ��&nbsp;&nbsp;=-&nbsp;&nbsp;</option>
			<%=com.zagerbone.util.Tools.popListWithSelect((String)al_datasrc.get(ik),crs.getString(al_colname.get(ik).toString()))%>
			</select></td>
		<%}else if(((String)al_datasrctype.get(ik)).equals("getmap")){
		%><td height="20" width="9%" align="right" class="text2"><%=(String)al_colnamec.get(ik)%>��</td><td width="41%"><input type="text"  id="<%=al_colname.get(ik).toString()%>"  name="<%=al_colname.get(ik).toString()%>" id="<%=al_colname.get(ik).toString()%>" ondblclick="showmap()" size="25" value="<%=Tools.nvl(crs.getString(al_colname.get(ik).toString()))%>"/>˫�� ��/���� ��ͼ</td> 
		<%}else if(((String)al_datasrctype.get(ik)).equals("calendar")){
		%><td height="20" width="9%" align="right" class="text2"><%=(String)al_colnamec.get(ik)%>��</td><td width="41%"><input type="text" onfocus="calendar()"  id="<%=al_colname.get(ik).toString()%>"   name="<%=al_colname.get(ik).toString()%>" size="25" value="<%=Tools.nvl(crs.getString(al_colname.get(ik).toString()))%>"/>&nbsp;&nbsp;</td> 
		<%}else if(((String)al_datasrctype.get(ik)).equals("textarea")){
		if(jk%2==1){
		%><td  width="9%"></td><td  width="41%"></td></tr><%
		}
		%><td height="60" width="9%" align="right" class="text2"><%=(String)al_colnamec.get(ik)%>��</td><td colspan="3" width="91%"><textarea cols="100%" rows="10" id="<%=al_colname.get(ik).toString()%>" name="<%=al_colname.get(ik).toString()%>" size="25"><%=Tools.nvl(crs.getString(al_colname.get(ik).toString())).replaceAll("%40%40","\r\n")%></textarea>&nbsp;&nbsp;</td> 
		<%jk=1; }else if(((String)al_datasrctype.get(ik)).equals("moreline")){
		if(jk%2==1){
		%><td  width="9%"></td><td  width="41%"></td></tr><%
		}		
		%><td height="60" width="9%" align="right" class="text2"><%=(String)al_colnamec.get(ik)%>��</td><td colspan="3" width="91%" >��������ռ���:<div id="rec_named" style="padding: 3 3 3 3 ;background-color:#ddddff;height:54px;width:96%"><%=Tools.nvl(crs.getString(al_colname.get(ik).toString())).replaceAll("%40","\r\n")%></div></td><input type="hidden" id="rec_name"  name="rec_name" value="<%=Tools.nvl(crs.getString(al_colname.get(ik).toString())).replaceAll("%40","\r\n")%>"/>
		<%jk=1;
		}
		ik++;
		jk++;
		if(jk%2==0){
		%>
	</tr><%}
		}
		if(jk%2==1){
		%><td height="20" width="9%" align="right" class="text2">&nbsp;&nbsp;</td>
		<td width="41%">&nbsp;&nbsp;</td>
	</tr>		
		<%
		}
		%>
  <tr>
  	<td align="center" colspan="4">
		<input id="send"  type="button" name="button" value="�� ��" style="width:80;height:23 " onClick="doSave();">&nbsp;&nbsp;
		<input type="button" name="button" value="�� ��" style="width:80;height:23 " onClick="doNewSave();">&nbsp;&nbsp;
		<input type="button" name="button" value="ȡ ��" style="width:80;height:23 " onClick="javascript:history.go(-1);">
	</td>
  </tr>
</table>
</form>
</div>
</body>
     <div id="drag_window">
    	<div id="drag_window_title" >
        	<h4>����б���ѡ���ռ���</h4>
        </div>
		<div id="drag_window_qry">��λ��
		<input id="drag_con_dept" />������
		<input id="drag_con_name" />
		<input type="button" id="confirmbtn" value="��ѯ" />
		</div >
        <div id="drag_window_main">
        	<ul>
            	<li>����������ַ�</li>
            </ul>
        </div>
    </div>
</html>
<iframe id="submitframe" name="submitframe" width="100%" height="100" src="" frameborder="NONE" style="display:none"></iframe>
</iframe> 
<script language=javascript>
  function doSave()
  {
    if(!window.confirm("�Ƿ��޸ĵ���Ϣ�����·����б��е��ռ��ˣ�") && !document.getElementById('rec_name').value==""){
  return;
  }
  if(document.getElementById('rec_name').value==""){
	if(!window.confirm("�ռ����б�Ϊ�գ���Ϣ����ԭ���ռ��˵���Ϣ�б���ɾ����ȷ��Ҫ�޸���")){
		return;
	}
  }
  if(document.getElementById("cont")!=null){
	s=document.getElementById("cont").value;
	s=s.replace(/[\r\n]/gm,"%40");
	document.getElementById("cont").value=s;}
    formHead.target = "submitframe";
	formHead.submit();
	//alert("���ύ");
  }
  function doNewSave()
  {
  if(document.getElementById("cont")!=null){
	s=document.getElementById("cont").value;
	s=s.replace(/[\r\n]/gm,"%40");
	document.getElementById("cont").value=s;}
    formHead.target = "submitframe";
	document.getElementById("fid").value="UII00.07.02.03";
	formHead.submit();
	//alert("���ύ");
  }
  function doClose()
  {
  	parent.returnValue="";
    this.close();
  }

  function checkfilter()
  {
	<%if(Integer.parseInt(mypri)>=3){%>
		<%
		Map<String,String> mp_filter = new HashMap<String,String>();
		String ai[] = filter_str.split("&");
		for(int j = 1 ; j<ai.length ;j++){
			String bi[] = ai[j].split("="); 
			mp_filter.put(bi[0],bi[1]);
		}
		
		for (String key : mp_filter.keySet()){
		
		%>if (document.getElementById('<%=key%>')!=null){
			document.getElementById('<%=key%>').value='<%=mp_filter.get(key)%>';
			document.getElementById('<%=key%>').readOly=true;
			document.getElementById('<%=key%>').style.color='#ccc';
		}<%
		}
		}
		%>
  
  }
  checkfilter();
</script>
<%
crs.close();
crs_cols.close();
}else{
	%>
<script language="javascript">
	function  checknow()
	{
		if(<%=flag1%>){
		alert("�޸ĳɹ���");
		window.top.indexFrame.frames['manFrame'].location = 'MainServlet_sys?fid=UII00.07.02.01<%=Integer.parseInt(mypri)==4?"":filter_str%>';
		}
	}
	checknow();
</script>
<%
}

}
catch (Exception exception)
{
exception.printStackTrace();
}
%>