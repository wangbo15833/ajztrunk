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
<title>半喂入式联合收割机可靠性测试系统</title>

<link rev="stylesheet" media="all" href="VMLCurve.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<script language="javascript">
<!--
/* 说明: JS和VML画曲线图
 * 作者：梦想年华
 * 邮箱：fanwsp@126.com
 * 主页：自由时代 [<a href="http://www.freeage.cn" target="_blank" rel="external">http://www.freeage.cn</a>]
 * 申明：转载，使用，修改请保存上面的版权申明 
 */
function VMLCurve(objDiv){
	
	this.objDiv = objDiv;				// obj
	this.toolTips    = "";				// 提示信息
	this.configXPerValue = 0;
	this.configYPerValue = 0;
	this.configXMinValue = 0;
	this.configYMinValue = 0; 

	this.OriginXValue = 0;				// 圆点坐标
	this.OriginYValue = 0;

	//定义区域参数
	this.group				= null;		// v:group
	this.n 					= 1			// 倍数
	this.gpWidth			= 600;		// Width
	this.gpHeight			= 450;		// Height

	this.configXTextLeft	= -10;		// 定义 X轴坐标值左边离坐标距离
	this.configXTextTop 	= 10;		// 定义 X轴坐标值上方离X轴的距离

	this.configYLeft 		= 60;		// 定义 Y轴距对象左边的距离
	this.configYTextRight	= 40;		// 定义 Y轴坐标值离Y轴右边的距离
	this.configYTextBottom 	= 5;		// 定义 Y轴坐标值离坐标下边距离

	//X轴值 
	this.configXValue = new Array('1','2','3','4','5','6','7','8','9','10');
	//Y轴值
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

	//设置点线的属性
	this.PointRadius = 5; 					//圆点的半径大小
	this.LineSize    = 2;                  	//线的大小
	this.PointColor  = "#c30020";			//点的颜色
	this.LineColor   = "#327023";			//线的颜色

	this.Points = "";
	this.PreviousPointY = 0;
	this.PointsYCount   = 0;
 }

// Init
VMLCurve.prototype.init = function(strObj,strTitle){
	
	this.gpcX		= this.gpWidth/this.n;			// coordsize X
	this.gpcY		= this.gpHeight/this.n;			// coordsize Y
	
	this.configXLen	  	= this.gpWidth - this.configYLeft*2+20;	// 定义 X轴长度
	this.configYLen	  	= this.gpHeight- 100;			// 定义 Y 轴长度
	this.configXNum		= this.configXValue.length;		// X轴刻度数
	this.configYNum		= this.configYValue.length;		// Y轴刻度数
	
	this.configXTop		= this.configYLen+20;			//定义 X轴距对象上边的距离
	
	this.configXPerLen	= str2Float((this.configXLen-20)/this.configXNum,2); //定义 X轴每刻度长度
	this.configYPerLen	= str2Float((this.configYLen-20)/this.configYNum,2); //定义 Y轴每刻度长度

	
	//初始化背景参数
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
	
    	this.configYValue  = this.configYValue.reverse();	//倒序数组 
	this.createGroup();
	this.createBackgroud();
	this.createCoordinate();
	this.createXTableLine();
	this.createYTableLine();
	this.createToolTip();
	
	this.setTitle(strTitle);
	this.strObj = strObj;
}

//建立画图区域
VMLCurve.prototype.createGroup = function() {
	this.group = document.createElement("<v:group ID=\"group1\" coordsize=\""+this.gpcX+","+this.gpcY+"\" style=\"z-index:-10;width:"+this.gpWidth+"px;height:"+this.gpHeight+"px\">");
	this.objDiv.insertBefore(this.group);
}

