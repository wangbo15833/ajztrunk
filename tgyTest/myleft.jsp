<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="css/common.css" type="text/css" />
<title>���</title>
</head>
<script  type="text/javascript"> 
/**
*   @function  list_sub_detail
*   @brief
*		��ȡ����б������
*   @retval 
*/
var preClassName = "";
 
//�����ǩ�����½�����Ŀ
function list_sub_detail(Id, item) {
	//alert("Id="+Id+",item="+item);
    if (preClassName != "") {
        getObject(preClassName).className = "left_back"
    }
		//�������ı���ʽЧ��
    if (getObject(Id).className == "left_back") {
        getObject(Id).className = "left_back_onclick";
				//��ȡitem������
        MenuObj.getbyitem(item);
        preClassName = Id	//����ID
    }
		//alert(MenuObj.itemlist[5][0].sortname+0);
		//alert(document.getElementById('item_50'));
		Id = Id.replace('left_nav_','');
		//alert(document.getElementById(MenuObj.itemlist[Id][0]) );
		//alert(document.getElementById(MenuObj.itemlist[Id][0].sortname+'_'+0 )	);
		//alert(document.getElementById(MenuObj.itemlist[Id][0].sortname+'_'+0 )	);
		if(document.getElementById(MenuObj.itemlist[Id][0]) == undefined){
			return;
		}
		if(document.getElementById(MenuObj.itemlist[Id][0].sortname+'_'+0 )){
			document.getElementById(MenuObj.itemlist[Id][0].sortname+'_'+0 ).click();
		}
		/*
		if(document.getElementById(MenuObj.itemlist[Id][0] != undefined)){
			document.getElementById(MenuObj.itemlist[Id][0].sortname+'_'+0 ).click();
			//alert(document.getElementById('right_main_nav').innerHTML);		
		}	else{
			//alert('����');
		}*/
}
 
//����ID�Ķ���
function getObject(objectId) {
    if (document.getElementById && document.getElementById(objectId)) {
        return document.getElementById(objectId)
    } else if (document.all && document.all(objectId)) {
        return document.all(objectId)
    } else if (document.layers && document.layers[objectId]) {
        return document.layers[objectId]
    } else {
        return false
    }
}
 
//������outlook���������ԣ�titlelist��itemlist��5��������
function outlook() {
    this.titlelist 		= new Array();//һ���˵��µ����б��ǩ
    this.itemlist 		= new Array();//���б��е�����
		
    this.addtitle 		= addtitle;
    this.additem 		= additem;
    this.getbytitle 	= getbytitle;
    this.getbyitem 		= getbyitem;
    this.getdefaultnav = getdefaultnav
}
 
//���ӵļܹ���item
//�����ֱ�Ϊ������ ���� ��ֵ Ĭ��
function theitem(in_title, in_sort, in_key, in_isdefault) {
    this.sortname 	 = in_sort;
    this.key 		 = in_key;
    this.title		 = in_title;
    this.isdefault  = in_isdefault
}
 
/**
*   @function  addtitle
*   @brief
*		��ӱ���
*   @retval 
*		1.��������
*		2.���������ƶ�Ϊ
*		3.Ĭ��ֵ 1
*/
//үү���˸�����
function addtitle(intitle, sortname, inisdefault) {
    MenuObj.itemlist [MenuObj.titlelist.length] = new Array();
    MenuObj.titlelist[MenuObj.titlelist.length] = new theitem(intitle, sortname, 0, inisdefault);
    return (MenuObj.titlelist.length - 1)
}
 
/**
*		Ϊ�����������Ŀ
*   @retval 
*		1.������Ŀ����
*		2.����
*		3.��URL
*/
function additem(in_title, parentid, in_key) {
	if (parentid >= 0 && parentid <= MenuObj.titlelist.length) {
		var in_sort = "item_" + parentid;
		MenuObj.itemlist[parentid][MenuObj.itemlist[parentid].length] = new theitem(in_title, in_sort, in_key, 0);
		return (MenuObj.itemlist[parentid].length - 1)
	} 
	else {
		additem = -1;
	}
}
 
