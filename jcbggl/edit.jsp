<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType = "text/html; charset=GBK" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%@ page import="sun.jdbc.rowset.*"%>
<%
  EventResponse eventResponse = (EventResponse)request.getAttribute("result"); 
	Query queryCon = null;
	CachedRowSet crs = null;
	if(eventResponse != null){
  queryCon = (Query)eventResponse.getBody();  
  crs = (CachedRowSet)queryCon.getConditionBody();
	}
%>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link rel="stylesheet" href="css/common.css" type="text/css" />
<link href="../css/calendar-win2k-cold-1.css" rel="stylesheet" type=text/css>
<link rel="stylesheet"  href="css/001.css" type="text/css" >
<link rel="stylesheet"  href="css/style1.css" type=text/css>
<link rel="stylesheet"  href="css/calendar-win2k-cold-1.css" type="text/css">
<style   media=print> 
.noPrint{display:none;} 
.PageNext{page-break-after:   avoid;   page-break-before:   avoid;} 
</style> 
<script language="JScript" type="text/javascript"  src="../js/calendar.js"> </script>
<script language="JScript" type="text/javascript"  src="../js/calendar-setup.js"> </script>
<script language="JScript" type="text/javascript"  src="../js/calendar-zh.js"> </script>
<script>
function editSubmit_button(){//����ȷ����ť�Ĳ�������735
	if(parent.activeIframe == 'listframe'){
		parent.openIframe("listframe");
		parent.closeIframe("editframe");
	}
}
function printit()
  {   
  if(confirm('ȷ����ӡ��'))
    {/*����ӡ��ť*/
      var win=window.open("","��ⱨ���ӡ","width=800,height=700,scrollbars=yes,resizable=yes,status=yes");<!--menubar=yes,-->
      win.document.write(document.getElementById('aa').parentElement.innerHTML)
      win.document.write("<script>print();</"+"script>");
	  win.document.getElementById('button').style.display='none';
	  win.document.getElementById('button2').style.display='none';
      win.location.reload();
    }
  }
function preview()
  {  
      var win=window.open("","��ⱨ��Ԥ��","width=800,height=700,scrollbars=yes,resizable=yes,status=yes");
      win.document.write(document.getElementById('aa').parentElement.innerHTML)
	  win.document.getElementById('button').style.display='none';
	  win.document.getElementById('button2').style.display='none';      
      //win.location.reload();   
  }
</script>  
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<div id="man_zone">
<%
String [] col_name 	= {"id","Cname","Ctype","Cnum","Cmake","Couttime","Cjtime","Ctestmb","Ctestdh","Tnum","Tyqxh","Tyqnum","Tstime","Ttime","Tmeb","Tmebdh","dataCreateTime","dataOperman"};
String [] col_headname 	= {"id","����<br>����","����<br>�ͺ�","������<br>�����","������<br>�쵥λ","Couttime","Cjtime","Ctestmb","Ctestdh","Tnum","Tyqxh","Tyqnum","Tstime","Ttime","Tmeb","Tmebdh","dataCreateTime","dataOperman"};
%>
<%
	crs.next();//FCL00.00.04.04
%>
<form  name="formHead"  action="MainServlet_sys" onsubmit="return testColValue();" method="post" target="submitframe">
	<input type="hidden" name="fid" value="FCL00.00.04.04">
