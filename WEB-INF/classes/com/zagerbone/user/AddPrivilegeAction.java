// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   AddPrivilegeAction.java

package com.zagerbone.user;

import com.shenghao.arch.action.BaseActionSupport;
import com.shenghao.arch.event.Event;
import com.shenghao.arch.event.EventResponse;
import com.shenghao.arch.exception.BussinessProcessException;
import java.util.HashMap;

// Referenced classes of package com.zagerbone.user:
//			User, UserDAOFactory, UserDAO

public class AddPrivilegeAction extends BaseActionSupport
{

	public AddPrivilegeAction()
	{
	}

	public EventResponse perform(Event event)
	{
		EventResponse eventresponse = new EventResponse();
		UserDAO userdao = UserDAOFactory.getDAO();
		try
		{
			User user = (User)processEvent(event);
			String s = userdao.addPrivilege(user);
			eventresponse.setSuccessFlag(true);
			eventresponse.setBody(s);
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
		String as[] = (String[])(String[])hashmap.get("roleid");
		HashMap hashmap1 = new HashMap();
		for (int i = 0; i < as.length; i++)
		{
			String s = as[i];
			String s1 = "";
			if (s.equals("F00.00.00.00"))
				s1 = "ϵͳ����";
			else
			if (s.equals("F00.00.02.00"))
				s1 = "֪ͨ����";
			else
			if (s.equals("F00.00.04.00"))
				s1 = "У�ѹ���";
			else
			if (s.equals("F00.00.05.00"))
				s1 = "�鼮����";
			else
			if (s.equals("F00.00.06.00"))
				s1 = "���Ĺ���";
			else
			if (s.equals("F00.00.07.00"))
				s1 = "�ɹ�����";
			else
			if (s.equals("F00.00.08.00"))
				s1 = "���ù���";
			else
			if (s.equals("F00.00.09.00"))
				s1 = "���й���";
			if (!s.equals("123") && !s.equals("234"))
				hashmap1.put(s, s1);
		}

		user.setPrivlist(hashmap1);
		if (user.getProp("userid") == null || user.getProp("userid").equals(""))
			throw new BussinessProcessException("��������userid����Ϊ�գ�");
		else
			return user;
	}
}
