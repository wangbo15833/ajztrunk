<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--@ page contentType = "text/html; charset=utf-8" --%>
<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%
String count = Tools.nvl0(request.getParameter("count"));
int i_count = Integer.parseInt(count);
i_count++;

String tp_carname 	= Tools.GBK(request.getParameter("tp_carname"));
String Tnum 	= Tools.GBK(request.getParameter("Tnum"));

String StatusName 	= Tools.GBK(request.getParameter("StatusName"));
String StatusCol 	= Tools.nvl(request.getParameter("StatusCol"));

//StatusCol=tp_ft_BIT_two
System.out.println("tp_carname=====================================9999999999999999999===================================="+tp_carname);
System.out.println("StatusName=====================================9999999999999999999===================================="+StatusName);
  EventResponse eventResponse = (EventResponse)request.getAttribute("result"); 
	Query queryCon = null;
	CachedRowSet crs = null;
	CachedRowSet crs_1 = null;
	if(eventResponse != null){
		queryCon = (Query)eventResponse.getBody();  
		crs = (CachedRowSet)queryCon.getConditionBody();
		crs_1 = (CachedRowSet)queryCon.getResult_1Body();
	}
	%>
	
<%
String parameteName 			= null;
String configYPerValue 		= "1";
String configYMinValue 		= "1";
String configYValueCount 	= "1";
String pageFreshTime 		= "5";

while(crs_1.next()){
	parameteName 		    = crs_1.getString("parameteName");
	configYPerValue 		= crs_1.getString("configYPerValue");
    configYMinValue 		= crs_1.getString("configYMinValue");
    configYValueCount 	    = crs_1.getString("configYValueCount");
	pageFreshTime 			= client.core.util.Tools.delNull(crs_1.getString("pageFreshTime"),"5");

}
System.out.println("parameteName========================="+parameteName);
System.out.println("configYPerValue========================="+configYPerValue);
System.out.println("configYMinValue========================="+configYMinValue);
System.out.println("configYValueCount========================="+configYValueCount);
System.out.println("pageFreshTime========================="+pageFreshTime);
%>	
<HTML xmlns:v="urn:schemas-microsoft-com:vml"xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%--
<meta http-equiv="refresh"			content="10;url=MainServlet_sys?fid=FCL00.00.01.12&StatusName=<%=StatusName%>&StatusCol=<%=StatusCol%>&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>&parameteName=<%=StatusCol%>">
--%>
<title>��ι��ʽ�����ո���ɿ��Բ���ϵͳ</title>

<link rev="stylesheet" media="all" href="VMLCurve.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<script language="javascript">
<!--
/* ˵��: JS��VML������ͼ
 * ���ߣ������껪
 * ���䣺fanwsp@126.com
 * ��ҳ������ʱ�� [<a href="http://www.freeage.cn" target="_blank" rel="external">http://www.freeage.cn</a>]
 * ������ת�أ�ʹ�ã��޸��뱣������İ�Ȩ���� 
 */