<form action="jcreport.jsp" method="post" name="form">
<table id="aa" height="200px"  width='97%' border='0' cellspacing='0' cellpadding='0'>
<tr>
<td>
<table  height="200px"  width='97%' border='0' cellspacing='0' cellpadding='0'>
<tr>
<td bgcolor='#dedfd7'>

  <table width="100%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
  <th colspan="4">���Գ�����ⱨ��</th>
    <tr>
      <td width="21%"></td>
      <td width="21%"></td>
      <td width="22%"></td>
      <td width="36%"></td>
    </tr>
    
    <tr>
      <td  class="left_title_1">������</td>
      <td><input type="text" name="tp_testnum" id="tp_testnum" value="<%= Tools.nvl(crs.getString("tp_testnum"))%>" readonly="true" /></td>
      <!--��ⱨ�棿Ӧ��Ӧ���޸ģ����ó�ֻ��-->
	  <td class="left_title_1">������λ</td>
      <td><input type="text" name="tp_carproduction" id="tp_carproduction" value="<%= Tools.nvl(crs.getString("tp_carproduction"))%>" readonly="true" /></td>
    </tr>
	<tr>
	  <td class="left_title_2">�������</td>
      <td><input type="text" name="tp_carnum" id="tp_carnum" value="<%= Tools.nvl(crs.getString("tp_carnum"))%>" readonly="true" /></td>
      <td class="left_title_2">��������</td>
      <td><input type="text" name="tp_carname" id="tp_carname" value="<%= Tools.nvl(crs.getString("tp_carname"))%>" readonly="true" /></td>
      
    </tr>
    <tr>
      <td class="left_title_1">�����������</td>
      <td><input type="text" name="tp_testtoolnum" id="tp_testtoolnum" value="<%= Tools.nvl(crs.getString("tp_testtoolnum"))%>"  readonly="true"/></td>
            <td class="left_title_1">���������ͺ�</td>
      <td><input type="text" name="tp_testtooltypenum" id="tp_testtooltypenum" value="<%= Tools.nvl(crs.getString("tp_testtooltypenum"))%>" readonly="true" /></td>
    </tr>
    <tr>
      <td class="left_title_2">���Կ�ʼʱ��</td>
      <td><input type="text" name="tp_teststarttime" id="tp_teststarttime" value="<%= Tools.nvl(crs.getString("tp_teststarttime"))%>" readonly="true" /></td>
            <td class="left_title_2">���Խ���ʱ��</td>
      <td><input type="text" name="tp_testendtime" id="tp_testendtime" value="<%= Tools.nvl(crs.getString("tp_testendtime"))%>" readonly="true" /></td>
    </tr>
    <tr>
      <td class="left_title_1">������ʱ��</td>
      <td><input type="text" name="tp_testtotaltime" id="tp_testtotaltime"  value="<%= Tools.nvl(crs.getString("tp_testtotaltime"))%>"  readonly="true"/></td>
            <td class="left_title_1">�����ո�ʱ��</td>
      <td><input type="text" name="tp_harvesthour" id="tp_harvesthour" value="<%= Tools.nvl(crs.getString("tp_harvesthour"))%>" readonly="true" /></td>
    </tr>
    <tr>
      <td class="left_title_2">���Ը�����</td>
      <td><input type="text" name="tp_testmeb" id="tp_testmeb"  value="<%= Tools.nvl(crs.getString("tp_testmeb"))%>"  readonly="true"/></td>
           <td class="left_title_2">���Ը�������ϵ�绰</td>
      <td><input type="text" name="tp_testmebphone" id="tp_testmebphone"  value="<%= Tools.nvl(crs.getString("tp_testmebphone"))%>" readonly="true" /></td>
    </tr>
  </table>
	</td></tr></table>
