//�༭�б�ĵ��ά������
function passValue_click_1(checkbox_prefix, num){
	
}



function openIframe(frameName){
	document.getElementById(frameName).style.display = "block";
}

function closeIframe(frameName){
	document.getElementById(frameName).style.display = "none";
}


function editTitleHeadFunction( displayContent,  operationMode, displayMode ){
	//������ʾ��ť��ֵ
	document.getElementById('editSubmit').value = displayMode;
	//�޸Ĳ���¼����ģʽ
	operation_mode = operationMode;
	if(operationMode == 'input'){
		//���ư�ť���Ƿ���ʾ
		document.getElementById('editSubmit_td').style.display = 'block';
		//�ı�editHeadTile����ɫ
		document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}
	else if(operationMode == 'update'){
		document.getElementById('editSubmit_td').style.display = 'block';
		document.getElementById('sub_title_dislay').innerHTML ='<font color=red>'+displayContent+'</font>';
	}
	else if(operationMode == 'delete'){
		document.getElementById('editSubmit_td').style.display = 'block';
		document.getElementById('sub_title_dislay').innerHTML ='<font color=yellow>'+displayContent+'</font>';
	}
	else if(operationMode == 'detail' || 'edit'){
		document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
		//��ѯ��ҳ��
		document.getElementById('editSubmit_td').style.display = 'none';
	}
	else{
		document.getElementById('editSubmit_td').style.display = 'block';
		document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}
}


function editTitleHeadFunction_notitle( displayContent,  operationMode, displayMode ){
	//������ʾ��ť��ֵ
	document.getElementById('editSubmit').value = displayMode;
	//�޸Ĳ���¼����ģʽ
	operation_mode = operationMode;
	document.getElementById('editSubmit_td').style.display = 'none';
	if(operationMode == 'input'){
		//���ư�ť���Ƿ���ʾ
		document.getElementById('editSubmit_td').style.display = 'none';
		//�ı�editHeadTile����ɫ
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}else if(operationMode == 'update'){
		document.getElementById('editSubmit_td').style.display = 'none';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=red>'+displayContent+'</font>';
	}else if(operationMode == 'delete'){
		document.getElementById('editSubmit_td').style.display = 'none';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=yellow>'+displayContent+'</font>';
	}else if(operationMode == 'detail'){
		//��ѯ��ҳ��
		document.getElementById('editSubmit_td').style.display = 'none';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}else{
		document.getElementById('editSubmit_td').style.display = 'none';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}
}

/*
function editTitleHeadFunction_notitle( displayContent,  operationMode, displayMode ){
	//������ʾ��ť��ֵ
	document.getElementById('editSubmit').value = displayMode;
	//�޸Ĳ���¼����ģʽ
	operation_mode = operationMode;
	if(operationMode == 'input'){
		//���ư�ť���Ƿ���ʾ
		document.getElementById('editSubmit_td').style.display = 'block';
		//�ı�editHeadTile����ɫ
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}else if(operationMode == 'update'){
		document.getElementById('editSubmit_td').style.display = 'block';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=red>'+displayContent+'</font>';
	}else if(operationMode == 'delete'){
		document.getElementById('editSubmit_td').style.display = 'block';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=yellow>'+displayContent+'</font>';
	}else if(operationMode == 'detail'){
		//��ѯ��ҳ��
		document.getElementById('editSubmit_td').style.display = 'none';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}else{
		document.getElementById('editSubmit_td').style.display = 'block';
		//document.getElementById('sub_title_dislay').innerHTML ='<font color=green>'+displayContent+'</font>';
	}
}*/

function queryTitleHeadFunction( displayContent){
	document.getElementById('sub_title_dislay').innerHTML ='<font color=black>'+displayContent+'</font>';
}

function queryTitleHeadFunction_notitle( displayContent){
	//document.getElementById('sub_title_dislay').innerHTML ='<font color=black>'+displayContent+'</font>';
}
