<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="com.shenghao.arch.manage.user.*"%>
<%@ page import="com.zagerbone.user.*"%>
<html>
<body>
<h1>this is the fault page!</h1>
</body>
</html>
<%
 
  EventResponse eventResponse = (EventResponse)request.getAttribute("result");  
  if(eventResponse.isSuccessFlag()){ 
  if(eventResponse.getFunctionID().equals("F00.00.00.03")){  //�����û�
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  	//out.println("parent.location = 'MainServlet?fid=F00.00.00.02';");
			out.println("parent.location = parent.location;");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.04")){  //�����û�
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.00.02';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.06")){  //ɾ���û�
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("ɾ���ɹ���"));
      out.println("<script language=JavaScript>");
	  //out.println("parent.location = 'MainServlet?fid=F00.00.00.02';");
      out.println("parent.location = parent.location;");
	  out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.13")){  //�޸�����	  
	  String fsr = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�޸ĳɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue='"+fsr+"';");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.11")){  //����������Ϣ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  	//out.println("parent.location = 'MainServlet?fid=F00.00.00.08';");
			%>
			//alert(parent.location);
			<%
	  	out.println("parent.location = parent.location;");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.07")){  //����������Ϣ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���ӳɹ���"));
      out.println("<script language=JavaScript>");
	  //out.println("parent.location = 'MainServlet_sys?fid=F00.00.00.14';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.10")){  //�޸ĸ�����Ϣ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�޸ĳɹ���"));
      out.println("<script language=JavaScript>");
	  //out.println("parent.location = 'MainServlet?fid=F00.00.00.08';");
      out.println("</script>");
      return;
    }
    if(eventResponse.getFunctionID().equals("F00.00.01.01")){  //������ɫ  
	  String rolename = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���ӳɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue='"+rolename+"';");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
    if(eventResponse.getFunctionID().equals("F00.00.01.03")){  //���ý�ɫ
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���óɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.01.02';");
      out.println("</script>");
      return;
    }
    if(eventResponse.getFunctionID().equals("F00.00.01.04")){  //�ָ���ɫ
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�ָ��ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.01.02';");
      out.println("</script>");
      return;
    }
    if(eventResponse.getFunctionID().equals("F00.00.01.05")){  //ɾ����ɫ
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("ɾ���ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.01.02';");
      out.println("</script>");
      return;
    }
    if(eventResponse.getFunctionID().equals("F00.00.01.06")){  //�����ɫȨ��  
	  String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue="+roleid+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
    if(eventResponse.getFunctionID().equals("F00.00.01.08")){  //�����û���ɫ  
	  String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue="+userid+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
    if(eventResponse.getFunctionID().equals("F00.00.00.17")){  //����Ա��ΪУ��
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.04.02';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.18")){  //��Ա����
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'user/user_basic_export.jsp';");
      out.println("</script>");
      return;
    }
  }
  else{
    String errMsg = eventResponse.getErrorMessage();
    String errCode = eventResponse.getErrorCode();
    out.println(SysTrace.showMsg(errMsg));
    return;
  }
%>