function VMLCurve(objDiv){
	
	this.objDiv = objDiv;				// obj
	this.toolTips    = "";				// ��ʾ��Ϣ
	this.configXPerValue = 0;
	this.configYPerValue = 0;
	this.configXMinValue = 0;
	this.configYMinValue = 0; 

	this.OriginXValue = 0;				// Բ������
	this.OriginYValue = 0;

	//�����������
	this.group				= null;		// v:group
	this.n 					= 1			// ����
	this.gpWidth			= 600;		// Width
	this.gpHeight			= 450;		// Height

	this.configXTextLeft	= -10;		// ���� X������ֵ������������
	this.configXTextTop 	= 10;		// ���� X������ֵ�Ϸ���X��ľ���

	this.configYLeft 		= 60;		// ���� Y��������ߵľ���
	this.configYTextRight	= 40;		// ���� Y������ֵ��Y���ұߵľ���
	this.configYTextBottom 	= 5;		// ���� Y������ֵ�������±߾���

	//X��ֵ 
	this.configXValue = new Array('1','2','3','4','5','6','7','8','9','10');
	//Y��ֵ
	//this.configYValue = new Array('100','200','300','400','500','600','700','800','900','1000','1100','1200','1300','1400','1500','1600','1700','1800','1900','2000');
	
	//this.configYValue = new Array('0','0','0','0','0');
	var configYValueCount = <%=configYValueCount%>;
	this.configYValue = new Array(configYValueCount);
	
	
	
	// Init BackGround
	this.Background		= null;	
	this.bgColor		= "#F1F1F1";		// BackGround Color

	// Init ToolTip
	this.configToolLeft 			= 15;
	this.configToolTop				= 5;
	this.ToolTip 					= document.createElement("DIV");
	this.ToolTip.className 			= "ToolTip";
	this.ToolTip.id					= "ToolTip";
	this.ToolTip.style.zIndex 		= "100";
	this.ToolTip.style.position		= "absolute";
	this.ToolTip.style.display		= "none";
	this.ToolTip.innerHTML			= "";

	//���õ��ߵ�����
	this.PointRadius = 5; 					//Բ��İ뾶��С
	this.LineSize    = 2;                  	//�ߵĴ�С
	this.PointColor  = "#c30020";			//�����ɫ
	this.LineColor   = "#327023";			//�ߵ���ɫ

	this.Points = "";
	this.PreviousPointY = 0;
	this.PointsYCount   = 0;
 }

// Init
VMLCurve.prototype.init = function(strObj,strTitle){
	
	this.gpcX		= this.gpWidth/this.n;			// coordsize X
	this.gpcY		= this.gpHeight/this.n;			// coordsize Y
	
	this.configXLen	  	= this.gpWidth - this.configYLeft*2+20;	// ���� X�᳤��
	this.configYLen	  	= this.gpHeight- 100;			// ���� Y �᳤��
	this.configXNum		= this.configXValue.length;		// X��̶���
	this.configYNum		= this.configYValue.length;		// Y��̶���
	
	this.configXTop		= this.configYLen+20;			//���� X�������ϱߵľ���
	
	this.configXPerLen	= str2Float((this.configXLen-20)/this.configXNum,2); //���� X��ÿ�̶ȳ���
	this.configYPerLen	= str2Float((this.configYLen-20)/this.configYNum,2); //���� Y��ÿ�̶ȳ���

	
	//��ʼ����������
	this.bgWidth		= this.gpWidth;		// Height
	this.bgHeight		= this.gpHeight;	// Width
	
	if(this.configYPerValue!=0){ 
        var tempArr = new Array(this.configYNum);
        for(var i=0;i<this.configYNum;i++){
        	tempArr[i] = str2Float(this.configYMinValue+this.configYPerValue*i,2);
		}
		this.configYValue = tempArr; 
	}
    	else {
	this.configYPerValue = str2Float((this.configYValue(this.configYNum)-this.configYMinValue)/this.configYNum,2); 
    	} 
    
   	if(this.configXPerValue!=0){ 
        var tempArr = new Array(this.configXNum);
        for(var i=0;i<this.configXNum;i++){
        	tempArr[i] = str2Float(this.configXMinValue+this.configXPerValue*i,2);
        }
        this.configXValue = tempArr;  
	}else{
         //this.configXPerValue = str2Float((this.configXValue(this.configXNum)-this.configXMinValue)/this.configXNum,2); 
    } 
	
    	this.configYValue  = this.configYValue.reverse();	//�������� 
	this.createGroup();
	this.createBackgroud();
	this.createCoordinate();
	this.createXTableLine();
	this.createYTableLine();
	this.createToolTip();
	
	this.setTitle(strTitle);
	this.strObj = strObj;
}

//������ͼ����
VMLCurve.prototype.createGroup = function() {
	this.group = document.createElement("<v:group ID=\"group1\" coordsize=\""+this.gpcX+","+this.gpcY+"\" style=\"z-index:-10;width:"+this.gpWidth+"px;height:"+this.gpHeight+"px\">");
	this.objDiv.insertBefore(this.group);
}