//填充背景
VMLCurve.prototype.createBackgroud = function() {
	this.Background = document.createElement("<v:rect fillcolor=\"white\" strokecolor=\"black\" style=\"z-index:-8;width:"+this.bgWidth+"px;height:"+this.bgHeight+"px\" />");
	this.Background.insertBefore(document.createElement("<v:fill rotate=\"t\" type=\"gradient\" color2=\""+this.bgColor+"\" />"));
	this.Background.insertBefore(document.createElement("<v:shadow on=\"t\" type=\"single\" color=\"silver\" offset=\"3pt,3pt\" />"));
	this.group.insertBefore(this.Background);
}

//建立坐标轴
VMLCurve.prototype.createCoordinate = function() {
	var pointX1 = this.configYLeft + "," + this.configXTop;
	var pointX2 = this.configYLeft+this.configXLen + "," + this.configXTop;
	var pointY1 = pointX1;
	var pointY2 = this.configYLeft + "," + eval(this.configXTop-this.configYLen);
	this.createCoordinateLine(pointY1,pointX2);
	this.createCoordinateLine(pointY1,pointY2);
	this.setOriginValue(this.OriginXValue,this.OriginYValue);
}

//建立坐标线
VMLCurve.prototype.createTableLine = function(xPoint,yPoint,sTableColor){
	var tempLine = document.createElement("<v:line from=\""+xPoint+"\" to=\""+yPoint+"\" strokeColor=\""+sTableColor+"\" style=\"Z-INDEX:8;POSITION:absolute;/>");
	this.group.insertBefore(tempLine);
	tempLine.insertBefore(document.createElement("<v:stroke dashstyle=\"Solid\" />"));
}

//画坐标轴线
VMLCurve.prototype.createCoordinateLine = function(xPoint,yPoint){
	var tempLine = document.createElement("<v:line from=\""+xPoint+"\" to=\""+yPoint+"\" strokeColor=\"#FF6600\" strokeweight=\"1px\" style=\"Z-INDEX:8;POSITION:absolute;\"/>");
	this.group.insertBefore(tempLine);
	tempLine.insertBefore(document.createElement("<v:stroke  EndArrow=\"classic\" />"));
}

//创建文本提示信息
VMLCurve.prototype.createText = function(xLeft,xTop,sText,sClass) {
	var tempObj = document.createElement("<P class=\""+sClass+"\" style=\"Z-INDEX:8;LEFT:"+xLeft+"px;POSITION:absolute;TOP:"+xTop+"px;\"/>");
	tempObj.innerHTML = sText;
	this.group.insertBefore(tempObj);
}

// 创建X坐标网格线
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

//创建Y轴坐标网格线
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


//设置标题
VMLCurve.prototype.setTitle = function(strTitle){
	var tempObj = document.createElement("<div class=\"Title\" style=\"POSITION:absolute;Z-INDEX:9;LEFT:"+40+"px;TOP:"+(this.configXTop+40)+"px;width:"+(this.configXLen)+"px;height:"+(this.gpHeight-this.configXTop-20)+";/>");
	tempObj.innerHTML = strTitle;
	this.group.insertBefore(tempObj);
}

// 画圆点坐标
VMLCurve.prototype.setOriginValue = function(x,y){
	this.createText(this.configYLeft+this.configXTextLeft,this.configXTop+this.configXTextTop,x,"pBlack");
	this.createText(this.configYLeft-this.configYTextRight,this.configXTop-this.configYTextBottom,y,"pBlack");
}


// 设置圆点坐标属性
VMLCurve.prototype.setPointsProp = function(sPointRadius,sLineSize,sPointColor,sLineColor){
	PointRadius = sPointRadius; 		//圆点的半径大小
	LineSize    = sLineSize;          	//线的大小
	PointColor  = sPointColor;			//点的颜色
	LineColor   = sLineColor;			//线的颜色
}


