<%@ page contentType="text/html; charset=GBK" %>

<%@ page import="java.util.*"%>
<%@ page import="com.shenghao.arch.event.*"%>
<%@ page import="com.shenghao.arch.util.*"%>
<%@ page import="com.zagerbone.notice.*"%>
<%@ page import="com.zagerbone.user.*"%>

<%
 
  EventResponse eventResponse = (EventResponse)request.getAttribute("result");  
  if(eventResponse.isSuccessFlag()){ 
 
    if(eventResponse.getFunctionID().equals("F00.00.00.01")){  //�û�ע��  
	  String username = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("ע��ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location='/wait.jsp';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F00.00.00.05")){  //�û���½
	  User user = (User)eventResponse.getBody();
	  //���õ�ǰ�û���session;
	  session.setAttribute("curUser",user);
	  out.println("<script language=JavaScript>");
	  out.println("parent.location = 'oasys/index.jsp';");
      out.println("</script>");
      return;
    }
	  /**
	if(eventResponse.getFunctionID().equals("F05.02.01.05")){  //�޸ĵǼǱ�
      String devid = (String)eventResponse.getBody();
	  out.println(SysTrace.showMsg("�޸ĳɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.location = 'ldjc/djb_cx.jsp';");
      out.println("</script>");
      return;
    }
    
	if(eventResponse.getFunctionID().equals("F05.02.04.01")){  //��������
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���������ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue="+ywxh+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.04.03")){  //ȡ������
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("ȡ���ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F05.02.01.02';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.01.04")){  //������
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("������ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.returnValue="+ywxh+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
	
	if(eventResponse.getFunctionID().equals("F05.02.02.04")){  //��д���Ч��
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("���Ч����д�ɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.location = 'ldjc/aj_cx.jsp';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.02.07")){  //�޸ļ��Ч��
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.location = 'ldjc/aj_cx.jsp';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.02.08")){  //�޸ļ��Ч��
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.returnValue="+ywxh+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.05.02")){  //ɾ������
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("����ɾ���ɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.location = 'MainServlet?fid=F05.02.02.01';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.04.04")){  //ȡ���᰸
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("ȡ���ɹ���"));
      out.println("<script language=JavaScript>");
	  out.println("parent.location = 'MainServlet?fid=F05.02.02.01';");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.02.03")){  //��д�᰸����
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("��д�ɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.returnValue="+ywxh+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
	if(eventResponse.getFunctionID().equals("F05.02.04.02")){  //�᰸����
      String ywxh = (String)eventResponse.getBody();
      out.println(SysTrace.showMsg("�����ɹ���"));
      out.println("<script language=JavaScript>");
      out.println("parent.returnValue="+ywxh+";");
      out.println("parent.close();");
      out.println("</script>");
      return;
    }
	*/
  }
  else{
    String errMsg = eventResponse.getErrorMessage();
    String errCode = eventResponse.getErrorCode();
    out.println(SysTrace.showMsg(errMsg));
    return;
  }
%>