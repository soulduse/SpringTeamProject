/*****************************************************************************
 * 파일이름 : TotalDate.java
 * 파일내용 : 사이트에서 사용하기 위한 원하는 형태의 날짜를 리턴한다.
*****************************************************************************/
package com.listen.base.util;

import java.util.*;
import java.text.*;

public class TotalDate
{
	private static String pattern = "yyyy년 M월 d일  a h시 m분";
	private static Locale nation = new Locale("ko","KOREA");

	/**
	 * 내용		: 오늘 날짜를 Default Format으로 return
	 * 입력 값	:
	 * 출력 값	: String result
	*/
	public static String getToday()
	{
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, nation);
		return formatter.format(new Date());
	}

	/**
	 * 내용		: 오늘 날짜를 입력한 Format으로 return
	 * 입력 값	: String datePattern
	 * 출력 값	: String result
	*/
	public static String getToday(String datePattern)
	{
		SimpleDateFormat formatter = new SimpleDateFormat(datePattern, nation);
		return formatter.format(new Date());
	}

	/**
	 * 내용		: 원하는 시기의 일단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
	 * 입력 값	: int change
	 * 출력 값	: String result
	*/
	public static String getDayDate(int change)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.DATE, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: 원하는 시기의 일단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
	 * 입력 값	: String datePattern, int change
	 * 출력 값	: String result
	*/
	public static String getDayDate(String datePattern, int change)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.DATE, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: 원하는 시기의 주단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
	 * 입력 값	: int change
	 * 출력 값	: String result
	*/
	public static String getWeekDate(int change)
	{
		change = change * 7;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.DATE, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: 원하는 시기의 주단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
	 * 입력 값	: String datePattern, int change
	 * 출력 값	: String result
	*/
	public static String getWeekDate(String datePattern, int change)
	{
		change = change * 7;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.DATE, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: 원하는 시기의 월단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
	 * 입력 값	: String datePattern, int change
	 * 출력 값	: String result
	*/
	public static String getMonthDate(int change)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.MONTH, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: 원하는 시기의 월단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
	 * 입력 값	: String datePattern, int change
	 * 출력 값	: String result
	*/
	public static String getMonthDate(String datePattern, int change)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.MONTH, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: 원하는 시기의 년단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
	 * 입력 값	: String datePattern, int change
	 * 출력 값	: String result
	*/
	public static String getYearDate(int change)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.YEAR, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: 원하는 시기의 년단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
	 * 입력 값	: String datePattern, int change
	 * 출력 값	: String result
	*/
	public static String getYearDate(String datePattern, int change)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.YEAR, change);
		return formatter.format(cal.getTime());
	}

	/**
	 * 내용		: form부터 to까지 일수를 구하는 METHOD
	 * 입력 값	: String yyyyMMdd, String yyyyMMdd
	 * 출력 값	: String result
	*/
	public static int daysBetween(String from, String to, String datePattern)
	{
		SimpleDateFormat format = new SimpleDateFormat(datePattern, Locale.KOREA);
		Date date1 = null;
		Date date2 = null;

		try {
			date1 = format.parse(from);
			date2 = format.parse(to);
		} catch(ParseException e) {
			return -999;
		}

		long duration = date2.getTime() - date1.getTime();

		return (int)(duration/(1000 * 60 * 60 * 24));
	}
}