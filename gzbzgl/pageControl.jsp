<%@ page contentType = "text/html; charset=GBK" %>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.zagerbone.util.*"%>
<%

EventResponse 		eventResponse 		= (EventResponse)request.getAttribute("result");  
System.out.println("eventResponse.getFunctionID()============================================="+eventResponse.getFunctionID());
if(eventResponse.isSuccessFlag()){ 

	if(eventResponse.getFunctionID().equals("FCL00.00.05.01")){ 
		if(client.core.util.Tools.nvl(request.getParameter("fileName")).equals("ba_dbom_master_id.jsp")){
			String ba_dbom_id = (String)eventResponse.getBody();
			//��ʼ�ύ�ӱ�
			out.println("<script language=JavaScript>");
			%>
			/*
			var totalRow = (parent.parent.editframe_id.totalRow -1);
			for(var jk=1; jk<= totalRow; jk++){
				parent.parent.editframe_id.form_tableBody["CONo"+jk].value = '<%=ba_dbom_id%>';
			}
			*/
            
			<%
			//out.println("parent.parent.editframe_id.form_tableBody.submit();");
			
			out.println("</script>");
			out.println(SysTrace.showMsg("���ӳɹ���"));
		}else{
		  String user_id = (String)eventResponse.getBody();
			out.println(SysTrace.showMsg("���ӳɹ���"));
			out.println("<script language=JavaScript>");
			//out.println("parent.parent.master_listframe.location = '../MainServlet/FBA000.001.009.02';");
			//out.println("parent.parent.master_editframe.formHead.reset();");
			%>
			//parent.location = 'MainServlet_sys?fid=FCL00.00.05.02';
			<%
			out.println("</script>");
		}
		return;
	}
	
	else if(eventResponse.getFunctionID().equals("FCL00.00.05.04")){
		String listMode= Tools.nvl(request.getParameter("listMode")); 
		out.println(SysTrace.showMsg("�޸ĳɹ���"));
		out.println("<script language=JavaScript>");
			%>
			parent.location = 'MainServlet_sys?fid=FCL00.00.05.02&listMode=<%=listMode%>';
			<%
		out.println("</script>");
	}
	
	else if(eventResponse.getFunctionID().equals("FCL00.00.05.05")){ 
		out.println(SysTrace.showMsg("ɾ���ɹ���"));
		out.println("<script language=JavaScript>");
        out.println("parent.location = parent.location;");
		out.println("</script>");
	}
	
}else{
	%>
	<script>
	alert("<%=eventResponse.getErrorMessage()%>");
	//document.getElementById("password").focus();
	</script>
	<%
}
%>

