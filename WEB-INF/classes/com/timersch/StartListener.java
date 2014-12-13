package com.timersch;
import java.util.Timer;
import com.timersch.SchManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class StartListener implements ServletContextListener {
  
  private SchManager schManager = null;

  public void contextInitialized(ServletContextEvent event) {
    //timer = new Timer(true);
    //��������ƻ��������ͼ��ʱ��
    //timer.schedule(new MyTask(), 0, 86400000);
	try{
		Thread.sleep(1000);
		System.out.println("----====��ʼʱ�ӹ���====----");
	}catch(Exception e){
		e.printStackTrace();
	}
	schManager = SchManager.getInstance();
	schManager.restartTick();
  }

  public void contextDestroyed(ServletContextEvent event) {
    if(null!=schManager){
		schManager.clearTick();
		System.out.println("----====����ʱ�ӹ���====----");
	}
  }
  
}