//��䱳��
VMLCurve.prototype.createBackgroud = function() {
	this.Background = document.createElement("<v:rect fillcolor=\"white\" strokecolor=\"black\" style=\"z-index:-8;width:"+this.bgWidth+"px;height:"+this.bgHeight+"px\" />");
	this.Background.insertBefore(document.createElement("<v:fill rotate=\"t\" type=\"gradient\" color2=\""+this.bgColor+"\" />"));
	this.Background.insertBefore(document.createElement("<v:shadow on=\"t\" type=\"single\" color=\"silver\" offset=\"3pt,3pt\" />"));
	this.group.insertBefore(this.Background);
}

//����������
VMLCurve.prototype.createCoordinate = function() {
	var pointX1 = this.configYLeft + "," + this.configXTop;
	var pointX2 = this.configYLeft+this.configXLen + "," + this.configXTop;
	var pointY1 = pointX1;
	var pointY2 = this.configYLeft + "," + eval(this.configXTop-this.configYLen);
	this.createCoordinateLine(pointY1,pointX2);
	this.createCoordinateLine(pointY1,pointY2);
	this.setOriginValue(this.OriginXValue,this.OriginYValue);
}

//����������
VMLCurve.prototype.createTableLine = function(xPoint,yPoint,sTableColor){
	var tempLine = document.createElement("<v:line from=\""+xPoint+"\" to=\""+yPoint+"\" strokeColor=\""+sTableColor+"\" style=\"Z-INDEX:8;POSITION:absolute;/>");
	this.group.insertBefore(tempLine);
	tempLine.insertBefore(document.createElement("<v:stroke dashstyle=\"Solid\" />"));
}

//����������
VMLCurve.prototype.createCoordinateLine = function(xPoint,yPoint){
	var tempLine = document.createElement("<v:line from=\""+xPoint+"\" to=\""+yPoint+"\" strokeColor=\"#FF6600\" strokeweight=\"1px\" style=\"Z-INDEX:8;POSITION:absolute;\"/>");
	this.group.insertBefore(tempLine);
	tempLine.insertBefore(document.createElement("<v:stroke  EndArrow=\"classic\" />"));
}

//�����ı���ʾ��Ϣ
VMLCurve.prototype.createText = function(xLeft,xTop,sText,sClass) {
	var tempObj = document.createElement("<P class=\""+sClass+"\" style=\"Z-INDEX:8;LEFT:"+xLeft+"px;POSITION:absolute;TOP:"+xTop+"px;\"/>");
	tempObj.innerHTML = sText;
	this.group.insertBefore(tempObj);
}

// ����X����������
VMLCurve.prototype.createXTableLine = function(){
	var x1,y1,x2,y2,point1,point2,sTableColor;
	sTableColor = "#CCCCCC";
	for(var i=0;i<this.configXValue.length;i++){
		x1 = eval(this.configYLeft + this.configXPerLen*(i+1));
		y1 = eval(this.configXTop-this.configYLen)+10;
		x2 = x1;
		y2 = eval(this.configXTop+5);
		point1 = x1 + "," + y1; 
		point2 = x2 + "," + y2;
    	this.createTableLine(point1,point2,sTableColor);
    	this.createText(x1+this.configXTextLeft,this.configXTop+this.configXTextTop,this.configXValue[i],"pBlack");
	}
}

//����Y������������
VMLCurve.prototype.createYTableLine = function(){
	var x1,y1,x2,y2,point1,point2,sTableColor;
	for(var i=0;i<this.configYValue.length;i++){
		x1 = eval(this.configYLeft - 5);
		y1 = eval(this.configXTop - this.configYPerLen*(i+1));
		x2 = eval(this.configYLeft + this.configXLen - 10);
		y2 = y1;
		point1 = x1 + "," + y1; 
		point2 = x2 + "," + y2;
    	if(this.configYValue[this.configYValue.length-i-1]=="C2") sTableColor="#FF9900";
		else sTableColor = "#CCCCCC";
		this.createTableLine(point1,point2,sTableColor);
		this.createText(this.configYLeft-this.configYTextRight,y1-this.configYTextBottom,this.configYValue[this.configYValue.length-i-1],"pBlack");
	}
}


