package com.atguigu.dao;

public class MyStringUtils {

    public static boolean isEmpty(String str) {
        if (str == null) {
            return true;
        }

        if (str.trim().equals("")) {
            return true;
        }
        
        return false;
    }
    
    public static boolean isInteger(String condition){
        try {
            int int1 = Integer.parseInt(condition);
        } catch (NumberFormatException e) {
           return false;
        }
        return true;
    }
    
    public static boolean isDouble(String condition){
        try {
            double int1 = Double.parseDouble(condition);
        } catch (NumberFormatException e) {
           return false;
        }
        return true;
    }
}

