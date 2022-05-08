package com.example.WorldPeaceAndroid.tools;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {

    public static String pointFileName(String paperType, String pageId) {
        return Constants.Point_File_Prefix + paperType + "-" + pageId + ".txt";
    }

    public static String pointBgImgName(String paperType, String pageId) {
        return Constants.Point_File_Bg_Prefix + paperType + "-" + pageId + ".png";
    }

    /**
     * 判断给定字符串是否空白串。<br>
     * 空白串是指由空格、制表符、回车符、换行符组成的字符串<br>
     * 若输入字符串为null或空字符串，返回true
     */
    public static boolean isBlank( String input )
    {
        if ( input == null || "".equals( input ) )
            return true;

        for ( int i = 0; i < input.length(); i++ )
        {
            char c = input.charAt( i );
            if ( c != ' ' && c != '\t' && c != '\r' && c != '\n' )
            {
                return false;
            }
        }
        return true;
    }

    /**
     * 截取字符串末尾空格
     */
    public static String trim( String input )
    {
        if(isBlank(input))	return "";
        return input.trim();
    }

    public static boolean strIsNull(String str) {
        if (null != str && !"".equals(str))
            return false;
        return true;
    }

    public static boolean strIsNegativeInteger(String str) {
        if (strIsNull(str))
            return false;
        Pattern p = Pattern.compile("-[1-9]\\d*");
        Matcher m = p.matcher(str);
        if (m.matches())
            return true;
        return false;
    }

    public static boolean strIsPositiveInteger(String str) {
        if (strIsNull(str))
            return false;
        Pattern p = Pattern.compile("[1-9]\\d*");
        Pattern p1 = Pattern.compile("\\+[1-9]\\d*");
        Matcher m = p.matcher(str);
        Matcher m1 = p1.matcher(str);
        if (m.matches() || m1.matches())
            return true;
        return false;
    }

    public static boolean strIsPositiveFloat(String str) {
        if (strIsNull(str))
            return false;
        if (strIsPositiveInteger(str) || strIsNegativeInteger(str))
            return true;
        Pattern p = Pattern.compile("[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*");
        Pattern p1 = Pattern.compile("\\+([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*)");
        Matcher m = p.matcher(str);
        Matcher m1 = p1.matcher(str);
        if (m.matches() || m1.matches())
            return true;
        return false;
    }

    public static int getIntByStr(Object num) {

        if (num != null && strIsPositiveFloat(num.toString())) {
            if (strIsPositiveFloat(num.toString())) {
                return (int)Float.parseFloat(num.toString());
            } else {
                return Integer.valueOf(num.toString());
            }
        }
        return 0;
    }
}