<table width='97%' border='0' cellspacing='0' cellpadding='0'>
<tr>
<td bgcolor='#dedfd7'>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_style">
  <tr>
    <td width="35%" ></td>
    <td width="65%"></td>
  </tr>
  <tr>
    <td class="left_title_1_1" >1.��ؿ�ʼʱ�䣺</td>
    <td><input type="text" name="TCjk_startTime" id="TCjk_startTime"  value="<%= Tools.nvl(crs.getString("TCjk_startTime"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_1_1">2.��ؽ���ʱ�䣺</td>
    <td><input type="text" name="TCjk_endTime" id="TCjk_endTime"  value="<%= Tools.nvl(crs.getString("TCjk_endTime"))%>"  readonly="true"/></td>
  </tr>
  <!--<tr>
    <td class="left_title_2_2">&nbsp;</td>
    <td>*</td>
  </tr>-->
  <tr>
    <td class="left_title_1_1">3.������ͳ�ƣ�</td>
    <td></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
      
        <li><img src="images/list.jpg" width="19" height="15"  />��΢���ϴ���Nq��</li>
      
    </ul></td>
    <td><input type="text" name="Nqw" id="Nqw"  value="<%= Tools.nvl(crs.getString("Nqw"))%>"  readonly="true"/></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
      
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />һ����ϴ���Ny��</li>
      
    </ul></td>
    <td><input type="text" name="Nyb" id="Nyb"  value="<%= Tools.nvl(crs.getString("Nyb"))%>"  readonly="true"/></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />�ش���ϴ���Nz��</li>
    </ul></td>
    <td><input type="text" name="Nzd" id="Nzd"  value="<%= Tools.nvl(crs.getString("Nzd"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />����΢���ϴ���NF��NF=Ny+Nz��</li>
    </ul></td>
    <td><input type="text" name="Nfqw" id="Nfqw"  value="<%= Tools.nvl(crs.getString("Nfqw"))%>"  readonly="true"/></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
         <li><img src="images/list.jpg" alt="" width="19" height="15"  />ȫ�����ϴ���N��N=Nq+Ny+Nz��    </li>
    </ul></td>
    <td><input type="text" name="Ntotal" id="Ntotal"  value="<%= Tools.nvl(crs.getString("Ntotal"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_1_1">4.��ȫ�����ϼ���Ŀɿ���ָ�꣺</td>
    <td></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />�״ι���ǰƽ������ʱ��</li>
    </ul></td>
    <td><input type="text" name="TAfirst" id="TAfirst"  value="<%= Tools.nvl(crs.getString("TAfirst"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ�����ϼ��ʱ��</li>
    </ul></td>
    <td><input type="text" name="TAgzjg" id="TAgzjg"  value="<%= Tools.nvl(crs.getString("TAgzjg"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ���޸�ʱ��</li>
    </ul></td>
    <td><input type="text" name="TArep" id="TArep"  value="<%= Tools.nvl(crs.getString("TArep"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />��Ч��</li>
    </ul></td>
    <td><input type="text" name="TAef" id="TAef"  value="<%= Tools.nvl(crs.getString("TAef"))%>" readonly="true" /></td>
  </tr>
  <!--<tr>
    <td>&nbsp;</td>
    <td>*</td>
  </tr>-->
  <tr>
    <td class="left_title_1_1">5.������΢���ϼ���Ŀɿ���ָ�꣺</td>
    <td></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />�״ι���ǰƽ������ʱ��</li>
    </ul></td>
    <td><input type="text" name="FAfirst" id="FAfirst"  value="<%= Tools.nvl(crs.getString("FAfirst"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ�����ϼ��ʱ��</li>
    </ul></td>
    <td><input type="text" name="FAgzjg" id="FAgzjg"  value="<%= Tools.nvl(crs.getString("FAgzjg"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ���޸�ʱ��</li>
    </ul></td>
    <td><input type="text" name="FArep" id="FArep"  value="<%= Tools.nvl(crs.getString("FArep"))%>" readonly="true"/></td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />��Ч��</li>
    </ul></td>
    <td><input type="text" name="Faef" id="Faef"  value="<%= Tools.nvl(crs.getString("Faef"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_1_1">6.�ɿ���������ۣ�</td>
    <td><input type="text" name="result" id="result"  value="<%= Tools.nvl(crs.getString("result"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_1_1">��������ʱ�䣺</td>
    <td><input type="text" name="reporttime" id="reporttime"  value="<%= Tools.nvl(crs.getString("reporttime"))%>" readonly="true" /></td>
  </tr>
  <tr>
    <td class="left_title_2_2">�����ˣ�ǩ�֣���</td>
    <td class="left_title_2_2">��ⵥλ(����)��</td><!--<input type="text" name="tp_reportoperator" id="tp_reportoperator"  value=""  readonly="true"/>--->
  </tr>
  <!--<tr>
    <td class="left_title_1_1">��ⵥλ(����)��</td>
    <td></td><input type="text" name="testcompany" id="testcompany"  value="" readonly="true" />-->
  </table>
</td></tr></table>	
	</td>
    </tr>
    </table>
</form>
  <div align="center" style="padding-top:20px;"> 
  <input class="noPrint" type="submit" name="button" id="button" value="Ԥ������"  onclick="javascript:preview()"/>
  <input class="noPrint" type="button" name="button2" id="button2" value="��ӡ����" onclick="javascript:printit()"/>
</div>
</form>
</div>
</body>
</html>
