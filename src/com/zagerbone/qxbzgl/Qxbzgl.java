// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Qxbzgl.java

package com.zagerbone.qxbzgl;

import java.util.HashMap;

public class Qxbzgl
{

	private String qxbzglid;
	private HashMap extProperties;

	public Qxbzgl()
	{
		extProperties = new HashMap(1);
	}

	public void setQxbzglid(String s)
	{
		qxbzglid = s;
	}

	public String getQxbzglid()
	{
		return qxbzglid;
	}

	public void setProp(String s, String s1)
	{
		extProperties.put(s, s1);
	}

	public String getProp(String s)
	{
		if (extProperties.containsKey(s))
			return (String)extProperties.get(s);
		else
			return null;
	}
}
