package com.kara.algorithms;

public class Song {
	String title;
	String	artist;
	String	rating;
	String	bpm;
	
	public Song(String title,String artist,String rating,String bpm){
		this.title=title;
		this.artist=artist;
		this.rating=rating;
		this.bpm=bpm;
	}
	
	public String getTitle(){
		return title;
	}
}
