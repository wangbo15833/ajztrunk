function displayTextSelect(condition, divTextArea,divSelectArea,textID,selectID){
	if(condition)
		document.getElementById(divTextArea).style.display = "block";
	else
		document.getElementById(divTextArea).style.display = "none";
		
	if(condition)
		document.getElementById(divSelectArea).style.display = "none";
	else
		document.getElementById(divSelectArea).style.display = "block";
	//�����ʾ
	document.getElementById(textID).value = "";
	document.getElementById(selectID).value = "";
}


function setValue(textID,selectID){
	//������ʾ
	document.getElementById(textID).value = document.getElementById(selectID).value;	
}