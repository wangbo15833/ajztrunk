// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DeleteUserAction.java

package com.zagerbone.user;

import com.shenghao.arch.action.BaseActionSupport;
import com.shenghao.arch.event.Event;
import com.shenghao.arch.event.EventResponse;
import com.shenghao.arch.exception.BussinessProcessException;
import java.util.HashMap;
import org.apache.log4j.Logger;

// Referenced classes of package com.zagerbone.user:
//			User, UserDAOFactory, UserDAO

public class DeleteUserAction extends BaseActionSupport
{

	public DeleteUserAction()
	{
	}

	public EventResponse perform(Event event)
	{
		EventResponse eventresponse = new EventResponse();
		UserDAO userdao = UserDAOFactory.getDAO();
		try
		{
			log.info("userid11111===================================");
			String s = (String)processEvent(event);
			String s1 = userdao.deleteUser(s);
			eventresponse.setSuccessFlag(true);
			eventresponse.setBody(s1);
		}
		catch (Exception exception)
		{
			eventresponse.setSuccessFlag(false);
			eventresponse.setErrorCode(event.getFunctionID());
			eventresponse.setErrorMessage(exception.getMessage().replace('\n', ' '));
			return eventresponse;
		}
		return eventresponse;
	}

	public Object processEvent(Event event)
		throws BussinessProcessException
	{
		User user = new User();
		HashMap hashmap = event.getBody();
		user.setProp("userid", (String)hashmap.get("userid"));
		log.info((new StringBuilder()).append("userid===================================").append(hashmap.get("userid")).toString());
		if (user.getProp("userid") == null || user.getProp("userid").equals(""))
			throw new BussinessProcessException("��������userid����Ϊ�գ�");
		else
			return user.getProp("userid");
	}
}
