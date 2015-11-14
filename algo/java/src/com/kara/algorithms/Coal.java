package com.kara.algorithms; 


import java.security.SecureRandom; 
import java.math.*; 
import java.util.ArrayList;

import java.text.SimpleDateFormat;
import java.util.Calendar;
/*
 * USAGE
 * java com.kara.algorithms.Coal 100
 */

public class Coal { 
	//static String elementName[]={"Hydrogen","Helium","Lithium","Beryllium","Boron","Carbon","Nitrogen","Oxygen","Fluorine","Neon","Sodium","Magnesium","Aluminum","Silicon","Phosphorus","Sulfur","Chlorine","Argon","Potassium","Calcium","Scandium","Titanium","Vanadium","Chromium","Manganese","Iron","Cobalt","Nickel","Copper","Zinc","Gallium","Germanium","Arsenic","Selenium","Bromine","Krypton","Rubidium","Strontium","Yttrium","Zirconium","Niobium","Molybdenum","Technetium","Ruthenium","Rhodium","Palladium","Silver","Cadmium","Indium","Tin","Antimony","Tellurium","Iodine","Xenon","Cesium","Barium","Lanthanum","Cerium","Praseodymium","Neodymium","Promethium","Samarium","Europium","Gadolinium","Terbium","Dysprosium","Holmium","Erbium","Thulium","Ytterbium","Lutetium","Hafnium","Tantalum","Tungsten","Rhenium","Osmium","Iridium","Platinum","Gold","Mercury","Thallium","Lead","Bismuth","Polonium","Astatine","Radon","Francium","Radium","Actinium","Thorium","Protactinium","Uranium","Neptunium","Plutonium","Americium","Curium","Berkelium","Californium","Einsteinium","Fermium","Mendelevium","Nobelium","Lawrencium","Rutherfordium","Dubnium","Seaborgium","Bohrium","Hassium","Meitnerium"}; 
	//static String elm[]={"H1","H3","H2","HH3","HH4","C","N","O"}; 
	static ArrayList <String> elm5=new ArrayList();
	static String []forTraverseArray;
	static String []forPebbleArray;
	public static void main(String [] args){
		int arrListSize=Integer.parseInt(args[0]);
		System.out.println("Size of array passed is "+arrListSize);
		Coal c= new Coal(); 
		//c.pebbleSort(elm); 
		//c.traverseSort(elm); 
		c.loadArray(arrListSize);
		
		c.traverseSort(elm5);
		c.pebbleSort(elm5);
		c.printArraySize(elm5);
		//c.printArray(elm5,4);
		//c.printArray(forTraverseArray,10);
	} 
	public void traverseSort(ArrayList ar){
		
		
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
          
        Calendar cal1 = Calendar.getInstance();
		System.out.println("traverseSort : start  "+sdf.format(cal1.getTime()));		
		forTraverseArray=new String[ar.size()];

		for(int i=0;i<forTraverseArray.length;i++){
			forTraverseArray[i]=(String)ar.get(i);
		}
		
		for(int i=0;i<forTraverseArray.length;i++){ 
			String curr=forTraverseArray[i]; 
			String Max=curr; 
			int maxi=i; 
			for(int j=i+1;j<forTraverseArray.length;j++){ 
				if(Max.compareTo(forTraverseArray[j])<0){ 
					Max=forTraverseArray[j]; 
					maxi=j; 
				} 
			} 
			forTraverseArray[i]=Max; 
			forTraverseArray[maxi]=curr; 
		} 
		Calendar cal2 = Calendar.getInstance();
		System.out.println("traverseSort : end  "+sdf.format(cal2.getTime()));
	} 
	

	
	public void pebbleSort(ArrayList ar){ 
		
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        
        Calendar cal3 = Calendar.getInstance();
		System.out.println("pebbleSort : start  "+sdf.format(cal3.getTime()));		

		
		forPebbleArray=new String[ar.size()];

		for(int i=0;i<forPebbleArray.length;i++){
			forPebbleArray[i]=(String)ar.get(i);
		}
		
		
		
		for(int i=0;i<forPebbleArray.length;i++){ 
			for(int j=0;j<forPebbleArray.length;j++){ 
				if(  (j+1)< forPebbleArray.length){ 
					if(forPebbleArray[j].compareTo(forPebbleArray[j+1])<0 ){ 
						String temp=forPebbleArray[j]; 
						forPebbleArray[j]=forPebbleArray[j+1]; 
						forPebbleArray[j+1]=temp; 
					} 
				} 
			} 
		} 
		Calendar cal4 = Calendar.getInstance();
		System.out.println("pebbleSort : end  "+sdf.format(cal4.getTime()));		

	}
	
	public void printArraySize(ArrayList elm3){ 
		System.out.println("printArray: Size of array is "+elm3.size()); 
		 
		//for(int i=0;i<elm3.size();i++){ 
			//System.out.println(elm3.get(i)); 
		//} 
	}
	public void printArray(ArrayList elm3,int limit){ 
		System.out.println("printArray: Size of array is "+elm3.size()); 
		 
		for(int i=0;i<limit;i++){ 
			System.out.println(elm3.get(i)); 
		} 
	}
	
	public void printArray(String[] elm3,int limit){ 
		System.out.println("printArray: Size of array is "+elm3.length); 
		 
		for(int i=0;i<limit;i++){ 
			System.out.println(elm3[i]); 
		} 
	}

	
	public void loadArray(int size){

		SecureRandom sr=new SecureRandom(); 
		for(int i=0;i<size*1000;i++){ 
			BigInteger bi=new BigInteger(130, sr);
			String ranString=bi.toString(32);
			//return new BigInteger(130, random).toString(32);
			elm5.add(bi.toString()); 
		} 
		//System.out.println(bi.toString(32)); 
	} 
} 