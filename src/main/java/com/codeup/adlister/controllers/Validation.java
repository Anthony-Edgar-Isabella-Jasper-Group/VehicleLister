package com.codeup.adlister.controllers;

public class Validation {
    public static boolean isValidShort(String input){
        boolean valid = true;
        try{
            Short.parseShort(input);
        }catch(NumberFormatException e){
            valid = false;
        }
        return valid;
    }

    public static boolean isValidFloat(String input){
        boolean valid = true;
        try{
            Float.parseFloat(input);
        }catch(NumberFormatException e){
            valid = false;
        }
        return valid;
    }

    public static boolean isValidInt(String input){
        boolean valid = true;
        try{
            Integer.parseInt(input);
        }catch(NumberFormatException e){
            valid = false;
        }
        return valid;
    }

}
