/*
 *  * Decompiled with CFR 0_102.
 *   */
package com.kara.algorithms;

import java.io.PrintStream;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class Coal {
    static ArrayList<String> elm5 = new ArrayList();
    static String[] forTraverseArray;
    static String[] forPebbleArray;

    public static void main(String[] args) {
        int arrListSize = Integer.parseInt(args[0]);
        System.out.println("Size of array passed is " + arrListSize);
        Coal c = new Coal();
        c.loadArray(arrListSize);
        c.traverseSort(elm5);
        c.pebbleSort(elm5);
        c.printArraySize(elm5);
    }

    public void traverseSort(ArrayList ar) {
        int i;
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        Calendar cal1 = Calendar.getInstance();
        System.out.println("traverseSort : start  " + sdf.format(cal1.getTime()));
        forTraverseArray = new String[ar.size()];
        for (i = 0; i < forTraverseArray.length; ++i) {
            Coal.forTraverseArray[i] = (String)ar.get(i);
        }
        for (i = 0; i < forTraverseArray.length; ++i) {
            String curr;
            String Max = curr = forTraverseArray[i];
            int maxi = i;
            for (int j = i + 1; j < forTraverseArray.length; ++j) {
                if (Max.compareTo(forTraverseArray[j]) >= 0) continue;
                Max = forTraverseArray[j];
                maxi = j;
            }
            Coal.forTraverseArray[i] = Max;
            Coal.forTraverseArray[maxi] = curr;
        }
        Calendar cal2 = Calendar.getInstance();
        System.out.println("traverseSort : end  " + sdf.format(cal2.getTime()));
    }

    public void pebbleSort(ArrayList ar) {
        int i;
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        Calendar cal3 = Calendar.getInstance();
        System.out.println("pebbleSort : start  " + sdf.format(cal3.getTime()));
        forPebbleArray = new String[ar.size()];
        for (i = 0; i < forPebbleArray.length; ++i) {
            Coal.forPebbleArray[i] = (String)ar.get(i);
        }
        for (i = 0; i < forPebbleArray.length; ++i) {
            for (int j = 0; j < forPebbleArray.length; ++j) {
                if (j + 1 >= forPebbleArray.length || forPebbleArray[j].compareTo(forPebbleArray[j + 1]) >= 0) continue;
                String temp = forPebbleArray[j];
                Coal.forPebbleArray[j] = forPebbleArray[j + 1];
                Coal.forPebbleArray[j + 1] = temp;
            }
        }
        Calendar cal4 = Calendar.getInstance();
        System.out.println("pebbleSort : end  " + sdf.format(cal4.getTime()));
    }

    public void printArraySize(ArrayList elm3) {
        System.out.println("printArray: Size of array is " + elm3.size());
    }

    public void printArray(ArrayList elm3, int limit) {
        System.out.println("printArray: Size of array is " + elm3.size());
        for (int i = 0; i < limit; ++i) {
            System.out.println(elm3.get(i));
        }
    }

    public void printArray(String[] elm3, int limit) {
        System.out.println("printArray: Size of array is " + elm3.length);
        for (int i = 0; i < limit; ++i) {
            System.out.println(elm3[i]);
        }
    }

    public void loadArray(int size) {
        SecureRandom sr = new SecureRandom();
        for (int i = 0; i < size * 1000; ++i) {
            BigInteger bi = new BigInteger(130, sr);
            String ranString = bi.toString(32);
            elm5.add(bi.toString());
        }
    }
}