/**
*   @function  getdefaultnav
*   @brief
*		��ʾ�����б�
*   @retval 
*		���������ֶ�λ
*   @NOTE	���� class=list_tilte id=sub_sort_i
*/
function getdefaultnav(sortname) {
    var output = "";
		//�����б����б��в���
    for (i = 0; i < MenuObj.titlelist.length; i++) {
		  	//ʹ��1 ��Ĭ��������б���ʾ
        if (MenuObj.titlelist[i].isdefault == 1 && MenuObj.titlelist[i].sortname == sortname) {
						//����
            output += "<div class=list_tilte  id=sub_sort_"+i + " onclick=\"hideorshow('sub_detail_" + i + "')\">";
            output += "<span>" + MenuObj.titlelist[i].title + "</span>";
            output += "</div>";
						
						//��ʾ���� ���key,��������
            output += "<div class=list_detail id=sub_detail_"+ i + "><ul>";
            for (j = 0; j < MenuObj.itemlist[i].length; j++) {
                output += "<li id=" + MenuObj.itemlist[i][j].sortname + j 
													+ " onclick=\"changeframe('" + MenuObj.itemlist[i][j].title + "','" + MenuObj.titlelist[i].title + "','" + MenuObj.itemlist[i][j].key + "')\">"
													+"<a href=#>" + MenuObj.itemlist[i][j].title + "</a></li>"
            }
            output += "</ul></div>"
        }
    }
		//alert(output);
		//��ʾ����
    getObject('right_main_nav').innerHTML = output
}
 
/**
*   @function  getbytitle
*   @brief
*		����б�����
*   @retval 
*		���������ֶ�λ
*   @NOTE	���� class=left_back id=left_nav_
*/
//���ɶ��ӵļܹ�
function getbytitle(sortname) {
  var output = "<ul>";
	var firstTag;
    for (i = 0; i < MenuObj.titlelist.length; i++) {
			//list_sub_detail(0,MenuObj.titlelist[i].title)
			if (MenuObj.titlelist[i].sortname == sortname) 
			{
				output += "<li id=left_nav_" + i + " onclick=\"list_sub_detail(id,'" + MenuObj.titlelist[i].title + "')\" class=left_back>" 
								+ MenuObj.titlelist[i].title + "</li>"
				if(!firstTag)
				{
					firstTag = "left_nav_" + i
				}
				//getObject("left_nav_" + i).className = "left_back_onclick";
				//alert(getObject("left_nav_" + i).className)
			}
    }
    output += "</ul>";
	//�����ർ����
    getObject('left_main_nav').innerHTML = output
	 document.getElementById(firstTag).click()
}
 
 
/**
*   @function  getbyitem
*   @brief
*		�Ҳ���title��ʾ����������
*   @retval 
*		���������ֶ�λ
*
*   @NOTE	���� class=list_detail id=sub_detail_i
*/
//���½���������Ŀ
function getbyitem(item) {
    var output = "";
    for (i = 0; i < MenuObj.titlelist.length; i++) {
        if (MenuObj.titlelist[i].title == item) {
						//����
            output = "<div class=list_tilte id=sub_sort_" + i + " onclick=\"hideorshow('sub_detail_" + i + "')\">";
            output += "<span>" + MenuObj.titlelist[i].title + "</span>";
            output += "</div>";
						//����
            output += "<div class=list_detail id=sub_detail_" + i + " style='display:block;'><ul>";
            for (j = 0; j < MenuObj.itemlist[i].length; j++) {
                output += "<li id=" + MenuObj.itemlist[i][j].sortname + "_" + j + " onclick=\"changeframe('" + MenuObj.itemlist[i][j].title + "','" + MenuObj.titlelist[i].title + "','" + MenuObj.itemlist[i][j].key + "')\"><a href=#>" + MenuObj.itemlist[i][j].title + "</a></li>"
            }
            output += "</ul></div>"
        }
    }
		//��ʾ
    getObject('right_main_nav').innerHTML = output
}
 
/**
*   @function  changeframe
*   @brief
*		�������
*   @retval 
*		ѡ�������͵��������ƶ���ʾ��mainFrame��������������ʾ
*/
function changeframe(item, sortname, src) {
    if (item != "" && sortname != "") {
        window.top.indexFrame.frames['mainFrame'].getObject('show_text').innerHTML = sortname + "&nbsp;&nbsp;<img src=images/slide.gif broder=0 />&nbsp;&nbsp;" + item
    }
    if (src != "") {
        window.top.indexFrame.frames['manFrame'].location = src
		//alert(src);
    }
}
 
/**
*   @function  hideorshow
*   @brief
*		��ʾ����������
*   @retval 
*/
function hideorshow(divid) {
	//alert();
    subsortid = "sub_sort_" + divid.substring(11);
    if (getObject(divid).style.display == "none") {
        getObject(divid).style.display = "block";
        getObject(subsortid).className = "list_tilte"
    } else {
        getObject(divid).style.display = "none";
        getObject(subsortid).className = "list_tilte_onclick"
    }
}
 
