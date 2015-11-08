package com.kara.algorithms;


import java.util.Collections;
/*
Can you write code , a function receives a String, 
if individual characters are elements from periodic table, return true else false.

Eg : 	isElement("Carbon")  returns true
		because  C Ar B O N - are elements
	isElement("Clinton") returns false
		because	C Li N T(not element) or To is not element 
*/

public class Carbon{

static String elementSymbol[]={"H","He","Li","Be","B","C","N","O","F","Ne","Na","Mg","Al","Si","P","S","Cl","Ar","K","Ca","Sc","Ti","V","Cr","Mn","Fe","Co","Ni","Cu","Zn","Ga","Ge","As","Se","Br","Kr","Rb","Sr","Y","Zr","Nb","Mo","Tc","Ru","Rh","Pd","Ag","Cd","In","Sn","Sb","Te","I","Xe","Cs","Ba","La","Ce","Pr","Nd","Pm","Sm","Eu","Gd","Tb","Dy","Ho","Er","Tm","Yb","Lu","Hf","Ta","W","Re","Os","Ir","Pt","Au","Hg","Tl","Pb","Bi","Po","At","Rn","Fr","Ra","Ac","Th","Pa","U","Np","Pu","Am","Cm","Bk","Cf","Es","Fm","Md","No","Lr","Rf","Db","Sg","Bh","Hs","Mt"};
static String elementName[]={"Hydrogen","Helium","Lithium","Beryllium","Boron","Carbon","Nitrogen","Oxygen","Fluorine","Neon","Sodium","Magnesium","Aluminum","Silicon","Phosphorus","Sulfur","Chlorine","Argon","Potassium","Calcium","Scandium","Titanium","Vanadium","Chromium","Manganese","Iron","Cobalt","Nickel","Copper","Zinc","Gallium","Germanium","Arsenic","Selenium","Bromine","Krypton","Rubidium","Strontium","Yttrium","Zirconium","Niobium","Molybdenum","Technetium","Ruthenium","Rhodium","Palladium","Silver","Cadmium","Indium","Tin","Antimony","Tellurium","Iodine","Xenon","Cesium","Barium","Lanthanum","Cerium","Praseodymium","Neodymium","Promethium","Samarium","Europium","Gadolinium","Terbium","Dysprosium","Holmium","Erbium","Thulium","Ytterbium","Lutetium","Hafnium","Tantalum","Tungsten","Rhenium","Osmium","Iridium","Platinum","Gold","Mercury","Thallium","Lead","Bismuth","Polonium","Astatine","Radon","Francium","Radium","Actinium","Thorium","Protactinium","Uranium","Neptunium","Plutonium","Americium","Curium","Berkelium","Californium","Einsteinium","Fermium","Mendelevium","Nobelium","Lawrencium","Rutherfordium","Dubnium","Seaborgium","Bohrium","Hassium","Meitnerium"};

	public static void main(String st[]){
		String elm[]=elementSymbol;

		
		for(int i=0;i<elm.length;i++){
			String cur = elm[i];
			String Max=cur;
			int Maxi=i;
			for(int j=i+1;j<elm.length;j++){
				if( Max.compareTo(elm[j]) < 0 ){
					Max=elm[j];
					Maxi=j;
				}
			}
			elm[i]=Max;
			elm[Maxi]=cur;
		}
//		C A R B O N
//		Cl inton
		//String word="carbon";
		String word="clinton";
		//String word="CARBON";
		System.out.println(word+"  is tested  "+isElementable(word) );
		
	}
	
	static boolean isElementable(String checkString){
		System.out.println("Parameter received is "+checkString);
		char check[]=checkString.toCharArray();
		
		for(int i=0;i<check.length;i++){
			String check1="";
			String check2="";
			
			if(i<check.length-1){
				check1=""+check[i];
				check2=""+check[i]+""+check[i+1];
			}else if (i==check.length-1){
				check1=""+check[i];
			}
			
			if( isElement(check1) || isElement(check2)   ){
				System.out.println(" "+check1+" "+isElement(check1)+" "+check2+" "+isElement(check2));
			}else{
				return false;
			}
		}
		return true;
	}
	static boolean isElement(String elment){

		for(String el:elementSymbol){
			if( el.compareToIgnoreCase(elment)==0){
				return true;
			}
		}
		return false;
	}
}
	