//���ñ���
VMLCurve.prototype.setTitle = function(strTitle){
	var tempObj = document.createElement("<div class=\"Title\" style=\"POSITION:absolute;Z-INDEX:9;LEFT:"+40+"px;TOP:"+(this.configXTop+40)+"px;width:"+(this.configXLen)+"px;height:"+(this.gpHeight-this.configXTop-20)+";/>");
	tempObj.innerHTML = strTitle;
	this.group.insertBefore(tempObj);
}

// ��Բ������
VMLCurve.prototype.setOriginValue = function(x,y){
	this.createText(this.configYLeft+this.configXTextLeft,this.configXTop+this.configXTextTop,x,"pBlack");
	this.createText(this.configYLeft-this.configYTextRight,this.configXTop-this.configYTextBottom,y,"pBlack");
}


// ����Բ����������
VMLCurve.prototype.setPointsProp = function(sPointRadius,sLineSize,sPointColor,sLineColor){
	PointRadius = sPointRadius; 		//Բ��İ뾶��С
	LineSize    = sLineSize;          	//�ߵĴ�С
	PointColor  = sPointColor;			//�����ɫ
	LineColor   = sLineColor;			//�ߵ���ɫ
}


// �����������ֵ
VMLCurve.prototype.setPointsValue = function(xValueArr,yValueArr,sValueArr){
    var sValue  = "";
    var xValue  = 0;
	var yValue  = 0;
	var tempLen = 0;
	var thisX   = 0; 
	var thisY   = 0; 
	var tempX   = 0;
    var tempY   = 0; 
	for(var i=0;i<xValueArr.length;i++){
        thisX   = str2Float(xValueArr[i],2); 
        thisY   = str2Float(yValueArr[i],2); 
        sValue  = sValueArr[i]; 
        //tempX   = str2Float((thisX - this.OriginXValue)/this.configXPerValue,2);
		tempY   = str2Float((thisY - this.OriginYValue)/this.configYPerValue,2);
		xValue  = str2Float(this.configYLeft + str2Float(thisX*this.configXPerLen,2),2);
		yValue  = str2Float(this.configXTop - str2Float(tempY*this.configYPerLen,2),2);
		sValue  += "<br>����ֵ[X,Y]:[" + xValue + "," + yValue + "]";
		sValue  += "<br>ʵ��ֵ[X,Y]:[" + thisX + "," + thisY + "]";
        //this.PointsYCount  += str2Float(yValueArr[i],2);
		//this.PreviousPointY = yValueArr[i];		
		this.Points = this.Points + xValue + "," + yValue + " ";	
		this.createPoint(xValue,yValue,sValue);
	}
	this.createCurveLine();
	this.PreviousPointY = 0;
	this.Points         = 0;
	this.PointsYCount   = 0;
}


// create Point
VMLCurve.prototype.createPoint = function(sLeft,sTop,sText){
	//����Բ�������,�õ����Ϸ��������
	var xLeft  = sLeft - this.PointRadius;
	var xTop   = sTop  - this.PointRadius;
	var tempOval = document.createElement("<v:oval style=\"POSITION:absolute;Z-INDEX:12;LEFT:"+xLeft+"px;TOP:"+xTop+"px;width:"+2*this.PointRadius+";height:"+2*this.PointRadius+";cursor:hand;\" stroked=\"f\" fillcolor=\""+this.PointColor+"\" strokeweight=\"1px\" onmousemove=\""+this.strObj+".setToolTip('block','" + sText + "'," + sLeft + "," + sTop + ");\" onmouseout=\""+this.strObj+".setToolTip('none','');\"/>");
	group1.insertBefore(tempOval);
}

//������Ϊ���껭��
VMLCurve.prototype.createCurveLine = function(){
	var tempLine = document.createElement("<v:PolyLine Points=\""+ this.Points +"\" style=\"Z-INDEX:11;POSITION:absolute;\" strokeweight=\"2px\" filled=\"f\" />");
	var newStroke = document.createElement("<v:stroke dashstyle='solid' color='"+this.LineColor+"'/>");
	group1.insertBefore(tempLine);
	tempLine.insertBefore(newStroke);
}


