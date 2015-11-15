package com.kara.algorithms;
import java.io.*;
import java.util.*;

public class Juki {

	ArrayList <String> songList=new ArrayList<String>();	
	public static void main(String []args){
		new Juki().go();
	}
	
	void go(){
		getSongs();
		System.out.println(songList);
		System.out.println("sorting");
		Collections.sort(songList);
		System.out.println(songList);
	}
	void getSongs(){
		try{
			File file=new File("/home/kannappan/datalake/algo/java/SongList.txt");
			BufferedReader reader=new BufferedReader(new FileReader(file));
			String line=null;
			while(   (line=reader.readLine())!=null    ){
				addSong(line);
				
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	void addSong(String st){
		String [] tokens=st.split("/");
		songList.add(tokens[0]);
	}

	
}
