var trClickNum 	= 0;
var trChecked 	= 0;
function changeColor_click( tr_prefix, checkbox_prefix, num)
{
	/*********��ز���˵��*********//*
	form_name:		��ʾѡ���еı�����
	tr_prefix:	��ʾѡ����id��ǰ׺��
	checkbox_prefix:��ʾѡ�߿�����ǰ׺
	checkboxItem:	��ʾѡ�߿�;
	num��				��ʾѡ���кţ�
	idValue��		��ʾѡ���е�idֵ��
	*/
	//parent.menuframe.controlPane.id_value.value 		= idValue;		  //����idvalue��ֵ
	//document.controlPane.id_value.value 		= idValue;		  //����idvalue��ֵ
	//var trObj 		= document.getElementById("trname"+num);
	//var number 		= document.forms[form_name].thisItem.value;//��¼�ϴε�ֵ��
	//var number 		= document.getElementById("thisItem").value;//��¼�ϴε�ֵ��
	trClickNum = num;
	var number  = trChecked;
	
	
	//���ϴ�ѡ���ֵ��λ
	if(  number>0 && number<13){ 
		//document.forms[form_name].elements[checkbox_prefix + number].checked = false;
		document.getElementById(checkbox_prefix+number).checked = false;
		(document.getElementById(tr_prefix+number)).style.backgroundColor = "white";
	}
		
	//���ñ��ε�ֵ
	if(document.getElementById(checkbox_prefix+num).checked){/*  ����checkbox��ѡ��   */
		document.getElementById(checkbox_prefix+num).checked	= true;
		//document.forms[form_name].thisItem.value 	= num;//���ü�¼�ı��ε�ֵ
		//document.getElementById("thisItem").value 	= num;//���ü�¼�ı��ε�ֵ
		
		trChecked = num;//���ü�¼�ı��ε�ֵ
		
		(document.getElementById(tr_prefix+num)).style.backgroundColor = "skyblue";
	}else{/*  ����checkbox�򱻸�λ   */
		document.getElementById(checkbox_prefix+num).checked	= false;
		//document.forms[form_name].thisItem.value 		= "";//checkbox�򱻸�λ,
		//document.getElementById("thisItem").value 	= "";//checkbox�򱻸�λ
		
		trChecked = 0;//���ü�¼�ı��ε�ֵ
		
		//parent.menuframe.controlPane.id_value.value 	= "";////checkbox�򱻸�λ, ��Ҫ��idValueҲ��λ
		(document.getElementById(tr_prefix+num)).style.backgroundColor = "white";
	}
}

function changeColor_dblclick( tr_prefix, checkbox_prefix, num)
{
	/*********��ز���˵��*********//*
	form_name:		��ʾѡ���еı�����
	tr_prefix:	��ʾѡ����id��ǰ׺��
	checkbox_prefix:��ʾѡ�߿�����ǰ׺
	checkboxItem:	��ʾѡ�߿�;
	num��				��ʾѡ���кţ�
	idValue��		��ʾѡ���е�idֵ��
	*/
	//parent.menuframe.controlPane.id_value.value 		= idValue;		  //����idvalue��ֵ
	//document.controlPane.id_value.value 		= idValue;		  //����idvalue��ֵ
	//var trObj 		= document.getElementById("trname"+num);
	//var number 		= document.forms[form_name].thisItem.value;//��¼�ϴε�ֵ��
	//var number 		= document.getElementById("thisItem").value;//��¼�ϴε�ֵ��
	
	var number  = trChecked;
	
	
	//���ϴ�ѡ���ֵ��λ
	if(  number>0 && number<13){ 
		//document.forms[form_name].elements[checkbox_prefix + number].checked = false;
		document.getElementById(checkbox_prefix+number).checked = false;
		(document.getElementById(tr_prefix+number)).style.backgroundColor = "white";
	}
		
	//���ñ��ε�ֵ
	//if(document.getElementById(checkbox_prefix+num).checked){/*  ����checkbox��ѡ��   */
	if(true){/*  ����checkbox��ѡ��   */
		document.getElementById(checkbox_prefix+num).checked	= true;
		//document.forms[form_name].thisItem.value 	= num;//���ü�¼�ı��ε�ֵ
		//document.getElementById("thisItem").value 	= num;//���ü�¼�ı��ε�ֵ
		
		trChecked = num;//���ü�¼�ı��ε�ֵ
		
		(document.getElementById(tr_prefix+num)).style.backgroundColor = "skyblue";
	}else{/*  ����checkbox�򱻸�λ   */
		document.getElementById(checkbox_prefix+num).checked	= false;
		//document.forms[form_name].thisItem.value 		= "";//checkbox�򱻸�λ,
		//document.getElementById("thisItem").value 	= "";//checkbox�򱻸�λ
		
		trChecked = 0;//���ü�¼�ı��ε�ֵ
		
		//parent.menuframe.controlPane.id_value.value 	= "";////checkbox�򱻸�λ, ��Ҫ��idValueҲ��λ
		(document.getElementById(tr_prefix+num)).style.backgroundColor = "white";
	}
}

function changeColor_OverOut(tr_value, checkboxItem, mouseStatus)
{
	/*********��ز���˵��*********/
	/*
	tr_value��	��ʾѡ���е�idֵ��
	checkboxItem:	��ʾѡ���е�checkbox��ֵ
	mouseStatus:	��ʾ���over �� out ��־��
	*/
	var trObj = document.getElementById(tr_value);
	if(!checkboxItem.checked){
		if(mouseStatus=='over'){
			trObj.style.backgroundColor = "lightBlue";
		}
		else if(mouseStatus=='out' ){
			trObj.style.backgroundColor = "white";
		}
	}
}


function changeColor2(itemName,itemValue,num,idValue)
{
	var trObj 		= document.getElementById("trname"+num);
	document.controlPane.id_value.value 	= idValue;
	var number 	= document.controlPane.thisItem.value;//��¼�ϴε�ֵ��
	
	//�Ƚ��ϴε�ֵ�����ϴε�ѡ�λ������
	if(number == 1){
		document.frm1.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 2){
		document.frm2.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 3){
		document.frm3.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 4){
		document.frm4.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 5){
		document.frm5.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 6){
		document.frm6.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 7){
		document.frm7.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 8){
		document.frm8.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 9){
		document.frm9.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 10){
		document.frm10.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	if(number == 11){
		document.frm11.itemLine.checked	= false;
		(document.getElementById("trname"+number)).style.backgroundColor = "white";
	}
	
	//�������ε�ֵ
	if(itemName.checked){
		itemName.checked					= true;
		document.controlPane.thisItem.value = num;//���ü�¼��ֵ
		(document.getElementById("trname"+num)).style.backgroundColor = "red";
	}else{
		itemName.checked					= false;
		document.controlPane.thisItem.value = "";//
		(document.getElementById("trname"+num)).style.backgroundColor = "white";
	}
	
}

function changeColor(itemValue,flag,num)
{
	var trObj = document.getElementById("trname"+num);
	if(flag==1 && !itemValue){
		trObj.style.backgroundColor = "lightBlue";
	}
	else if(flag==0 && !itemValue){
		trObj.style.backgroundColor = "white";
	}
}

function mutiSelCheck(i){}