VMLCurve.prototype.createToolTip = function(){
	this.group.insertBefore(this.ToolTip);
}

VMLCurve.prototype.setToolTip = function(sVisitable,sContent,x,y){
	this.ToolTip.style.pixelLeft 	= x + this.configToolLeft;
	this.ToolTip.style.pixelTop		= y + this.configToolTop;
	this.ToolTip.style.display		= sVisitable;
	if(this.ToolTip.innerHTML==""){
		this.ToolTip.innerHTML = sContent; 
	}
	if(sContent==""){
		this.ToolTip.innerHTML = "";
	}
}


/*���´�����������,��Ҫ�����Ƕ����ֽ��и�ʽ��
 *ԭ���߲��꣬�����½⡣ 
 */ 
/*********************************
* �ַ���ת��Ϊ����(""-->0)as_type--str,num
* ����˵��:
as_str--ת�����ַ���
ai_digit--ת����С��λ��(null--������С��λ��,0--ת��Ϊ����,>0��С��λ��ת��)
as_type--ת���󷵻ص�����(null,"num"--ת��Ϊ��������,"str"--ת��Ϊ�ַ���
(��С����ʽ������ַ���)
* ����:
* str2float("10.2124568795")����float����10.2124568795
* str2float("10.6",0)����Int����11(ʹ����������ķ���)
* str2float("10.2",2)����float����10.1
* str2float("10.2",2,"str")����String����"10.20"(��С��λ����ʽ���ַ���)
* str2float("10.216",2)����float����10.22
* str2float("10.216",2,"str")����String����"10.22"
*********************************
*/
function str2Float(as_str,ai_digit,as_type)
{
   var fdb_tmp = 0;
   var fi_digit = 0;
   var fs_digit = "1";
   var fs_str = "" + as_str;
   var fs_tmp1 = "";
   var fs_tmp2 = "";
   var fi_pos = 0;
   var fi_len = 0;
   fdb_tmp = parseFloat(isNaN(parseFloat(fs_str))?0:fs_str);
   
   switch (true)
   {
	  case (ai_digit==null):       //���ı�ֵ,ֻת��Ϊ����
		 fdb_tmp = fdb_tmp;
		 break;
	  case (ai_digit==0):          //ȡ������
		 fdb_tmp = Math.round(fdb_tmp);
		 break;
	  case (ai_digit>0):            //���մ����С����λ����������ȡֵ
		 for (var i=0;i<ai_digit;i++) fs_digit +="0";
		 fi_digit = parseInt(fs_digit);
		 fdb_tmp = Math.round(fdb_tmp * fi_digit) / fi_digit;
		 if (as_type=="str")
		 {
			fs_tmp1 = fdb_tmp.toString();
			fs_tmp1 +=((fs_tmp1.indexOf(".")!=-1)?"":".") + fs_digit.substr(1);
			fi_pos = fs_tmp1.indexOf(".") + 1 + ai_digit;
			fdb_tmp = fs_tmp1.substr(0,fi_pos);
		 }
		break;
   }
   return fdb_tmp;
} 
//-->
</script>

