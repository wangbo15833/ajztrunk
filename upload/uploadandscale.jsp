    <%@ page autoFlush="false" contentType="text/html;charset=gb2312" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*,java.io.FileInputStream,java.io.FileOutputStream,java.awt.*"%>  
    <!--%@ page import="com.blog.vo.*" %-->  
    <%  
    SmartUpload mySmartUpload =new SmartUpload();  
    long file_size_max=4000000;  
    String fileName2="",ext="",testvar="";  
    String url="uploadfile/images/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ���  
    //��ʼ��  
    mySmartUpload.initialize(pageContext);  
    //ֻ�������ش����ļ�  
    try {  
    mySmartUpload.setAllowedFilesList("jpg,gif,JPG,GIF");  
    //�����ļ�   
    mySmartUpload.upload();  
    } catch (Exception e){  
    %>  
    <SCRIPT language=javascript>  
    alert("ֻ�����ϴ�.jpg��.gif����ͼƬ�ļ�");  
    window.location='face.jsp';  
    </script>  
    <%  
    }  
    try{   
    com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);  
    if (myFile.isMissing()){%>  
    <SCRIPT language=javascript>  
    alert("����ѡ��Ҫ�ϴ����ļ�");  
    window.location='face.jsp';  
    </script>  
    <%}  
    else{  
    //String myFileName=myFile.getFileName(); //ȡ�����ص��ļ����ļ���  
    ext= myFile.getFileExt(); //ȡ�ú�׺��  
    int file_size=myFile.getSize(); //ȡ���ļ��Ĵ�С   
    String saveurl="";  
    if(file_size<file_size_max){  
    //�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ  
    Calendar calendar = Calendar.getInstance();  
    String filename = String.valueOf(calendar.getTimeInMillis());   
    saveurl=request.getRealPath("/")+url;  
    saveurl+=filename+"."+ext; //����·��  
    myFile.saveAs(saveurl,mySmartUpload.SAVE_PHYSICAL);  
    //-----------------------�ϴ���ɣ���ʼ��������ͼ-------------------------   
    java.io.File file = new java.io.File(saveurl); //����ղ��ϴ����ļ�  
    String newurl=request.getRealPath("/")+url+filename+"_min."+ext; //�µ�����ͼ�����ַ  
    Image src = javax.imageio.ImageIO.read(file); //����Image����  
    float tagsize=110;  
    int old_w=src.getWidth(null); //�õ�Դͼ��  
    int old_h=src.getHeight(null);   
    int new_w=0;  
    int new_h=0; //�õ�Դͼ��  
    int tempsize;  
    float tempdouble;   
    if(old_w>old_h){  
    tempdouble=old_w/tagsize;  
    }else{  
    tempdouble=old_h/tagsize;  
    }  
    new_w=Math.round(old_w/tempdouble);  
    new_h=Math.round(old_h/tempdouble);//������ͼ����  
    BufferedImage image = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);//����һ��BufferedImage����Ϊͼ��*������   
    Graphics g = image.getGraphics(); //����һ����ͼ���������л���ͼ��   
    g.drawImage(src,0,0,new_w,new_h,null); //��ԭͼ���������������BufferedImage   
    g.setFont(new Font("Times New Roman",Font.PLAIN,24)); //�趨�ı�����   
    String rand = "";   
    g.setColor(Color.red); //�趨�ı���ɫ   
    g.drawString(rand,new_w-200,new_h-10); //��BufferedImageд���ı��ַ�   
    g.dispose(); //ʹ������Ч  
      
    FileOutputStream newimage=new FileOutputStream(newurl); //������ļ���  
    JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);   
    encoder.encode(image); //��JPEG����  
    newimage.close();   
    HashMap hp_user = (HashMap)request.getSession().getAttribute("hp_user");  
    //ui.setFace(url+filename+"_min."+ext);  
    //session.setAttribute("userinfo",ui);  
    //String turl="face.jsp?src="+url+filename+"_min."+ext;  
    //out.print("<SCRIPT language='javascript'>");  
    //out.print("window.location='"+turl+"'");  
    //out.print("</SCRIPT>"); 
    out.print("<SCRIPT language='javascript'>");  
    out.print("alert('����ͼ���ɳɹ�');");  
    out.print("</SCRIPT>");  
    }  
    else{  
    out.print("<SCRIPT language='javascript'>");  
    out.print("alert('�ϴ��ļ���С���ܳ���"+(file_size_max/1000)+"K');");  
    out.print("window.location='face.jsp;'");  
    out.print("</SCRIPT>");  
    }  
    }  
    }catch (Exception e){  
      
    e.toString();  
      
    }  
      
    %>  