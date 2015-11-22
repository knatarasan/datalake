package com.kara.algorithms;
import java.io.*;
import java.util.*;

public class Juki {

	ArrayList <Song> songList=new ArrayList<Song>();	
	public static void main(String []args){
		new Juki().go();
	}
	
	class ArtistComparator implements Comparator<Song>{
		public int compare(Song song1,Song song2){
			return song1.getArtist().compareTo(song2.getArtist());
		}
	}
	void go(){
		getSongs();
		System.out.println("Print SongList");
		System.out.println(songList);
		
		ArtistComparator artistComparator=new ArtistComparator();
		Collections.sort(songList);
		System.out.println("Print SongList after sort");
		System.out.println(songList);

		HashSet<Song> songSet=new HashSet<Song>();
		songSet.addAll(songList);
		System.out.println("Print SongSet after sort");
		System.out.println(songSet);
		
		
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
		Song song=new Song(tokens[0],tokens[1],tokens[2],tokens[3]);
		songList.add(song);
	}

	
}