<style type="text/css">
<!--
v\:* { behavior: url(#default#VML);} o\:* { behavior: url(#default#VML);}
body {
	margin:0px;
	padding:0px;
	font-size:12px;
	text-align:left
}

.pBlack {

	font-size:12px;
	margin-left:-10px;
}

.pRed {
	font-weight:bold;
	font-size:12px;
	color:#FF0000;
}

/*����������ʽ*/
.pMonth {
	font-size:66px;
	font-family:"����";
	color:#CCCCCC;
	letter-spacing: 3px;
}

/*��ʾ��Ϣ��ʽ*/
.ToolTip {
	padding:4px;
	margin:4px;
	background-color: #CCCCCC;
	border: 1px solid #0066FF;
	text-align:left;
}

/*������ʾ��ʽ*/
.Title {
	font-family:"����", "���ķ���";
	font-size:16px;
	text-align:center;
	font-weight:bold;
	color:#0da51f;
	vertical-align:middle;
}

.curveBody{
	margin:0;
	padding:0;
	height:20px;
	font-size:12px;
}

.curveForm{
	margin:0;
	padding:0;
	height:20px;
	font-size:12px;
}
-->
</style>
</head>
<script>
function setPara(){
	
	v_pl= document.getElementById('autoFlash_frq').value;
	alert("�޸�ʱ�䵽"+v_pl);
}
</script>
<body class="curveBody">
<div id="man_zone" >


<br><br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td height="20">
			<div align="center" id="curve"></div>
		</td>
	</tr>
</table>

<script language="javascript">
/**
*�ܹ����� x����ʮ���� y����20����
*��̬Ч�� �����
*
*   @NOTE
*/


	//�������߶���
	var vc = new VMLCurve(document.all.curve);
	
	//����X����ֵ����������
	vc.configXValue = new Array('10:10:32','10:10:33','10:10:34','10:10:35','10:10:36','10:10:37','10:10:38','10:10:39','10:10:40','10:10:41');
	
	//����Y������
	vc.configYPerValue = <%=configYPerValue%>;
  vc.configYMinValue = <%=configYMinValue%>; 

	
	//���������õ�ĺ��ݱ�ֵ����ʾ��Ϣ
	var xValueArr = new Array(1,2,3,4,5,6,7,8,9,10);			//X�����ݣ�
	var yValueArr = new Array(320,280,801,550,600,700,800,720,190,940);	//Y������
	
	
	<%
	String StatusCol_value 	= null;
	String StatusTime_value = null;
	int j = 0;
	while(crs.next()){
	
		StatusCol_value 	= Tools.nvl0(crs.getString(StatusCol));
		StatusTime_value 	= crs.getString("tp_testtime");
		
		System.out.println("StatusCol_value==============================="+StatusCol_value);
		%>
		//ary_data_value[<%=9-j%>] 	= '<%=StatusCol_value%>';
		//ary_data_time[<%=9-j%>] 	= '<%=getHMS(StatusTime_value)%>';
		yValueArr[<%=9-j%>] 	= '<%=StatusCol_value%>';
		vc.configXValue[<%=9-j%>] 	= '<%=getHMS(StatusTime_value)%>';
		<%
		j++;
	}
	%>
<%!
public static String getHMS(String stime){
	
	if(stime.length()<17){
		return stime;
	}
	else{
		int spaceIndex = stime.indexOf(" ");
		stime = stime.substring(spaceIndex,spaceIndex+6);
	}
	return stime;
}
%>
	
	
	
	vc.init("vc","<%=StatusName%>");
	
	var i;
	for(i=0;i<10;i++)	
	{
		//yValueArr[i]+=parseInt(Math.random()*100+1);	//���������
	}
	var sValueArr = new Array('��1��','��2��','��3��','��4��','��5��','��6��','��7��','��8��','��9��','��10��');	//��ʾ��Ϣ
	//����Բ�������
	vc.setPointsProp(20,1,'#FF6600','#FF6600');	//������ɫ
	vc.setPointsValue(xValueArr,yValueArr,sValueArr);	
</script>

<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

<div style="padding-left:5px;">�Զ�ˢ��Ƶ��<input name="autoFlash_frq" type="text"  value='<%=pageFreshTime%>' style="width:30px;"/>��</div>
</div>
</body>
</html>

<script>
function autoFresh(){
	location = "MainServlet_sys?fid=FCL00.00.01.12&StatusName=<%=StatusName%>&StatusCol=<%=StatusCol%>&tp_carname=<%=tp_carname%>&Tnum=<%=Tnum%>&parameteName=<%=StatusCol%>&v_pl=<%=pageFreshTime%>";
}
var v_pl = <%=pageFreshTime%>;
setTimeout(autoFresh, v_pl*1000);
</script>