/**
*   @function  initinav
*/
function initinav(sortname) {
    MenuObj.getdefaultnav(sortname);
    MenuObj.getbytitle(sortname);
    //window.top.indexFrame.frames['manFrame'].location = "tgyTest/init.html"
		window.top.indexFrame.frames['manFrame'].location = "tgyTest/init.html"
}
 
 
// �����������ļ�
var MenuObj=new outlook();
var t;
//------------------------��ɫ����-------------------------1
t=MenuObj.addtitle('��ɫ����','��ɫ����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('��ɫ�б�',t,  'MainServlet_sys?fid=UII00.00.00.01&listMode=list')
MenuObj.additem('���ӽ�ɫ',t,  'role/new_role.jsp?titleName=������ɫ')
 
t=MenuObj.addtitle('��λ����','��ɫ����',0)
MenuObj.additem('��λ�����б�',t,'MainServlet_sys?fid=UII00.00.01.01&listMode=list')
MenuObj.additem('���ӵ�λ����',t,'MainServlet_sys?fid=UII00.00.01.03&mode=before')
 
//------------------------������Ϣ-------------------------2
t=MenuObj.addtitle('��λ��Ϣ','������Ϣ',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('��λ�б�',t,  'MainServlet_sys?fid=UII00.00.02.01&listMode=list')
MenuObj.additem('���ӵ�λ',t,  'MainServlet_sys?fid=UII00.00.02.03&mode=before')
 
t=MenuObj.addtitle('��Ա��Ϣ','������Ϣ',0)
MenuObj.additem('��Ա�б�',t,  'MainServlet_sys?fid=UII00.00.03.01&listMode=list')
MenuObj.additem('������Ա',t,  'MainServlet_sys?fid=UII00.00.03.03&mode=before')
 
t=MenuObj.addtitle('��Ŀ��Ϣ','������Ϣ',0)
MenuObj.additem('��Ŀ�б�',t,  'MainServlet_sys?fid=UII00.00.04.01&listMode=list')
MenuObj.additem('������Ŀ',t,  'MainServlet_sys?fid=UII00.00.04.03&mode=before')
 
t=MenuObj.addtitle('�豸����','������Ϣ',0)
MenuObj.additem('�������ػ��б�',t,  'MainServlet_sys?fid=UII00.00.05.01&listMode=list')
MenuObj.additem('���ӱ������ػ�',t,  'MainServlet_sys?fid=UII00.00.05.03&mode=before')
 
t=MenuObj.addtitle('������Ա','������Ϣ',0)
MenuObj.additem('������Ա�б�',t,  'MainServlet_sys?fid=UII00.00.06.01&listMode=list')
MenuObj.additem('����������Ա',t,  'MainServlet_sys?fid=UII00.00.06.03&mode=before')
 
//------------------------�û�����-------------------------3
t=MenuObj.addtitle('�û���Ϣ','�û�����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('�û��б�',t,  'MainServlet_sys?fid=UII00.03.01.01&listMode=list')
MenuObj.additem('�����û�',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
 
 
//------------------------�ල����-------------------------4
t=MenuObj.addtitle('�ල�ƻ�','�ල����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('�ල�ƻ���',t,  'MainServlet_sys?fid=UII00.04.01.01&listMode=list')
MenuObj.additem('�����ල�ƻ�',t,  'MainServlet_sys?fid=UII00.04.01.03&mode=before')
 
t=MenuObj.addtitle('���ƻ�','�ල����',0)
MenuObj.additem('���ƻ���',t,  'MainServlet_sys?fid=UII00.04.02.01&listMode=list')
MenuObj.additem('�������ƻ�',t,  'MainServlet_sys?fid=UII00.04.02.03&mode=before')
 
 
t=MenuObj.addtitle('��Ŀ����','�ල����',0)
MenuObj.additem('��Ŀ�����б�',t,  'MainServlet_sys?fid=UII00.04.03.01&listMode=list')
MenuObj.additem('����������Ŀ',t,  'MainServlet_sys?fid=UII00.04.03.03&mode=before')
 
 
//------------------------��ѯ����-------------------------5
t=MenuObj.addtitle('�û���Ϣ','��ѯ����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('��ѯ�ල�ƻ�',t,  'MainServlet_sys?fid=UII00.03.01.01&listMode=list')
MenuObj.additem('��ѯ����¼',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
MenuObj.additem('��ѯ��Ŀ��Ϣ',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
MenuObj.additem('��ѯ��λ��Ϣ',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
MenuObj.additem('��ѯ�豸������Ϣ',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
MenuObj.additem('��ѯ��ȫ�������ݿ�',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
 
 
//------------------------��ȫ����-------------------------6
t=MenuObj.addtitle('���ɷ���','��ȫ����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('���ɷ����׼�淶�б�',t,  'MainServlet_sys?fid=UII00.06.01.01&listMode=list')
MenuObj.additem('�������ɷ����׼�淶',t,  'MainServlet_sys?fid=UII00.06.01.03&mode=before')
 
t=MenuObj.addtitle('�����ļ�','��ȫ����',0)
MenuObj.additem('�ļ����ģ���б�',t,  'MainServlet_sys?fid=UII00.06.01.01&listMode=list')
MenuObj.additem('�����ļ����ģ��',t,  'MainServlet_sys?fid=UII00.06.01.03&mode=before')
MenuObj.additem('�ϴ��ļ����ģ��',t,  'MainServlet_sys?fid=UII00.06.01.03&mode=before')
 
//------------------------֪ͨ����-------------------------7
t=MenuObj.addtitle('�·�֪ͨ','֪ͨ����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('֪ͨ�б�',t,  'MainServlet_sys?fid=UII00.07.01.01&listMode=list')
MenuObj.additem('����֪ͨ',t,  'MainServlet_sys?fid=UII00.07.01.03&mode=before')
 
// t=MenuObj.addtitle('��������','֪ͨ����',0)
// MenuObj.additem('�����б�',t,  'MainServlet_sys?fid=UII00.03.01.01&listMode=list')
// MenuObj.additem('��������',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
 
 
//------------------------��Ϣ����-------------------------7
t=MenuObj.addtitle('��Ϣ�༭','��Ϣ����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('��Ϣ�б�',t,  'MainServlet_sys?fid=UII00.08.01.01&listMode=list')
MenuObj.additem('������Ϣ',t,  'MainServlet_sys?fid=UII00.08.01.03&mode=before')
 
// t=MenuObj.addtitle('��Ϣ����','��Ϣ����',0)
// MenuObj.additem('�����б�',t,  'MainServlet_sys?fid=UII00.03.01.01&listMode=list')
// MenuObj.additem('��������',t,  'MainServlet_sys?fid=UII00.03.01.03&mode=before')
 
//------------------------ǩ������-------------------------9
t=MenuObj.addtitle('ǩ������','ǩ������',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('�����б�',t,  'MainServlet_sys?fid=UII00.09.01.01&listMode=list')
MenuObj.additem('���ӹ���',t,  'MainServlet_sys?fid=UII00.09.01.03&mode=before')
t=MenuObj.addtitle('ǩ����Ϣ','ǩ������',0)
MenuObj.additem('ǩ����Ϣ�б�',t,  'MainServlet_sys?fid=UII00.09.02.01&listMode=list')
MenuObj.additem('ǩ��',t,  'MainServlet_sys?fid=UII00.09.02.03&mode=before')
 
//------------------------ϵͳά��-------------------------10
t=MenuObj.addtitle('ϵͳ��־','ϵͳά��',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('�鿴��־�б�',t,  'MainServlet_sys?fid=UII00.10.01.01&listMode=list')
MenuObj.additem('��������ѯ��־',t,'syslog/query_log.jsp')
t=MenuObj.addtitle('����ά��','ϵͳά��',0)
MenuObj.additem('�鿴����ά������',t,  'MainServlet_sys?fid=UII00.10.02.01&listMode=list')
MenuObj.additem('��������ά������',t,  'MainServlet_sys?fid=UII00.10.02.04&id=1&mode=before')
 
 
//------------------------�ֵ�����-------------------------11
t=MenuObj.addtitle('�ֵ�����','�ֵ�����',1)//1��ʾĬ���Ǵ򿪵�
MenuObj.additem('�ֵ������б�',t,  'MainServlet_sys?fid=UII99.99.99.01&listMode=list')
MenuObj.additem('�����ֵ�����',t,  'MainServlet_sys?fid=UII99.99.99.03&mode=before')
 
 
 
//��վ��ҳ
t=MenuObj.addtitle('��վ��ҳ','��վ��ҳ',1)
MenuObj.additem('��վ��ҳ',t,'tgyTest/init.html')
 
 
</script>
<body onload="initinav('��վ��ҳ')">
<div id="left_content" style="height:500px">
	<div style=" margin-top:6px;"></div>
	<div id="main_nav">
	 <div id="left_main_nav"  ></div>
	 <div id="right_main_nav" style=" overflow-y:hidden; overflow-x:hidden"></div>
	</div>
</div>
</body>
</html>
