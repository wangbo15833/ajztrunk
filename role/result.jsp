<%@ page contentType="text/html; charset=gb2312" %>

<%@ page import="java.util.*"%>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="com.shenghao.arch.manage.user.*"%>
<%@ page import="com.zagerbone.user.*"%>

<%
 try{
  EventResponse eventResponse = (EventResponse)request.getAttribute("result");  
  String fid = eventResponse.getFunctionID();
  
  if(eventResponse.isSuccessFlag()){ 
  if(fid.equals("F00.00.00.03")){  //������ɫ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  	//out.println("parent.location = 'MainServlet?fid=F00.00.00.02';");
			out.println("parent.location = parent.location;");
      out.println("</script>");
      return;
    }
	if(fid.equals("F00.00.00.04")){  //���ý�ɫ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.00.02';");
      out.println("</script>");
      return;
    }
	if(fid.equals("UII00.00.00.02")){  //ɾ����ɫ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("ɾ���ɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.location.reload(); ");
	  out.println("</script>");
      return;
    }
	if(fid.equals("UII00.00.00.04")){  //�޸Ľ�ɫ	  
	  String fsr = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�޸ĳɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet_sys?fid=UII00.00.00.01';");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
	if(fid.equals("F00.00.00.11")){  //����������Ϣ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  	//out.println("parent.location = 'MainServlet?fid=F00.00.00.08';");
	  out.println("parent.location = parent.location;");
      out.println("</script>");
      return;
    }
	if(fid.equals("UII00.00.00.03")){  //����������Ϣ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���ӳɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet_sys?fid=UII00.00.00.01';");
      out.println("</script>");
      return;
    }
	if(fid.equals("F00.00.00.10")){  //�޸ĸ�����Ϣ
      String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�޸ĳɹ���"));
      out.println("<script language=JavaScript>");
	  //out.println("parent.location = 'MainServlet?fid=F00.00.00.08';");
      out.println("</script>");
      return;
    }
    if(fid.equals("F00.00.01.01")){  //������ɫ  
	  String rolename = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���ӳɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue='"+rolename+"';");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
    if(fid.equals("F00.00.01.03")){  //���ý�ɫ
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���óɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.01.02';");
      out.println("</script>");
      return;
    }
    if(fid.equals("F00.00.01.04")){  //�ָ���ɫ
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�ָ��ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.01.02';");
      out.println("</script>");
      return;
    }
    if(fid.equals("F00.00.01.05")){  //ɾ����ɫ
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("ɾ���ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.01.02';");
      out.println("</script>");
      return;
    }
    if(fid.equals("F00.00.01.06")){  //�����ɫȨ��  
	  String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue="+roleid+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
    if(fid.equals("F00.00.01.08")){  //�����ɫ  
	  String userid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue="+userid+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
    if(fid.equals("F00.00.00.17")){  //����Ա��ΪУ��
      String roleid = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F00.00.04.02';");
      out.println("</script>");
      return;
    }
	if(fid.equals("F00.00.00.18")){  //��Ա����
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
  }catch(Exception e){
	e.printStackTrace();
  }
%>