// 设置纵坐标的值
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
		sValue  += "<br>坐标值[X,Y]:[" + xValue + "," + yValue + "]";
		sValue  += "<br>实际值[X,Y]:[" + thisX + "," + thisY + "]";
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
	//根据圆点的坐标,得到左上方点的坐标
	var xLeft  = sLeft - this.PointRadius;
	var xTop   = sTop  - this.PointRadius;
	var tempOval = document.createElement("<v:oval style=\"POSITION:absolute;Z-INDEX:12;LEFT:"+xLeft+"px;TOP:"+xTop+"px;width:"+2*this.PointRadius+";height:"+2*this.PointRadius+";cursor:hand;\" stroked=\"f\" fillcolor=\""+this.PointColor+"\" strokeweight=\"1px\" onmousemove=\""+this.strObj+".setToolTip('block','" + sText + "'," + sLeft + "," + sTop + ");\" onmouseout=\""+this.strObj+".setToolTip('none','');\"/>");
	group1.insertBefore(tempOval);
}

//以两点为坐标画线
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


/*以下代码来自网络,主要功能是对数字进行格式化
 *原作者不详，敬请谅解。 
 */ 
/*********************************
* 字符串转换为数字(""-->0)as_type--str,num
* 参数说明:
as_str--转换的字符串
ai_digit--转换的小数位数(null--不限制小数位数,0--转换为整型,>0按小数位数转换)
as_type--转换后返回的类型(null,"num"--转换为数字类型,"str"--转换为字符串
(按小数格式化后的字符串)
* 例如:
* str2float("10.2124568795")返回float类型10.2124568795
* str2float("10.6",0)返回Int类型11(使用四舍五入的方法)
* str2float("10.2",2)返回float类型10.1
* str2float("10.2",2,"str")返回String类型"10.20"(按小数位数格式化字符串)
* str2float("10.216",2)返回float类型10.22
* str2float("10.216",2,"str")返回String类型"10.22"
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
	  case (ai_digit==null):       //不改变值,只转换为数字
		 fdb_tmp = fdb_tmp;
		 break;
	  case (ai_digit==0):          //取得整数
		 fdb_tmp = Math.round(fdb_tmp);
		 break;
	  case (ai_digit>0):            //按照传入的小数点位数四舍五入取值
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

/*横坐标轴样式*/
.pMonth {
	font-size:66px;
	font-family:"黑体";
	color:#CCCCCC;
	letter-spacing: 3px;
}

/*提示信息样式*/
.ToolTip {
	padding:4px;
	margin:4px;
	background-color: #CCCCCC;
	border: 1px solid #0066FF;
	text-align:left;
}

/*标题显示样式*/
.Title {
	font-family:"宋体", "华文仿宋";
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
	alert("修改时间到"+v_pl);
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
*总共设置 x方向十个点 y方向20个点
*动态效果 随机数
*
*   @NOTE
*/


	//建立曲线对象
	var vc = new VMLCurve(document.all.curve);
	
	//设置X坐标值，从左至右
	vc.configXValue = new Array('10:10:32','10:10:33','10:10:34','10:10:35','10:10:36','10:10:37','10:10:38','10:10:39','10:10:40','10:10:41');
	
	//设置Y坐标轴
	vc.configYPerValue = <%=configYPerValue%>;
  vc.configYMinValue = <%=configYMinValue%>; 

	
	//用数组设置点的横纵标值及提示信息
	var xValueArr = new Array(1,2,3,4,5,6,7,8,9,10);			//X轴数据，
	var yValueArr = new Array(320,280,801,550,600,700,800,720,190,940);	//Y轴数据
	
	
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
		//yValueArr[i]+=parseInt(Math.random()*100+1);	//设置随机数
	}
	var sValueArr = new Array('第1点','第2点','第3点','第4点','第5点','第6点','第7点','第8点','第9点','第10点');	//提示信息
	//设置圆点的属性
	vc.setPointsProp(20,1,'#FF6600','#FF6600');	//坐标颜色
	vc.setPointsValue(xValueArr,yValueArr,sValueArr);	
</script>

<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

<div style="padding-left:5px;">自动刷新频率<input name="autoFlash_frq" type="text"  value='<%=pageFreshTime%>' style="width:30px;"/>秒</div>
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

