function checkboxClick(elementName, checkedValue, uncheckedValue)
{
	if(eval("document.all."+elementName).checked == true){
		eval("document.all."+elementName).value = checkedValue;
	}else{
		eval("document.all."+elementName).value = uncheckedValue;
	}
	//alert(eval("document.all."+elementName+".value"));
}

function confirmButton(operationMode, executedMethod){
	var ok = false 
	if(operationMode== 'input' ){ 
		ok= window.confirm('����Ҫ��������,\n'+'��ȷ����?')	
	}	
	else if(operationMode== 'update' ){ 
		ok= window.confirm('����Ҫ�޸�����,\n'+'��ȷ����?')	
	}	
	else if(operationMode== 'delete' ){ 
		ok= window.confirm('����Ҫɾ������,\n'+'��ȷ����?')	
	}	
	if(ok==true)
	{
		eval(executedMethod);
	}
}


function confirmButton(operationMode, executedMethod, info){ 
	if(info == undefined){
		info = "";
	} 
	var ok = false 
	if(operationMode== 'input' ){ 
		ok= window.confirm('����Ҫ����'+info+'����,\n'+'��ȷ����?')	
	}	
	else if(operationMode== 'update' ){ 
		ok= window.confirm('����Ҫ�޸�'+info+'����,\n'+'��ȷ����?')	
	}	
	else if(operationMode== 'delete' ){ 
		ok= window.confirm('����Ҫɾ��'+info+'����,\n'+'��ȷ����?')	
	}	
	if(ok==true)
	{
		eval(executedMethod);
	}
}