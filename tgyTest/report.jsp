<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../css/common.css" type="text/css" />
<title>���Գ�����ⱨ��</title>
</head>

<body>
<div id="man_zone">
<form action="#" onsubmit="">
<table width='97%' border='0' cellspacing='0' cellpadding='0'>
<tr>
<td bgcolor='#dedfd7'>

  <table width="100%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
  <th colspan="4">���Գ�����ⱨ��</th>
    <tr>
      <td width="25%"></td>
      <td width="25%"></td>
      <td width="26%"></td>
      <td width="24%"></td>
    </tr>
    
    <tr>
      <td  class="left_title_1">������</td>
      <td><input type="text" name="tp_testnum" id="tp_testnum" value="<%= Tools.nvl(crs.getString("tp_carname"))%>" /></td>
      <td class="left_title_1">��������</td>
      <td><input type="text" name="tp_carname" id="tp_carname" value="<%= Tools.nvl(crs.getString("tp_carname"))%>" /></td>
    </tr>
	<tr>
      <td class="left_title_2">�������</td>
      <td><input type="text" name="tp_carnum" id="tp_carnum" value="<%= Tools.nvl(crs.getString("tp_carnum"))%>" /></td>
            <td class="left_title_2">�����ͺ�</td>
      <td><input type="text" name="tp_cartype" id="tp_cartype" value="<%= Tools.nvl(crs.getString("tp_cartype"))%>" /></td>
    </tr>
    <tr>
      <td class="left_title_2">�����������</td>
      <td><input type="text" name="tp_testtoolnum" id="tp_testtoolnum" value="<%= Tools.nvl(crs.getString("tp_testtoolnum"))%>" /></td>
            <td class="left_title_2">���������ͺ�</td>
      <td><input type="text" name="tp_testtooltypenum" id="tp_testtooltypenum" value="<%= Tools.nvl(crs.getString("tp_testtooltypenum"))%>" /></td>
    </tr>
    <tr>
      <td class="left_title_1">���Կ�ʼʱ��</td>
      <td><input type="text" name="tp_teststarttime" id="tp_teststarttime" value="<%= Tools.nvl(crs.getString("tp_teststarttime"))%>" /></td>
            <td class="left_title_1">���Խ���ʱ��</td>
      <td><input type="text" name="tp_testendtime" id="tp_testendtime" value="<%= Tools.nvl(crs.getString("tp_testendtime"))%>" /></td>
    </tr>
    <tr>
      <td class="left_title_2">������ʱ��</td>
      <td><input type="text" name="tp_testtotaltime" id="tp_testtotaltime"  value="<%= Tools.nvl(crs.getString("tp_testtotaltime"))%>" /></td>
            <td class="left_title_2">�����ո�ʱ��</td>
      <td><input type="text" name="tp_harvesthour" id="tp_harvesthour" value="<%= Tools.nvl(crs.getString("tp_harvesthour"))%>" /></td>
    </tr>
    <tr>
      <td class="left_title_1">����վ���Ը�����</td>
      <td><input type="text" name="tp_carname" id="tp_carname"  value="<%= Tools.nvl(crs.getString("tp_carname"))%>" /></td>
           <td class="left_title_1">����վ���Ը�������ϵ�绰</td>
      <td><input type="text" name="tp_carname" id="tp_carname"  value="<%= Tools.nvl(crs.getString("tp_carname"))%>" /></td>
    </tr>
  </table>
	</td></tr></table>
	
	<br />
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
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_1_1"><ul>
      <li>2.��ؽ���ʱ�䣺 </li>
    </ul></td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2">&nbsp;</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_1_1"><ul>
      <li>3.�������ͳ�ƣ� </li>
    </ul></td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
      <ul>
        <li><img src="images/list.jpg" width="19" height="15"  />��΢���ϴ���Nq��</li>
      </ul>
    </ul></td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
      <ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />һ����ϴ���Ny��</li>
      </ul>
    </ul></td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
      <ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />�ش���ϴ���Nz��</li>
      </ul>
    </ul></td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
      <ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />����΢���ϴ���NF��NF=Ny+Nz��</li>
      </ul>
    </ul></td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><ul>
      <ul>
        <li><img src="images/list.jpg" alt="" width="19" height="15"  />ȫ�����ϴ���N��N=Nq+Ny+Nz��    </li>
      </ul>
    </ul></td>
    <td>*</td>
  </tr>
  <tr>
    <td >&nbsp;</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_1_1">4.��ȫ�����ϼ���Ŀɿ���ָ�꣺</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />�״ι���ǰƽ������ʱ��</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ�����ϼ��ʱ��</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ���޸�ʱ��</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />��Ч��</td>
    <td>*</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_1_1">5.������΢���ϼ���Ŀɿ���ָ�꣺</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />�״ι���ǰƽ������ʱ��</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ�����ϼ��ʱ��</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />ƽ���޸�ʱ��</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2"><img src="images/list.jpg" alt="" width="19" height="15"  />��Ч��</td>
    <td>*</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_1_1">6.�ɿ���������ۣ�</td>
    <td>*</td>
  </tr>
  <tr>
    <td class="left_title_2_2">&nbsp;</td>
    <td>*</td>
  </tr>
  <tr >
  	<td >&nbsp;</td>
    <td  align="left" style="padding-left:300px;;">���鱨������ʱ�䣺<br />
      �����ˣ�ǩ�֣���<br />
      ���鵥λ(����)��</td>
  </tr>
  </table>
</td></tr></table>	
	
	
  <div align="center" style="padding-top:20px;">
  <input type="submit" name="button" id="button" value="��ӡ����" />
  <input type="reset" name="button2" id="button2" value="��������" />
</div>
</form>
</div>
</body>
</html>
