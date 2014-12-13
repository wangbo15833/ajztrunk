package com.zagerbone.util;

import java.util.*;
import org.apache.log4j.Logger;


public class Query
{

	private int totalNum;//����
	private int rowsPerPage;//ÿҳ����
	private int currentPageNum;//��ǰҳ��
	private String appTableType;//Ӧ�ñ�����
	private String appsLForder;//Ӧ���ļ���
	private String display_mode;//��ʾģʽ
	private String pageType;//ҳ����
	private String orderType;//��������
	private String queryString;//��ѯ�ַ���
	private String sql;//?
	private Object conditionBody;//�����壿
	private Object result_1Body;//�����
	private String whereConExpr;//where ���
	private int minRow;//��С�У�
	private int addRow;//�����У�
	private StringBuffer strSql_queryCon;//��ѯ�����

	public Query()
	{
		totalNum = 0;
		rowsPerPage = 15;
		currentPageNum = 1;
		appTableType = "";
		appsLForder = "";
		display_mode = "";
		pageType = "";
		orderType = "";
		queryString = "";
		whereConExpr = "";
		minRow = 0;
		addRow = 0;
		totalNum = 0;
		rowsPerPage = 15;
		currentPageNum = 1;
		pageType = "";
		queryString = "";
		sql = "";
	}

	public void info()
	{
		Logger logger = Logger.getLogger(SysTrace.DBLOGGER);
		conditionBody = (HashMap)getConditionBody();
		logger.info((new StringBuilder()).append("conditionBody=").append(conditionBody).toString());
	}

	public Object getConditionBody()
	{
		return conditionBody;
	}

	public void setConditionBody(Object obj)
	{
		conditionBody = obj;
	}

	public Object getResult_1Body()
	{
		return result_1Body;
	}

	public void setResult_1Body(Object obj)
	{
		result_1Body = obj;
	}

	public int getCurrentPageNum()
	{
		return currentPageNum;
	}

	public void setCurrentPageNum(int i)
	{
		currentPageNum = i;
	}

	public String getWhereConExpr()
	{
		return whereConExpr;
	}

	public void setWhereConExpr(String s)
	{
		whereConExpr = s;
	}

	public String getAppTableType()
	{
		return appTableType;
	}

	public void setAppTableType(String s)
	{
		appTableType = s;
	}

	public String getAppsLForder()
	{
		return appsLForder;
	}

	public void setAppsLForder(String s)
	{
		appsLForder = s;
	}

	public String getPageType()
	{
		return pageType;
	}

	public void setPageType(String s)
	{
		pageType = s;
	}

	public String getOrderType()
	{
		return orderType;
	}

	public void setOrderType(String s)
	{
		orderType = s;
	}

	public String getQueryString()
	{
		System.out.println("=====================getQueryString==============================="+queryString);
		return queryString;
	}

	public void setQueryString(String s)
	{
		queryString = s;
		System.out.println("==========================getQueryString=========================="+s);
	}

	public int getRowsPerPage()
	{
		return rowsPerPage;
	}

	public void setRowsPerPage(int i)
	{
		rowsPerPage = i;
	}

	public String getSql()
	{
		return sql;
	}

	public void setSql(String s)
	{
		sql = s;
	}

	public int getTotalNum()
	{
		return totalNum;
	}

	public void setTotalNum(int i)
	{
		totalNum = i;
	}

	public int getPreviousPageNum()
	{
		return currentPageNum - 1 > 0 ? currentPageNum - 1 : 1;
	}

	public int getNextPageNum()
	{
		return currentPageNum + 1 > getMaxPageNum() ? currentPageNum : currentPageNum + 1;
	}

	public int getMinPageNum()
	{
		return 1;
	}

	public int getMaxPageNum()
	{
		int i = totalNum / rowsPerPage;
		if (i * rowsPerPage < totalNum)
			return i + 1;
		else
			return i;
	}

	public String getXPageNum(int i)
	{
		int j = i;
		if (j > getMaxPageNum())
			j = getMaxPageNum();
		if (j < 1)
			j = 1;
		return (new StringBuilder()).append(queryString).append("&page=").append(i).append("&total=").append(totalNum).toString();
	}

	public String getMinPage()
	{
		return (new StringBuilder()).append(queryString).append("&page=").append(getMinPageNum()).append("&total=").append(totalNum).toString();
	}

	public String getPreviousPage()
	{
		return (new StringBuilder()).append(queryString).append("&page=").append(getPreviousPageNum()).append("&total=").append(totalNum).toString();
	}

	public String getNextPage()
	{
		return (new StringBuilder()).append(queryString).append("&page=").append(getNextPageNum()).append("&total=").append(totalNum).toString();
	}

	public String getMaxPage()
	{
		return (new StringBuilder()).append(queryString).append("&page=").append(getMaxPageNum()).append("&total=").append(totalNum).toString();
	}

	public String getXPage()
	{
		return (new StringBuilder()).append(queryString).append("&total=").append(totalNum).append("&page=").toString();
	}

	public void setSecurePage()
	{
		if (getCurrentPageNum() <= 0)
			setCurrentPageNum(1);
	}

	public int getMinRow()
	{
		return minRow;
	}

	public void setMinRow()
	{
		minRow = getRowsPerPage() * (getCurrentPageNum() - 1);
	}

	public int getAddRow()
	{
		return addRow;
	}

	public void setAddRow()
	{
		addRow = getRowsPerPage() > getTotalNum() - getMinRow() ? getTotalNum() - getMinRow() : getRowsPerPage();
	}

	public void setQueryCon()
	{
		setSecurePage();
		setMinRow();
		setAddRow();
	}

	public void setStrSql_queryCon(StringBuffer stringbuffer)
	{
		strSql_queryCon = stringbuffer;
	}

	public StringBuffer getStrSql_queryCon()
	{
		return strSql_queryCon;
	}

	public String getDisplay_mode()
	{
		String s = "ȫ����¼";
		HashMap hashmap = (HashMap)getConditionBody();
		Set set = hashmap.entrySet();
		Iterator iterator = set.iterator();
		Object obj = null;
		Object obj1 = null;
		Object obj2 = null;
		do
		{
			if (!iterator.hasNext())
				break;
			java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
			String s1 = Tools.nvl((String)entry.getValue());
			String s2 = Tools.nvl((String)entry.getKey());
			if (!s2.equals("feeFlag") && !s1.equals(""))
				s = "�������˼�¼";
		} while (true);
		return s;
	}
}
