// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ProcessContentObj.java

package com.zagerbone.util.tools;

import com.zagerbone.util.*;
import com.zagerbone.util.actions.Templet_0001_Action;
import com.zagerbone.util.templet.Templet_0001_DAO;
import sun.jdbc.rowset.CachedRowSet;

public class ProcessContentObj
{

	public ProcessContentObj()
	{
	}

	public static void processContent_delNull(Templet_0001_Action templet_0001_action, DBTrans dbtrans, Templet_0001_DAO templet_0001_dao, GeneralDataArray generaldataarray, CachedRowSet cachedrowset, GeneralApps generalapps)
		throws Exception
	{
		Templet_0001_DAO templet_0001_dao1 = templet_0001_action.getNormalDAO();
		GeneralDataArray generaldataarray1 = templet_0001_action.getNormalDATA();
		CachedRowSet cachedrowset1 = templet_0001_action.getNormalDisp();
		GeneralApps generalapps1 = templet_0001_action.getNormalApps();
		DBTrans dbtrans1 = templet_0001_action.getDBTrans();
		if (templet_0001_dao == null)
			templet_0001_dao = templet_0001_dao1;
		if (generaldataarray == null)
			generaldataarray = templet_0001_action.getNormalDATA();
		if (cachedrowset == null)
			cachedrowset = cachedrowset1;
		if (generalapps == null)
			generalapps = generalapps1;
		if (dbtrans == null)
			dbtrans = dbtrans1;
	}
}
